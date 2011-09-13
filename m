From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 13 Sep 2011 23:57:28 +0200
Subject: [Buildroot] [PATCH 0/2] fixup version strings after GPL compliance
	issue in gdb, v2
Message-ID: <1315951050-19272-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

Recently, a GPL compliance issue was found in binutils and gdb (and emacs,
but who cares? ;-)). More info is available in each patch's commit message.

This patchset addresses the gdb issue; binutils will come later when we
get to solve the existing issues.

Changes since v1:
 - fix-up commit messages (Peter)

 [PATCH 1/2] toolchain/gdb: strip tarball component when extracting
 [PATCH 2/2] toolchain/gdb: fixup version strings

Regards,
Yann E. MORIN.
