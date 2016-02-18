#!/usr/bin/perl

											#This script is what collects information Do and through parameters of ARGV 
											#calls the controls and necessary views .

	local @_ = $ARGV[0];
	require('controllers/controller.pl'); 	# Calling the fundamental control

	print "\n";