function price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addTaxDomValue =  addTaxDom.value;
    addTaxDom.innerHTML = Math.floor(inputValue*0.1)
    const profitNum = document.getElementById("profit");
    console.log(addTaxDomValue)
    profitNum.innerHTML = Math.floor(inputValue*0.9)  
  })
}
window.addEventListener("load", price);