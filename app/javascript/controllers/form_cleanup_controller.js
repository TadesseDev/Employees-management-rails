import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="form-cleanup"
export default class extends Controller {
  connect() {
    console.log("Form cleanup controller connected");
  }

  clean(e) {
    console.log("Cleaning form");
  }
}
