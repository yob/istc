A small class for generating and validating Internation Standard Text
Codes (ISTC).

# Installation

    gem install istc

# Usage

    ISTC.new("0A9200800000007C").valid?
    => true

    ISTC.valid?("0A9200800000007C")
    => true

    ISTC.valid?("0A9200800000007B")
    => false

    ISTC.complete("0A9200800000007")
    => "0A9200800000007C"

    ISTC.new("0A9200800000007").to_s
    => "0A9-2008-00000007-C"

# Further Reading

- http://en.wikipedia.org/wiki/International_Standard_Text_Code
- http://www.istcinfo.org/
- http://www.ljndawson.com/Wiki/index.php/ISTC

# Contributing

Source code is publicly available @ http://github.com/yob/istc. Patches
welcome, preferably via a git repo I can pull from.
