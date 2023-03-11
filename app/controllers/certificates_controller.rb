class CertificatesController < ApplicationController
  def import
    return redirect_to request.referer, notice: 'No file added' if params[:file].nil?
    return redirect_to request.referer, notice: 'Only CSV files allowed' unless params[:file].content_type == 'text/csv'

    CsvImportService.new(file: params[:file], group_id: params[:group_id]).call

    redirect_to request.referer, notice: 'Import started...'
  end

  def show
    @certificate = Certificate.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Certificate #{@certificate.slug}", # filename
        template: "certificate_templates/templates/#{@certificate.group.certificate_template.id}",
        formats: [:html],
        disposition: :inline,
        layout: 'pdf'
      end
    end
  end

  def verify
    validation_number = params[:validation_number]
    return unless validation_number.present?
    certificate = Certificate.find_by(slug: validation_number)
    # TODO: check if certificate has expired
    if certificate.present?
      redirect_to certificate_path(certificate), notice: 'Certificate exists and is valid!'
    else
      redirect_to verify_certificates_path, alert: 'Invalid!'
    end
  end
end
