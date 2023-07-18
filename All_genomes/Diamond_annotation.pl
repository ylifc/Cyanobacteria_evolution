#!/usr/bin/perl -w
use warnings;
$DIR_PATH="./";
$mpe_db="$ARGV[0]";
opendir DIR, ${DIR_PATH}|| die "can not open dir \"$DIR_PATH\"\n";
open OU, ">sh.sh";
@filelist = readdir DIR;
foreach $file (@filelist) {
        if ($file =~ m/\.fasta/) {
			print OU "diamond blastx -d $mpe_db -q $file -k 1 -p 64 -o $file.mpe.m8\n";
		}
}
close OU;
close DIR;
system ("sh sh.sh");
system ("mkdir $mpe");
system ("mv *.mpe.m8 $mpe");
