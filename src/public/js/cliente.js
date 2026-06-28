// Variável de estado para controle
let estado = {
  produtos: [],
  complementos: [],

  produtoSelecionado: null,
  complementosSelecionados: [],
  precoTotal: 0,

  carrinho: [],
};

const modal = document.querySelector(".modal");

// Quando a tela é carregada:
// - Busca e salva as informações dos produtos e dos complementos
// - Rederiza os cards dos produtos
window.onload = async () => {
  await buscarInformacoesDaAPI();
  renderizarCardProdutos();
};

async function buscarInformacoesDaAPI() {
  const fetchProdutos = await fetch("http://localhost:3040/infos/produtos");
  const produtos = await fetchProdutos.json();
  estado.produtos = produtos.dados;

  const fetchComplementos = await fetch(
    "http://localhost:3040/infos/complementos",
  );
  const complementos = await fetchComplementos.json();
  estado.complementos = complementos.dados;
}

// Renderiza um card novo para cada produto
function renderizarCardProdutos() {
  estado.produtos.forEach((produto) => {
    document.querySelector(".cards").append(criarCard(produto));
  });
}

// Cria todos os elementos do card com as informações do produto
function criarCard(produto) {
  const card = document.createElement("article");
  card.classList.add("produto-card");

  const figure = document.createElement("figure");
  figure.classList.add("produto-figure");

  const img = document.createElement("img");
  img.classList.add("produto-imagem");
  img.src = `/images/produtos/${produto.imagem}`;

  figure.append(img);

  const section = document.createElement("section");
  section.classList.add("produto-info");

  const h2 = document.createElement("h2");
  h2.classList.add("produto-nome");
  h2.innerText = produto.nome;

  const pT = document.createElement("p");
  pT.classList.add("produto-tamanho");
  pT.innerText = produto.tamanho;

  const pP = document.createElement("p");
  pP.classList.add("produto-preco");
  pP.innerText = `R$${produto.preco}`;

  const footer = document.createElement("footer");
  footer.classList.add("produto-footer");

  const button = document.createElement("button");
  button.classList.add("btn-adicionar");
  button.addEventListener("click", () => adicionar(produto));
  button.innerText = "Adicionar";

  footer.append(pP, button);

  section.append(h2, pT, footer);

  card.append(figure, section);

  return card;
}

function abrirModal() {
  preencherModal()
  modal.showModal();
}

function fecharModal() {
  modal.close();
  estado.produtoSelecionado = null;
  estado.complementosSelecionados = [];
  estado.precoTotal = 0
  document.querySelector(".complementos").innerHTML = ""
}

// Quando um elemento for adicionado:
// - Adicionado à variável de estado
// - Se pode ter complementos:
// - - Abre o modal de complementos
// - Se não:
// - - Adiciona ao carrinho
function adicionar(produto) {
  estado.produtoSelecionado = produto;
  estado.precoTotal = calcularPrecoTotalItem()

  if (produto.pode_complementos === true) {
    abrirModal();
  } else {
    confirmarAdd();
  }
}

// Preenche o modal com as informações do produto e os complementos
function preencherModal() {
  document.querySelector(".modal-produto-imagem").src =
    `/images/produtos/${estado.produtoSelecionado.imagem}`;
  document.querySelector(".modal-produto-nome").innerText = estado.produtoSelecionado.nome
  document.querySelector(".modal-produto-descricao").innerText = estado.produtoSelecionado.descricao
  atualizarDisplayPreco()

  const div_complementos = document.querySelector(".complementos")
  estado.complementos.forEach((complemento) => {
    const label = document.createElement("label");
    label.classList.add("complemento");

    const inputCheck = document.createElement("input");
    inputCheck.type = "checkbox";
    inputCheck.addEventListener('change', (event) => {
      if (event.target.checked === true) {
        estado.complementosSelecionados.push(complemento)
        estado.precoTotal = calcularPrecoTotalItem()
        atualizarDisplayPreco()
      } else {
        estado.complementosSelecionados = estado.complementosSelecionados.filter(item => item.id_complemento != complemento.id_complemento)
        estado.precoTotal = calcularPrecoTotalItem()
        atualizarDisplayPreco()
      }
    })
    inputCheck.id = complemento.id_complemento

    const spanNome = document.createElement("span");
    spanNome.innerText = `${complemento.nome}`;

    const spanPreco = document.createElement("span");
    spanPreco.innerText = `+ R$${complemento.preco.replace(".", ",")}`;

    label.append(inputCheck, spanNome, spanPreco);

    div_complementos.append(label)
  });
}

// Adicionar produto e complementos adicionados ao carrinho e fechar modal
function confirmarAdd() {
  const item = {
    produto: estado.produtoSelecionado,
    complementos: estado.complementosSelecionados,
    precoTotalItem: estado.precoTotal
  };
  estado.carrinho.push(item);
  estado.produtoSelecionado = null;
  estado.complementosSelecionados = [];
  fecharModal();
  mostrarAviso()

  console.log(estado.carrinho)
}

function atualizarDisplayPreco() {
  document.querySelector(".modal-produto-preco").innerText =
    `R$${estado.precoTotal}`;
}

function mostrarAviso() {
  const aviso = document.querySelector(".aviso-caixa")
  aviso.style.display = "block";
  setTimeout(() => {
    aviso.style.display = "none";
  }, 2000);
}

function calcularPrecoTotalItem() {
  let precoTotal = 0

  precoTotal += parseFloat(estado.produtoSelecionado.preco)

  estado.complementosSelecionados.forEach((complemento) => {
    precoTotal += parseFloat(complemento.preco)
  })

  return precoTotal.toFixed(2)
}