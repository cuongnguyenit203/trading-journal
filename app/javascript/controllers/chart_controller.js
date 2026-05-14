import { Controller } from "@hotwired/stimulus"
import Chart from "chart.js/auto"

export default class extends Controller {
  connect() {
    const labels = JSON.parse(this.element.dataset.labels)
    const data = JSON.parse(this.element.dataset.data)

    new Chart(this.element, {
      type: "line",

      data: {
        labels: labels,

        datasets: [{
          label: "PnL",
          data: data
        }]
      }
    })
  }
}