
# This file was created by warning.pl
# Any changes made here will be lost.
#

package warning;

=head1 NAME

warning - Perl pragma to control 

=head1 SYNOPSIS

    use warning;

    use warning "all";
    use warning "deprecated";

    use warning;
    no warning "unsafe";

=head1 DESCRIPTION

If no import list is supplied, all possible restrictions are assumed.
(This is the safest mode to operate in, but is sometimes too strict for
casual programming.)  Currently, there are three possible things to be
strict about:  

=over 6

=item C<warning deprecated>

This generates a runtime error if you use deprecated 

    use warning 'deprecated';

=back

See L<perlmod/Pragmatic Modules>.


=cut

use Carp ;

%Bits = (
    'all'		=> "\x55\x55\x55\x55\x55\x55\x55\x55", # [0..31]
    'ambiguous'		=> "\x00\x10\x00\x00\x00\x00\x00\x00", # [6]
    'closed'		=> "\x00\x00\x00\x40\x00\x00\x00\x00", # [15]
    'closure'		=> "\x00\x00\x00\x00\x00\x04\x00\x00", # [21]
    'default'		=> "\x00\x00\x00\x00\x00\x00\x00\x01", # [28]
    'deprecated'	=> "\x00\x00\x04\x00\x00\x00\x00\x00", # [9]
    'exec'		=> "\x00\x00\x00\x00\x04\x00\x00\x00", # [17]
    'io'		=> "\x00\x00\x00\x54\x15\x00\x00\x00", # [13..18]
    'misc'		=> "\x00\x00\x10\x00\x00\x00\x00\x00", # [10]
    'newline'		=> "\x00\x00\x00\x00\x10\x00\x00\x00", # [18]
    'numeric'		=> "\x00\x00\x00\x01\x00\x00\x00\x00", # [12]
    'octal'		=> "\x10\x00\x00\x00\x00\x00\x00\x00", # [2]
    'once'		=> "\x00\x00\x00\x00\x00\x00\x00\x04", # [29]
    'parenthesis'	=> "\x00\x40\x00\x00\x00\x00\x00\x00", # [7]
    'pipe'		=> "\x00\x00\x00\x00\x01\x00\x00\x00", # [16]
    'precedence'	=> "\x00\x04\x00\x00\x00\x00\x00\x00", # [5]
    'printf'		=> "\x00\x01\x00\x00\x00\x00\x00\x00", # [4]
    'recursion'		=> "\x00\x00\x00\x00\x00\x00\x40\x00", # [27]
    'redefine'		=> "\x01\x00\x00\x00\x00\x00\x00\x00", # [0]
    'reserved'		=> "\x40\x00\x00\x00\x00\x00\x00\x00", # [3]
    'semicolon'		=> "\x00\x00\x01\x00\x00\x00\x00\x00", # [8]
    'signal'		=> "\x00\x00\x00\x00\x00\x00\x04\x00", # [25]
    'substr'		=> "\x00\x00\x00\x00\x00\x10\x00\x00", # [22]
    'syntax'		=> "\x54\x55\x05\x00\x00\x00\x00\x00", # [1..9]
    'taint'		=> "\x00\x00\x00\x00\x00\x40\x00\x00", # [23]
    'uninitialized'	=> "\x00\x00\x40\x00\x00\x00\x00\x00", # [11]
    'unopened'		=> "\x00\x00\x00\x10\x00\x00\x00\x00", # [14]
    'unsafe'		=> "\x00\x00\x00\x00\x40\x55\x05\x00", # [19..25]
    'untie'		=> "\x00\x00\x00\x00\x00\x00\x01\x00", # [24]
    'utf8'		=> "\x00\x00\x00\x00\x00\x01\x00\x00", # [20]
    'void'		=> "\x00\x00\x00\x00\x00\x00\x10\x00", # [26]
  );

