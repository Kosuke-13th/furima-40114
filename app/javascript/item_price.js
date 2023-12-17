window.addEventListener('turbo:load', function(){

const priceInput = document.getElementById("item-price");
const priceSalesFee = document.getElementById("add-tax-price");
const priceSalesIncome = document.getElementById("profit");


   priceInput.addEventListener("input",()=>{
   const inputValue = priceInput.value;
   const inputFee = Math.floor(inputValue * 0.1)

   priceSalesFee.innerHTML = inputFee
   priceSalesIncome.innerHTML = Math.floor(inputValue - inputFee)
 })
})