#!/usr/bin/perl
use v5.14;
use warnings;
use HiPi::Wiring qw( :wiring );

my $SLEEP_MICROSECONDS = 1_000_000 / 1000;
my $PIN = 1; # GPIO18 (P1 header pin 12)

HiPi::Wiring::wiringPiSetup();
HiPi::Wiring::pinMode( $PIN, WPI_PWM_OUTPUT );

my $continue = 1;
while($continue) {
    for ((0 .. 1024), reverse(0 .. 1024)) {
        HiPi::Wiring::pwmWrite( $PIN, $_ );
        HiPi::Wiring::delayMicroseconds( $SLEEP_MICROSECONDS );
    }
}
