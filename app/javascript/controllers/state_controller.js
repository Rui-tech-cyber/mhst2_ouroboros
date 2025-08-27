import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="state"
export default class extends Controller {
  static targets = ["image", "label", "button"]
  static values = {
    defaultElement: String, // "power" | "speed" | "technique" | "none"
    defaultLabel: String // "通常"など
  }

  connect() {
    // 初期表示：デフォルト指定があればそれ、なければ最初のボタン
    const initial = this.defaultElementValue || (this.buttonTargets[0]?.dataset.stateElement) || "none"
    const initialLabel = this.defaultLabelValue || (this.buttonTargets[0]?.dataset.stateLabel) || "形態変化なし"
    this.applyState(initial, initialLabel)
  }

  change(event) {
    const el = event.currentTarget.dataset.stateElement
    const label = event.currentTarget.dataset.stateLabel
    this.applyState(el, label)
    this.markActive(event.currentTarget)
  }

  applyState(element, label){
    const img = {
      power: "/assets/elements/power.png",
      speed: "/assets/elements/speed.png",
      technique: "/assets/elements/technique.png"
      none: "/assets/elements/none.png"
    }[element] || "assets/elements/none.png"

    this.imageTarget.src = img
    this.labelTarget.textContent = this.jpLabelFor(element, label)
  }

  jpLabelFor(element, labelFromButton) {
    const jp = { power: "パワー", speed: "スピード", technique: "テクニック", none: "形態変化なし" }
    // 「該当のすくみ表示：状態名(日本語）」を大きい文字で表示する。例)【怒り】スピード
    if (element === "none") return jp.none
    const kind = jp[element] || element
    return `【${labelFromButton}】${kind}`
  }

  markActive(activeBtn) {
    this.buttonTargets.forEach(btn => {
      const on = btn === activeBtn
      btn.setAttribute("aria-pressed", on ? "true" : "false")
      btn.classList.toggle("is-active", on)
    })
  }
}
