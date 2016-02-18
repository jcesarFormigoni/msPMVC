#!/usr/bin/perl

package connectionFactory;

sub new
{
	my $class = shift;
	my $self = { };
	bless $self;
	$self->{"fileName"} = "";
	return $self;
}

sub setConnParameters
{
	my $self = shift;
	my $value = shift;
	$self->{"fileName"} = $value;
}

sub getConn
{
	my @return;
	my $self = shift;
	open (handler,$self->{"fileName"});
	@return=<handler>;
	close(handler);
	return @return;
}

1;