From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 11 Sep 2011 17:38:06 +0200
Subject: [Buildroot] [PATCH 0/4] fixup version strings after GPL compliance
	issue in binutils and gdb
Message-ID: <1315755490-9920-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Recently, a GPL compliance issue was found in binutils and gdb (and emacs,
but who cares? ;-)). This patchset is an attempt at fixing this issue.
More info is available in each patch's commit message.

 [PATCH 1/4] package/binutils: fixup version strings 1/2
 [PATCH 2/4] package/binutils: fixup version strings 2/2
 [PATCH 3/4] toolchain/gdb: strip tarball component when extracting
 [PATCH 4/4] toolchain/gdb: fixup version strings

Regards,
Yann E. MORIN.
