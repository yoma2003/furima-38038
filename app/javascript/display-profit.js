function displayFee() {
  const priceForm = document.getElementById("item-price")
  priceForm.addEventListener("keyup", () => {
    const price = priceForm.value
    if (!isNaN(price)) {
      const addTaxPrice = Math.floor(price * 0.1);
      const profit = Math.floor(price - addTaxPrice);
      document.getElementById("add-tax-price").innerHTML = `${addTaxPrice}`;
      document.getElementById("profit").innerHTML = `${profit}`;
    }
  });
  
}

window.addEventListener("load", displayFee)