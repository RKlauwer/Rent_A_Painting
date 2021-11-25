
const initTest = () => {
  const testElem = document.getElementById("rangeform");
  if (testElem) {
    testElem.addEventListener("click", (event) => {
      console.log("hola")
    });
  }
};

export { initTest };
