module I18nData

  private

  def self.normal_to_region_code(normal)
    {
      "DE-CH" => "de",
      "FR-CH" => "fr",
      "EN-AU" => "en",
      "EN-GB" => "en",
      "EN-US" => "en",
      "EN-IN" => "en",
      "EN-NZ" => "en",
      "ES-CL" => "es",
      "ES-EC" => "es",
      "ES-MX" => "es",
      "PT-BR" => "pt",
      "SL-SI" => "sl",
      "NL-NL" => "nl",
      "ZH-TW" => "zh_CN",
      "ZH-CN" => "zh_CN",
      "ZH" => "zh_CN",
      "BN" => "bn_IN",
    }[normal] || normal
  end

end