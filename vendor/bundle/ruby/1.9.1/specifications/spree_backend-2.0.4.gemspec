# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "spree_backend"
  s.version = "2.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sean Schofield"]
  s.date = "2013-08-05"
  s.description = "Required dependency for Spree"
  s.email = "sean@spreecommerce.com"
  s.homepage = "http://spreecommerce.com"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.requirements = ["none"]
  s.rubyforge_project = "spree_backend"
  s.rubygems_version = "1.8.23"
  s.summary = "backend e-commerce functionality for the Spree project."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spree_core>, ["= 2.0.4"])
      s.add_runtime_dependency(%q<spree_api>, ["= 2.0.4"])
      s.add_runtime_dependency(%q<jquery-rails>, ["~> 3.0.0"])
      s.add_runtime_dependency(%q<jquery-ui-rails>, ["~> 4.0.0"])
      s.add_runtime_dependency(%q<select2-rails>, ["~> 3.4.7"])
      s.add_runtime_dependency(%q<rails>, ["~> 3.2.8"])
      s.add_runtime_dependency(%q<deface>, [">= 0.9.0"])
      s.add_development_dependency(%q<email_spec>, ["~> 1.2.1"])
    else
      s.add_dependency(%q<spree_core>, ["= 2.0.4"])
      s.add_dependency(%q<spree_api>, ["= 2.0.4"])
      s.add_dependency(%q<jquery-rails>, ["~> 3.0.0"])
      s.add_dependency(%q<jquery-ui-rails>, ["~> 4.0.0"])
      s.add_dependency(%q<select2-rails>, ["~> 3.4.7"])
      s.add_dependency(%q<rails>, ["~> 3.2.8"])
      s.add_dependency(%q<deface>, [">= 0.9.0"])
      s.add_dependency(%q<email_spec>, ["~> 1.2.1"])
    end
  else
    s.add_dependency(%q<spree_core>, ["= 2.0.4"])
    s.add_dependency(%q<spree_api>, ["= 2.0.4"])
    s.add_dependency(%q<jquery-rails>, ["~> 3.0.0"])
    s.add_dependency(%q<jquery-ui-rails>, ["~> 4.0.0"])
    s.add_dependency(%q<select2-rails>, ["~> 3.4.7"])
    s.add_dependency(%q<rails>, ["~> 3.2.8"])
    s.add_dependency(%q<deface>, [">= 0.9.0"])
    s.add_dependency(%q<email_spec>, ["~> 1.2.1"])
  end
end
