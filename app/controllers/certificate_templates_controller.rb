class CertificateTemplatesController < ApplicationController
  def index
    @certificate_templates = CertificateTemplate.all
  end
end
