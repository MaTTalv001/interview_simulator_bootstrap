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
        } else {
          // jQueryを使わずにモーダルを表示する
          var modal = new bootstrap.Modal(document.getElementById('loadingModal'));
          modal.show();
        }
      });
    }
  });
  
  document.addEventListener("turbo:load", () => {
    var speechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
    if (speechRecognition) {
      var recognition = new speechRecognition();
      var textField = document.getElementById('answer_field'); // IDで要素を取得
      var startButton = document.getElementById('start-speech'); // 音声入力開始ボタンのID
  
      recognition.continuous = false; // 一度の認識で止まるように設定
      recognition.lang = 'ja-JP'; // 日本語に設定
      recognition.interimResults = false; // 中間結果は不要
      recognition.maxAlternatives = 1; // 複数の認識結果は不要
  
      startButton.addEventListener('click', () => {
        recognition.start(); // ボタンクリックで認識を開始
      });
  
      recognition.addEventListener('result', (event) => {
        var speechResult = event.results[0][0].transcript; // 認識結果の取得
        textField.value = speechResult; // テキストエリアに入力
      });
  
      recognition.addEventListener('speechend', () => {
        recognition.stop(); // 認識を終了
      });
  
      recognition.addEventListener('error', (event) => {
        console.error('音声認識エラー: ' + event.error); // エラー処理
      });
    } else {
      console.error("このブラウザはWeb Speech APIをサポートしていません。");
    }
  });
  
  