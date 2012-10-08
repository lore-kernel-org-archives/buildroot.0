From: Alexander Khryukin <alexander@mezon.ru>
Date: Mon, 08 Oct 2012 15:28:11 +0400
Subject: [Buildroot] rpm5
Message-ID: <1349695691.6518.2.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!
I faced with strange error with rpm5 package manager:


=== THIRD-PARTY LIBRARIES (2/2) ===
checking popt.h usability... yes
checking popt.h presence... yes
checking for popt.h... yes
checking for poptGetContext in -lpopt... yes
checking whether to build with POPT library... yes (external: via
pkg-config popt)
checking zlib.h usability... yes
checking zlib.h presence... yes
checking for zlib.h... yes
checking for gzread in -lrpmz... no
checking for gzread in -lz... yes
checking for gzread in -lgz... no
checking whether to build with ZLib library... yes (external: via
pkg-config zlib)
checking for gzseek... yes
checking bzlib.h usability... yes
checking bzlib.h presence... yes
checking for bzlib.h... yes
checking for BZ2_bzread in -lbz2... yes
checking whether to build with GNU BZip2 library... yes (external:
implicitly)
checking whether to build with XZ libLZMA library... yes (internal:
sub-directory xz)
checking beecrypt/api.h usability... yes
checking beecrypt/api.h presence... yes
checking for beecrypt/api.h... yes
checking for mpfprintln in -lbeecrypt... no
checking whether to build with BeeCrypt library... no
configure: error: mandatory BeeCrypt library not found
make: ***
[/home/fdkit/buildroot/output/build/rpm-5.2.0/.stamp_configured] Error 1


Full log
http://pastie.org/4932495

Locally i have installed rpm5 distro Mandriva 2012 and 
i can rebuild rpm5 package manager without any errors.
Any solution?
