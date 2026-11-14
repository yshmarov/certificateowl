class GenerateQrService
  require 'rqrcode'
  include Rails.application.routes.url_helpers

  attr_reader :certificate

  def initialize(certificate)
    @certificate = certificate
  end

  def call
    qr_url = url_for(protocol: 'https', controller: 'certificates', action: 'show', id: certificate.slug,
                     host: 'certificateowl.com', only_path: false)
    qr_code = RQRCode::QRCode.new(qr_url)
    qr_png = qr_code.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )
    image_name = SecureRandom.hex

    certificate.qr_code.attach(
      io: StringIO.new(qr_png.to_s),
      filename: "#{image_name}.png",
      content_type: 'image/png'
    )
  end
end
