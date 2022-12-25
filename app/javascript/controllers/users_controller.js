import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="users"
export default class extends Controller {
  initialize() {
    const url = "http://localhost:3000/users";
    console.log("Users controller initialized");
    setTimeout(() => {
      // setInterval(() => {
      fetch(url, { headers: { Accept: "text/vnd.turbo-stream.html" } })
        .then((response) => response.text())
        .then((html) => Turbo.renderStreamMessage(html))
        .catch((error) => console.log(error));
    }, 3000);
  }
  connect() {
    console.log("Users controller connected");
  }
}
