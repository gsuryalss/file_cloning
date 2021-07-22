#!/usr/bin/perl

####################################################################################
#
# File Cloning
# Copyright (C) 2021 surya
#
# This program is free software: you can redistribute it and/or modify
# it without any restrictions/limits under the terms of the MIT License.
#
# please see the MIT License for more details.
# <https://www.mit.edu/~amini/LICENSE.md
#
# Usage : Creates n number of file clones as inputed by the user
#
# Version log :
#				- 07/21/2021 Initial version
#
#####################################################################################
use strict;
use warnings;

# displays the program title
&header_format;

# Get total number of clones
print "Hi! How many number of files would you like to clone? ";
my $file_count = &get_input;

# Initialize variable for storing file contents
my @file_contents = '';

# Get the input file directory/path
print "Please enter your input file location including file name: ";
my $file_path_in = &get_input;

# Get the output file directory/path
print "Please enter your output directory: ";
my $file_path_out = &get_input;

# Open the file for reading
open(my $fh, '<', $file_path_in) or die "File not found/Could not open the file $!";
{
  &trim_ip(@file_contents = <$fh>);
}
close($fh);

# Create n number of file clones
foreach my $i(1..$file_count)
{
  # Wrtie to the files
  open(my $fout, '>',$file_path_out.'Clone'.$i.'.txt') or die "Could not open the file $!";
  {
    print($fout @file_contents);
  }
  close($fout)
}

&print_footer;

# Print the header format
sub header_format{

  print "*"x50,"\n";
  foreach(2){
    &star_print;
  }
  print "*"," "x18,"File Cloning"," "x18,"*","\n";
  foreach(2){
    &star_print;
  }
  print "*"x50,"\n";
}

# Print the pattern
sub star_print{

  print "*"," "x48,"*","\n";
}

# Get the input from user
sub get_input{
  return (trim_ip(my $inp = <STDIN>));
}

# Print the footer text
sub print_footer{

  print("Please check the output directory, $file_count file(s) have been generated successfully.Thanks!\n");
}

# sub routine for removing spaces
sub trim_ip{

	chomp($ip_string);
	return $ip_string =~ s/\s//ig;
}