%DeadBits = (
    'all'		=> "\xaa\xaa\xaa\xaa\xaa\xaa\xaa\xaa", # [0..31]
    'ambiguous'		=> "\x00\x20\x00\x00\x00\x00\x00\x00", # [6]
    'closed'		=> "\x00\x00\x00\x80\x00\x00\x00\x00", # [15]
    'closure'		=> "\x00\x00\x00\x00\x00\x08\x00\x00", # [21]
    'default'		=> "\x00\x00\x00\x00\x00\x00\x00\x02", # [28]
    'deprecated'	=> "\x00\x00\x08\x00\x00\x00\x00\x00", # [9]
    'exec'		=> "\x00\x00\x00\x00\x08\x00\x00\x00", # [17]
    'io'		=> "\x00\x00\x00\xa8\x2a\x00\x00\x00", # [13..18]
    'misc'		=> "\x00\x00\x20\x00\x00\x00\x00\x00", # [10]
    'newline'		=> "\x00\x00\x00\x00\x20\x00\x00\x00", # [18]
    'numeric'		=> "\x00\x00\x00\x02\x00\x00\x00\x00", # [12]
    'octal'		=> "\x20\x00\x00\x00\x00\x00\x00\x00", # [2]
    'once'		=> "\x00\x00\x00\x00\x00\x00\x00\x08", # [29]
    'parenthesis'	=> "\x00\x80\x00\x00\x00\x00\x00\x00", # [7]
    'pipe'		=> "\x00\x00\x00\x00\x02\x00\x00\x00", # [16]
    'precedence'	=> "\x00\x08\x00\x00\x00\x00\x00\x00", # [5]
    'printf'		=> "\x00\x02\x00\x00\x00\x00\x00\x00", # [4]
    'recursion'		=> "\x00\x00\x00\x00\x00\x00\x80\x00", # [27]
    'redefine'		=> "\x02\x00\x00\x00\x00\x00\x00\x00", # [0]
    'reserved'		=> "\x80\x00\x00\x00\x00\x00\x00\x00", # [3]
    'semicolon'		=> "\x00\x00\x02\x00\x00\x00\x00\x00", # [8]
    'signal'		=> "\x00\x00\x00\x00\x00\x00\x08\x00", # [25]
    'substr'		=> "\x00\x00\x00\x00\x00\x20\x00\x00", # [22]
    'syntax'		=> "\xa8\xaa\x0a\x00\x00\x00\x00\x00", # [1..9]
    'taint'		=> "\x00\x00\x00\x00\x00\x80\x00\x00", # [23]
    'uninitialized'	=> "\x00\x00\x80\x00\x00\x00\x00\x00", # [11]
    'unopened'		=> "\x00\x00\x00\x20\x00\x00\x00\x00", # [14]
    'unsafe'		=> "\x00\x00\x00\x00\x80\xaa\x0a\x00", # [19..25]
    'untie'		=> "\x00\x00\x00\x00\x00\x00\x02\x00", # [24]
    'utf8'		=> "\x00\x00\x00\x00\x00\x02\x00\x00", # [20]
    'void'		=> "\x00\x00\x00\x00\x00\x00\x20\x00", # [26]
  );


sub bits {
    my $mask ;
    my $catmask ;
    my $fatal = 0 ;
    foreach my $word (@_) {
	if  ($word eq 'FATAL')
	  { $fatal = 1 }
	elsif ($catmask = $Bits{$word}) {
	  $mask |= $catmask ;
	  $mask |= $DeadBits{$word} if $fatal ;
	}
	else
	  { croak "unknown warning category '$word'" }
    }

    return $mask ;
}

sub import {
    shift;
    $^B |= bits(@_ ? @_ : 'all') ;
}

sub unimport {
    shift;
    $^B &= ~ bits(@_ ? @_ : 'all') ;
}


sub make_fatal
{
    my $self = shift ;
    my $bitmask = $self->bits(@_) ;
    $SIG{__WARN__} =
        sub
        {
            die @_ if $^B & $bitmask ;
            warn @_
        } ;
}

sub bitmask
{
    return $^B ;
}

sub enabled
{
    my $string = shift ;

    return 1
	if $bits{$string} && $^B & $bits{$string} ;
   
    return 0 ; 
}

1;