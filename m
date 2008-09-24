From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed, 24 Sep 2008 02:12:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20080924091207.220273C2C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-24 02:12:06 -0700 (Wed, 24 Sep 2008)
New Revision: 23459

Log:
openssl: add patch for AVR32 support and optimization

This patch adds support for AVR32 architecture and adds an optimized DES and
AES algorithm for this architecture.



Added:
   trunk/buildroot/package/openssl/openssl-0.9.8g-avr32-asm-optimizations.patch.avr32


Changeset:

Sorry, the patch is too large to include (6369 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=23459
