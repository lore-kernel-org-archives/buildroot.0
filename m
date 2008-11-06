From: miroslav.misek at netgarden.cz <miroslav.misek@netgarden.cz>
Date: Thu, 06 Nov 2008 11:26:01 +0100
Subject: [Buildroot] binutils in target system
Message-ID: <20081106112601.18663leya9yna1q8@mail.netgarden.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

is there any chance to compile and install binutils into target  
system? Because I found, that is just impossible to compile any larger  
program (as rpm) - it fails on using "ar" with unknown parameters.  
Compiling binutils inside final root fails with same fault.


Fault:

make[2]: Entering directory `/root/binutils-2.19.50.0.1/libiberty'
rm -f ./libiberty.a pic/./libiberty.a
ar rc ./libiberty.a \
           ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o  
./alloca.o ./argv.o ./choose-temp.o ./concat.o ./cp-demint.o  
./dyn-string.o ./fdmatch.o ./fibheap.o ./filename_cmp.o  
./floatformat.o ./fnmatch.o ./fopen_unlocked.o ./getopt.o ./getopt1.o  
./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbasename.o  
./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc.o  
./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o  
./pex-one.o ./pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o  
./splay-tree.o ./strerror.o ./strsignal.o ./unlink-if-ordinary.o  
./xatexit.o ./xexit.o ./xmalloc.o ./xmemdup.o ./xstrdup.o  
./xstrerror.o ./xstrndup.o  ./bcmp.o ./bcopy.o ./bzero.o ./index.o  
./mkstemps.o ./rindex.o ./strverscmp.o
BusyBox v1.12.1 (2008-11-04 17:51:50 CET) multi-call binary

Usage: ar [-o] [-v] [-p] [-t] [-x] ARCHIVE FILES

Extract or list FILES from an ar archive

Options:
         -o      Preserve original dates
         -p      Extract to stdout
         -t      List
         -x      Extract
         -v      Verbose

make[2]: *** [libiberty.a] Error 1
make[2]: Leaving directory `/root/binutils-2.19.50.0.1/libiberty'
make[1]: *** [all-libiberty] Error 2
make[1]: Leaving directory `/root/binutils-2.19.50.0.1'
make: *** [all] Error 2



Thanks.

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
