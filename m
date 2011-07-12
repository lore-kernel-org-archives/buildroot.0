From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 13 Jul 2011 01:07:44 +0200
Subject: [Buildroot] [PATCH 0/2] Allow only downloading sources with
	crosstool-NG backend
Message-ID: <1310512066-11450-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patch series allows one to call 'make source' for later off-line build,
even when the toolchain backend is crosstool-NG.

  [PATCH 1/2] toolchain/crosstool-ng: allow pre-downloading the sources
  [PATCH 2/2] source: print messages when all sources downloaded

Regards,
Yann E. MORIN
