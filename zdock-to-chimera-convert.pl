@files=<complex.*.pdb>;

foreach $file (@files) {
  $out=$file;
  $out=~s/\.pdb$/.conv.pdb/g;
  open(IN,$file);
  open(OUT,">$out");
  while(<IN>) {
    chomp;
    if(/^ATOM/) {
      $line=substr($_,0,53)."  1.00  0.00";
    } else {
      $line=$_;
    }
    print OUT $line,"\n";
  }
  close(IN);
  close(OUT);
}
	
	
