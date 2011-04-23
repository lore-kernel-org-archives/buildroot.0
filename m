From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 23 Apr 2011 18:18:33 +0200
Subject: [Buildroot] [PATCH 0/1] toolchain/crosstool-NG: fix copying the
	dynamic linker
Message-ID: <1303575514-22656-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Depending on some configurations (arch? bitness? others? combination of
many settings?...), the dynamic linker can get different names.

This patch implements a crude /heuristic/ to copy ld.so (see patch
commit message). It is copied from the standard external toolchain
code, so should behave the same wrt ld.so ( and we know that external
toolchain does work, don't we? ;-) ).

  [PATCH] toolchain/crosstool-NG: correctly copy the dynamic linker

Thanks to Ettore Campion for being stubborn, and providing some dumps
of its output files. Cheers! ;-)

Regards,
Yann E. MORIN.

PS. Ettore, sorry for the dups, I'm having issues with my mails. PEBCAK...
