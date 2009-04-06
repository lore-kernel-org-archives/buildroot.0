From: correa at uclibc.org <correa@uclibc.org>
Date: Mon,  6 Apr 2009 21:44:53 +0000 (UTC)
Subject: [Buildroot] svn commit: [25999] trunk/buildroot/package/openssl
Message-ID: <20090406214453.9742C771A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-04-06 21:44:52 +0000 (Mon, 06 Apr 2009)
New Revision: 25999

Log:
Remove asm optimization patch for AVR32. This is non-essencial, yet, was unclean and prevented the build from completing. Asked Atmel to submit upstream.

Removed:
   trunk/buildroot/package/openssl/openssl-0.9.8j-avr32-asm-optimizations.patch.avr32


Changeset:

Sorry, the patch is too large to include (6360 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=25999
