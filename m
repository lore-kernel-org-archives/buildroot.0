From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Nov 2010 17:45:03 +0100
Subject: [Buildroot] [PATH 00/10] toolchain/crosstool-NG: fixes before
	release
Message-ID: <1290876313-15131-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patch series enables building on a minimalistic host (patch 1, tested in
the same mini-environemnt as Thomas), adds some infrastructure (patches 2-5)
to be able to push Buildroot options down to uClibc's config (patches 6-10).

 [PATCH 01/10] toolchain/crosstool-NG: add dependencies on host- tools
 [PATCH 02/10] toolchain/crosstool-NG: reorder sed expressions
 [PATCH 03/10] toolchain/crosstool-NG: use a copy of the uClibc .config
 [PATCH 04/10] toolchain/crosstool-NG: move munging functions
 [PATCH 05/10] toolchain/crosstool-NG: add C library config munging
 [PATCH 06/10] toolchain/crosstool-NG: use wide-char option
 [PATCH 07/10] toolchain/crosstool-NG: use locales option
 [PATCH 08/10] toolchain/crosstool-NG: use LFS option
 [PATCH 09/10] toolchain/crosstool-NG: use IPv6 option
 [PATCH 10/10] toolchain/crosstool-NG: use RPC option

 toolchain/toolchain-crosstool-ng/001-no-cvs.patch |   15 ++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk  |  146 ++++++++++++++++-----
 2 files changed, 127 insertions(+), 34 deletions(-)

Regards,
Yann E. MORIN.
