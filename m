From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 11:09:05 +0200
Subject: [Buildroot] failing to build the buildroot
In-Reply-To: <OF63068367.6ED17E33-ONC2257328.002FE884-C3257328.002ACB29@visonic.com>
References: <OF63068367.6ED17E33-ONC2257328.002FE884-C3257328.002ACB29@visonic.com>
Message-ID: <20070730090905.GA23273@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 30, 2007 at 12:51:31PM +0400, Shai Lifshitz wrote:
>Dir Sir,
>
>I downloaded today the buildroot-snapshot.tar.bz2.tar file from the FTP 

>10:28:27 (9.77 KB/s) 
>-`/home/shail/downloads/tt3/buildroot/dl/gcc-4.2.0.tar.bz2' 
>saved[44,057,527/44,057,527]
>
>mkdir -p /home/shail/downloads/tt3/buildroot/toolchain_build_arm
>rm -rf /home/shail/downloads/tt3/buildroot/toolchain_build_arm/gcc-4.2.0
>bzcat /home/shail/downloads/tt3/buildroot/dl/gcc-4.2.0.tar.bz2 | tar -C 
>/home/shail/downloads/tt3/buildroot/toolchain_build_arm   -xf -
>
>tar: Skipping to next header
>tar: Archive contains obsolescent base-64 headers
>
>bzcat: Data integrity error when decompressing.
>        Input file = 
>/home/shail/downloads/tt3/buildroot/dl/gcc-4.2.0.tar.bz2, output file = 
>(stdout)
>
>It is possible that the compressed file(s) have become corrupted.

Well, this says about all..
