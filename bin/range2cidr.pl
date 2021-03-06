#!/usr/bin/perl -w

# range2cidr.pl

# uses the libnet-cidr-perl package 
use Net::CIDR;
use Net::CIDR ':all';

if (@ARGV == 0) {
  die "Usage Example: $0 192.168.0.0-192.168.255.255 \n";
}

print join("\n", Net::CIDR::range2cidr("$ARGV[0]")) . "\n";

