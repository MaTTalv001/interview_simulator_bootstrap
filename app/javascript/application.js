// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

document.addEventListener('turbo:load', function() {
    const form = document.querySelector('.ai-interview-form');
    if (form) {
      form.addEventListener('submit', function(event) {
        const select = document.querySelector('#repository_select');
        if (select && select.value === "") {
          event.preventDefault(); // フォームの送信を停止
          alert('リポジトリを選択してください。');
        }
      });
    }
  });