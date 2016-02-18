#!/usr/bin/perl

package model;


sub new
{
	my $class = shift;
	my $self = { };
	bless $self;
	$self->{"dao"} = "";
	return $self;
}

sub listBase 
{
	my $self = shift;
	my $value = shift;
	$self->{"dao"} = $value;
	return @{$self->{"dao"}};
}
# Simple Module that uses an even simpler regex filters to text 
sub listUniqData {

	my $self = shift;
	my $value = shift;
	my $id = shift;
	my @rtnArray;
	$self->{"dao"} = $value;
	foreach my $lines (@{$self->{"dao"}}) { if($lines=~/^$id\;/) {  push @rtnArray, $lines; } }
	return @rtnArray;
}
# Simple Module that uses an even simpler regex filters to text 
sub dataSearch {

	my $self = shift;
	my $value = shift;
	my $valuetoSearch = shift;
	my @rtnArray;
	$self->{"dao"} = $value;
	foreach my $lines (@{$self->{"dao"}}) { if($lines=~/$valuetoSearch/) {  push @rtnArray, $lines; } }
	return @rtnArray;
}


1;


