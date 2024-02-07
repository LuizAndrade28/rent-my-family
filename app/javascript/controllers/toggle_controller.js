// controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["togglableElement"];

  connect() {
    if (this.element.dataset.fireDados !== undefined) {
      this.fireDados();
    } else if (this.element.dataset.firePedidos !== undefined) {
      this.firePedidos();
    } else if (this.element.dataset.fireFamiliares !== undefined) {
      this.fireFamiliares();
    } else if (this.element.dataset.fireCadastro !== undefined) {
      this.fireCadastro();
    } else {
      console.log("Nada a fazer");
    }
  }

  fireDados() {
    this.toggleVisibility("dados");
  }

  firePedidos() {
    this.toggleVisibility("pedidos");
  }

  fireFamiliares() {
    this.toggleVisibility("familiares");
  }

  fireCadastro() {
    this.toggleVisibility("cadastro");
  }

  toggleVisibility(type) {
    this.togglableElementTargets.forEach(target => {
      if (target.dataset.toggleElement === type) {
        target.classList.remove("d-none");
      } else {
        target.classList.add("d-none");
      }
    });
  }
}
