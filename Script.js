function converter() {
    const moeda = parseFloat(document.getElementById("moeda").value);
    const de = document.getElementById("de").value;
    const para = document.getElementById("para").value;
    const resultado = document.getElementById("resultado");

    let moedaConvertida;

    if (isNaN(moeda)) {
        resultado.innerHTML = "Por favor, insira um valor válido.";
        return;
    }

    let valor;

    if (de === "Real(BR)") {
        valor = moeda;
    } else if (de === "Dollar") {
        valor = moeda * 5.22;
    } else if (de === "Euro") {
        valor = moeda * 6.23;
    }
   
    if (para === "Real(BR)") {
        moedaConvertida = valor;
    } else if (para === "Dollar") {
        moedaConvertida = valor / 5.22;
    } else if (para === "Euro") {
        moedaConvertida = valor / 6.23;
    }

    resultado.innerHTML = `${moeda.toFixed(2)} ${de} = ${moedaConvertida.toFixed(2)} ${para}`;
}