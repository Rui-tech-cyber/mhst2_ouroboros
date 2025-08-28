import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("MonsterState controller connected")
  }

  change(event) {
    const stateId = event.target.dataset.id
    const monsterId = this.element.dataset.monsterId
    const urlTemplate = this.element.dataset.stateUrlTemplate
    const url = urlTemplate.replace("STATE_ID", stateId)

    fetch(url)
      .then(res => res.json())
      .then(data => {
        document.getElementById("state-name").textContent = data.state_name
        document.getElementById("action-count").textContent = data.action_count
        document.getElementById("element").textContent = data.element
        document.getElementById("action-pattern").textContent = data.action_pattern
        document.getElementById("element-image").src = data.image_url
      })
  }
}
