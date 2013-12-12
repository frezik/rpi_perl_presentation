#!/usr/bin/perl
use v5.14;
use warnings;
use HiPi::Wiring qw( :wiring );

my $PIN = 1; # GPIO18 (P1 header pin 12)

HiPi::Wiring::wiringPiSetup();
HiPi::Wiring::pinMode( $PIN, WPI_OUTPUT );

my $continue = 1;
while( $continue ) {
    HiPi::Wiring::digitalWrite( $PIN, WPI_HIGH );
    sleep 1;
    HiPi::Wiring::digitalWrite( $PIN, WPI_LOW );
    sleep 1;
}
