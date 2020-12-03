window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {

    const inputValue = priceInput.value;
    console.log(inputValue);
    
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);

    const addProfit = document.getElementById('profit')
    addProfit.innerHTML = priceInput.value - addTaxDom.innerHTML;
  })
})