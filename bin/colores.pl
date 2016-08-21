#!/usr/bin/perl

# utiliza los recursos para los colores del 0-15
# regularmente una reproduccion del estandar ANSI

# los colores del 16-231 son un cubo colores, con cada cara de 6x6x6
for ($red = 0; $red < 6; $red++) {
    for ($green = 0; $green < 6; $green++) {
        for ($blue = 0; $blue < 6; $blue++) {
            printf("\x1b]4;%d;rgb:%2.2x/%2.2x/%2.2x\x1b\\", 16 + ($red * 36) + ($green * 6) + $blue,
                  ($red ? ($red * 40 + 55) : 0), ($green ? ($green * 40 + 55) : 0), ($blue ? ($blue * 40 + 55) : 0));
        }
    }
}

# los colores 232-255 son grises, intencionalmete dejados en blanco y negro
for ($gray = 0; $gray < 24; $gray++) {
    $level = ($gray * 10) + 8;
    printf("\x1b]4;%d;rgb:%2.2x/%2.2x/%2.2x\x1b\\", 232 + $gray, $level, $level, $level);
}

# imprimir en pantalla los colores

# primero los colores del sistema
print "\x1b[0m\nColores del sistema:\n";
for ($color = 0; $color < 8; $color++) {
    print "\x1b[48;5;${color}m  ";
}
print "\x1b[0m\n";
for ($color = 8; $color < 16; $color++) {
    print "\x1b[48;5;${color}m  ";
}
print "\x1b[0m\n\n";

# despues el cubo de colores
print "Cubos de colores, 6x6x6:\n";
for ($green = 0; $green < 6; $green++) {
    for ($red = 0; $red < 6; $red++) {
        for ($blue = 0; $blue < 6; $blue++) {
            $color = 16 + ($red * 36) + ($green * 6) + $blue;
            print "\x1b[48;5;${color}m  ";
        }
        print "\x1b[0m ";
    }
    print "\n";
}
print "\x1b[0m\n";

# por ultimo la escala de grises
print "Escala de grises:\n";
for ($color = 232; $color < 256; $color++) {
    print "\x1b[48;5;${color}m  ";
}
print "\x1b[0m\n\n";
