import { Application } from "@hotwired/stimulus"
import Rails from "@rails/ujs"
Rails.start()

import "count_articles"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
