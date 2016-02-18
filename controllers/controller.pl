#!/usr/bin/perl

##########################################################
##                                                      ##
## !!! The Views must have the same name of Modules !!! ##
##                                                      ##
##########################################################

use lib "dao/";							# Load classes
use lib "model/";
use connectionFactory;
use model;
require "config/config"; 				# Load Config Parameters :: Must SET !!

my $connFactory = connectionFactory->new();
my $myModel = model->new();
my $view;
my $redirect = $ARGV[0];

	      $connFactory->setConnParameters($_facFromConfig);         # Create FactoryConnection
my @dao = $connFactory->getConn();									# Get this Connection

	if (!defined($ARGV[0]))  			
	{  
		$redirect = "main";											# Without Parameters :: Redirect to Default View
		@ARGV = "config";											# Load on the ARGV parameter data necessary to view
	}
	else 
	{
		if (!defined($ARGV[2]))  { $ARGV[2] = $ARGV[1]; } 			# Replace empty ARGV
		eval {
		 	my @sendInfo = $myModel->$redirect(\@dao,$ARGV[2]); 	# Calls the module with two parameters , dao connection and 
		 															# additional argument to use for example looks for an id
			$ARGV[1] = \@sendInfo;									# Load on the ARGV parameter data necessary to view
		 };
		 if ($@) { 						
		 	$redirect = "main"; 		# Without Parameters :: Redirect to Default View
		 	@ARGV = "config";			# Load on the ARGV parameter data necessary to view
		 } 
	}
	    $view = "views/".$redirect; 	# Creates Randomly Redirect to Views
require $view; 							# Redirects to the controller and Forwards the Contents to the View


return 1;



