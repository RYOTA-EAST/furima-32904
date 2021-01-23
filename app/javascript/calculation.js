function calculation (){
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", ()=>{
    const fee = Math.floor(price.value * 0.1);
    const profit = Math.floor(price.value - fee);
    const charFee = document.getElementById("add-tax-price");
    const charProfit = document.getElementById("profit");
    charFee.innerHTML = `${fee}`;
    charProfit.innerHTML = `${profit}`;
  });
}

window.addEventListener('load',calculation);