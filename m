From: cmchao <cmchao@gmail.com>
Date: Wed, 16 Jun 2010 19:47:02 +0800
Subject: [Buildroot] [PATCH 00/19] Convert packages to new autotools
Message-ID: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 The patch base on 5fd095b3748115d7cbe89524332e4b310550b7c3
  
 Peter Korsgaard <jacmet@sunsite.dk>
                toolchain: remove gcc 4.1.2 and non-sysroot support

 The work convert 19 autotool-based packages to new infrastructure and some of them
 are upgraded to new version

 [PATCH 01/19] distcc : convert to autotools infrastructure & bump to 1.1-20100428
 [PATCH 02/19] dmalloc : convert to autotools infrastructure
 [PATCH 03/19] fbv : convert to autotools infrastructure
 [PATCH 04/19] links : convert to autotools infrastructure & bump to 1.01pre1-no-ssl
 [PATCH 05/19] dialog : convert to autotools infrastructure & bump to 1.1-20100428
 [PATCH 06/19] berkeleydb : convert to autotools infrastructure & bump to 4.4.20
 [PATCH 07/19] dash : convert to autotools infrastructure & bump to 0.5.5.1
 [PATCH 08/19] diffutils : convert to autotools infrastructure
 [PATCH 09/19] libfuse : convert to autotools infrastructure & bump to 2.8.4
 [PATCH 10/19] gzip : convert to autotools infrastructure & bump to 1.4
 [PATCH 11/19] make : convert to autotools infrastructure
 [PATCH 12/19] quagga : convert to autotools infrastructure & bump to 0.99.12
 [PATCH 13/19] sdl_mixer : convert to autotools infrastructure & bump to 1.2.11
 [PATCH 14/19] sdl_ttf : convert to autotools infrastructure
 [PATCH 15/19] sdl : convert to autotools infrastructure & bump to 1.2.14
 [PATCH 16/19] gmp : convert to autotools infrastructure & bump to 5.0.1
 [PATCH 17/19] libgpg-error : convert to autotools infrastructure & bump to 1.8
 [PATCH 18/19] liblockfile : convert to autotools infrastructure & bump to 1.08-4
 [PATCH 19/19] lrzsz : convert to autotools infrastructure
