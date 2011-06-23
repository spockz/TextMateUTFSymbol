#!/usr/bin/env ruby -KU

class String
  def starts_with?(prefix)
    prefix = prefix.to_s
    self[0, prefix.length] == prefix
  end
  
  def ends_with?(suffix)
    suffix = suffix.to_s
    self[-suffix.length,suffix.length] == suffix
  end
end

shortcutHash = {
"alpha"    => "α",
"Alpha"    => "Α",
"beta"     => "β",
"Beta"     => "Β",
"gamma"    => "γ",
"Gamma"    => "Γ",
"delta"    => "δ",
"Delta"    => "Δ",
"epsilon"  => "ε",
"Epsilon"  => "Ε",
"zeta"     => "ζ",
"Zeta"     => "Ζ",
"eta"      => "η",
"Eta"      => "Η",
"theta"    => "θ",
"Theta"    => "Θ",
"iota"     => "ι",
"Iota"     => "Ι",
"kappa"    => "κ",
"Kappa"    => "Κ",
"lambda"   => "λ",
"Lambda"   => "Λ",
"mu"       => "μ",
"Mu"       => "Μ",
"nu"       => "ν",
"Nu"       => "Ν",
"xi"       => "ξ",
"Xi"       => "Ξ",
"omikron"  => "ο",
"Omikron"  => "Ο",
"pi"       => "π",
"Pi"       => "Π",
"rho"      => "ρ",
"Rho"      => "Ρ",
"sigma"    => "σ",
"sigma_"   => "ς",
"Sigma"    => "Σ",
"tau"      => "τ",
"Tau"      => "Τ",
"ypsilon"  => "υ",
"Ypsilon"  => "Υ",
"phi"      => "φ",
"Phi"      => "Φ",
"chi"      => "χ",
"Chi"      => "Χ",
"psi"      => "ψ",
"Psi"      => "Ψ",
"omega"    => "ω",
"Omega"    => "Ω",

"forall"           => "∀",
"exists"           => "∃",
"dP"               => "∀",
"elem"             => "∈",
"notelem"          => "∉",
"containsasmember" => "∋",
"land"             => "∧",
"lor"              => "∨",
"therefore"        => "∴",
"because"          => "∵",
"setintersect"     => "∩",
"setunion"         => "∪",
"subset"           => "⊂",
"superset"         => "⊃",
"subseteq"         => "⊆",
"nsubseteq"        => "⊈",
"superseteq"       => "⊇",
"concatenation"    => "∘",
"integral"         => "∫",
"doubleintegral"   => "∬",
"Nabla"            => "∇",
"tildeoperator"    => "∼",
"approxeq"         => "≅",
"almosteq"         => "≈",
"neq"              => "≠",
"leq"              => "≤",
"geq"              => "≥",
"plusminus"        => "±",
"squared"          => "²",
"coproduct"        => "∏",
"summation"        => "∑",
"dotproduct"       => "∙",
"root"             => "√",
"infinity"         => "∞",
"turnstile"        => "⊢",
"Top"              => "T",
"bottom"           => "⊥",
"_0" => "\xE2\x82\x80",
"_1" => "\xE2\x82\x81",
"_2" => "\xE2\x82\x82",
"_3" => "\xE2\x82\x83",
"_4" => "\xE2\x82\x84",
"_5" => "\xE2\x82\x85",
"_6" => "\xE2\x82\x86",
"_7" => "\xE2\x82\x87",
"_8" => "\xE2\x82\x88",
"_9" => "\xE2\x82\x89",
}

subscripts = {
  "0" => "\xE2\x82\x80",
  "1" => "\xE2\x82\x81",
  "2" => "\xE2\x82\x82",
  "3" => "\xE2\x82\x83",
  "4" => "\xE2\x82\x84",
  "5" => "\xE2\x82\x85",
  "6" => "\xE2\x82\x86",
  "7" => "\xE2\x82\x87",
  "8" => "\xE2\x82\x88",
  "9" => "\xE2\x82\x89",
}


shortcutHash.default = "«press a-z and space for greek letter»"
invShortcutHash = shortcutHash.invert

currentWord = STDIN.read

postfixHash = shortcutHash.select {|key, value| key.starts_with? currentWord }
suffixHash  = shortcutHash.select {|key, value| currentWord.ends_with? key }

parts = currentWord.split("_")
if (shortcutHash.has_key?(currentWord)) then
  print shortcutHash[currentWord]
elsif (postfixHash.size == 1) 
  print postfixHash.to_a().first()[1]
elsif (suffixHash.size == 1)
  a = suffixHash.to_a().first()
  print (currentWord[0, currentWord.length-a[0].length]) + a[1]
elsif (invShortcutHash.has_key?(currentWord))
  print invShortcutHash[currentWord]

else
  print currentWord + suffixHash.size.to_s
end