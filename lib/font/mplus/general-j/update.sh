#!/bin/sh

curl \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-thin-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-thin-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-thin-sub.eot \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-regular-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-regular-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-regular-sub.eot \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-medium-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-medium-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-medium-sub.eot \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-light-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-light-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-light-sub.eot \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-heavy-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-heavy-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-heavy-sub.eot \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-bold-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-bold-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-bold-sub.eot \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-black-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-black-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-2-black-sub.eot \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-thin-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-thin-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-thin-sub.eot \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-regular-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-regular-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-regular-sub.eot \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-medium-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-medium-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-medium-sub.eot \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-light-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-light-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-light-sub.eot \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-heavy-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-heavy-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-heavy-sub.eot \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-bold-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-bold-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-bold-sub.eot \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-black-sub.woff \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-black-sub.ttf \
  -O http://mplus-fonts.osdn.jp/webfonts/general-j/mplus-1-black-sub.eot

for f in *-regular-*.ttf; do
  f=${f#mplus-}
  type=${f%%-*}

  case "$type" in
    1)
      type_suffixes="p c m mn"
      ;;
    2)
      type_suffixes="p c m"
      ;;
    *)
      echo "$type Didn't match anything"
  esac

  for type_suffix in $type_suffixes; do
    css=mplus-$type$type_suffix.css
    echo "/* M+ $type$type_suffix */" > $css
    for g in *-$type-*.ttf; do
        g=${g#mplus-$type-}
        weight=${g%%-*}

        echo ""
        echo "@font-face"
        echo "{"
        echo "  font-family: 'M+ $type$type_suffix';"
        echo "  src: url('mplus-$type-$weight-sub.eot');"
        echo "  src: url('mplus-$type-$weight-sub.eot?#iefix') format('embedded-opentype'),"
        echo "       url('mplus-$type-$weight-sub.woff') format('woff'),"
        echo "       url('mplus-$type-$weight-sub.ttf') format('truetype');"
        echo "  font-weight: $weight;"
        echo "}"
    done >> $css
  done
done
