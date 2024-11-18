// app/javascript/count_articles.js
document.addEventListener("DOMContentLoaded", () => {
    const button = document.getElementById("count-articles-button");
    if (button) {
      button.addEventListener("click", () => {
        const articles = document.querySelectorAll("table tbody tr").length;
        const resultDiv = document.getElementById("articles-count");
        resultDiv.textContent = `Nombre d'articles : ${articles}`;
      });
    }
  });
  