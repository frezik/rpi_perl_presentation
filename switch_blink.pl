#!/usr/bin/perl
use v5.14;
use warnings;

use HiPi::Wiring qw( :wiring );

my $SLEEP_MICROSECONDS = 1_000_000 / 10; # Sleep for tenth of a second
my $OUT_PIN = 1; # GPIO18 (P1 header pin 12)
my $IN_PIN  = 0; # GPIO17 (P1 header pin 11)

HiPi::Wiring::wiringPiSetup();
HiPi::Wiring::pinMode( $OUT_PIN, WPI_OUTPUT );
HiPi::Wiring::pinMode( $IN_PIN, WPI_INPUT );
HiPi::Wiring::pullUpDnControl( $IN_PIN, WPI_PUD_UP );


say "Taking input";
my $continue = 1;
while( $continue ) {
    my $input = HiPi::Wiring::digitalRead( $IN_PIN );
    HiPi::Wiring::digitalWrite( $OUT_PIN, $input ? WPI_LOW : WPI_HIGH );
    HiPi::Wiring::delayMicroseconds( $SLEEP_MICROSECONDS );
}
