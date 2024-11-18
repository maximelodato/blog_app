module ApplicationHelper
    def bootstrap_class_for_flash(type)
      case type
      when "notice" then "alert-success"
      when "alert" then "alert-danger"
      when "info" then "alert-info"
      when "warning" then "alert-warning"
      else "alert-secondary"
      end
    end
  end
  