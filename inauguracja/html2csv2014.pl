#!/usr/bin/perl
$file=$ARGV[0];
$log=0;

open (F, $file);

while (<F>) { chomp();
  if (/Nr kandydata/) {$log=1;}
  if ($log > 0) {##
    if (/<tr>/) { ##print "==========>\n";
     $l1 = <F>; $nro=clean($l1);
     $l2 = <F>; $nrlisty=clean($l2);
     $l3 = <F>; $nrk=clean($l3);
     $l4 = <F>; $komitet=clean($l4);
     $l5 = <F>; $glosy=clean($l5);
     $l6 = <F>; $nz=clean($l6);
     $l7 = <F>; $imie=clean($l7);
     $l8 = <F>; $procent=clean($l8);
     $l9 = <F>; $mandat=clean($l9);
     print "$file;$nro;$nrk;$komitet;$nz $imie;$glosy;$procent;$mandat\n"
    }

  }
  if ($log >0 && /wyniki1_tabela_frek/) { last }
}


sub clean {
 my $s = shift;

 chomp($s);

 $s =~ s/<[^<>]+>//g;
 $s =~ s/^[ \t]+|[ \t]+$//g;

 return ($s);
}


close(F);
