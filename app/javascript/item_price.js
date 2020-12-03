function item_price(){

  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfit = document.getElementById('profit');
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;  
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);
    addProfit.innerHTML = priceInput.value - addTaxDom.innerHTML;
  })
}
window.addEventListener("load", item_price);