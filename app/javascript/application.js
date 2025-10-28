// app/javascript/application.js

// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

// ===== フラッシュメッセージを数秒で自動フェードアウト =====
document.addEventListener("turbo:load", () => {
  document.querySelectorAll("[data-flash]").forEach((el) => {
    // 4秒後にふわっと消える
    setTimeout(() => {
      el.style.transition = "opacity .3s ease";
      el.style.opacity = "0";
      setTimeout(() => el.remove(), 350);
    }, 4000);
  });
});
