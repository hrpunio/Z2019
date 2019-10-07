#!/usr/bin/perl
#
while (<>) { chomp();
  if ($tmp[0] eq 'okreg') { next} ## nagłówek

   ##okreg;nrlisty;komitet;numer;kto;glosy;procent;NX
  ($okr, $nrlisty, $komitet, $nrk, $kandydat, $glosy, $procent, $wynik) = split /;/, $_;

  ##$okr =~ s/_/;/;
  $wynik =~ s/PX/T/;
  $wynik =~ s/NX/N/;
  $komitet =~ s/ZLEW/SLD/;

  $nrk = sprintf "%02i", $nrk;
  @name = split / /, $kandydat;

  $imie = $name[0]; ## 
  $lastChar = chop($imie);
  if ($lastChar eq 'a') {$plec = 'K'} else {$plec = 'M'}

  $KKK{"$okr"}{"$komitet"}{"$nrk"} = "$kandydat";
  $KKG{"$okr"}{"$komitet"}{"$nrk"} += $glosy;
  $KKX{"$okr"}{"$komitet"}{"$nrk"} = "$wynik;$plec";
  
  $Okr{"$okr"} += $glosy;
  $OkrL{"$okr"}{"$komitet"} += $glosy;

}


print "okr;nrk;komitet;kandydat;glosy;procent;procentl;wynik;plec;\n";

#####
for $o ( sort keys %KKK ) {
   for $k ( sort keys %{$KKK{$o}} ) {
      for $n ( sort keys %{$KKK{$o}{$k}} ) {
          unless ($k eq 'PiS' || $k eq 'PO' || $k eq 'SLD' || $k eq 'PSL' ) {next; }
          $procent = $KKG{$o}{$k}{$n} / $Okr{$o} * 100;
          $procentL = $KKG{$o}{$k}{$n} / $OkrL{$o}{$k} *100;
          print "$o;$n;$k;$KKK{$o}{$k}{$n};$KKG{$o}{$k}{$n};";
          printf "%.2f;%.2f;", $procent, $procentL;
          print "$KKX{$o}{$k}{$n}\n";
      }
   }

}

