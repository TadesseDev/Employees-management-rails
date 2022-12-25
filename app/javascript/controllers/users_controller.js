import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="users"
export default class extends Controller {
  users = 0;
  initialize() {
    // const url = "http://localhost:3000/users";
    // setTimeout(() => {
    //   fetch(url, { headers: { Accept: "text/vnd.turbo-stream.html" } })
    //     .then((response) => response.text())
    //     .then((html) => Turbo.renderStreamMessage(html))
    //     .catch((error) => console.log(error));
    // }, 5000);
  }
  connect() {
    console.log("Users controller connected");
  }

  disconnect() {
    console.log("Users controller disconnected");
  }
}
