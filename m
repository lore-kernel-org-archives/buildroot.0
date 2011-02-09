From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed,  9 Feb 2011 23:57:18 +0100
Subject: [Buildroot] [PATCH 0/4] Update crosstool-NG backend
Message-ID: <1297292242-5300-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

This patch series updates the crosstool-NG backend:
- update to crosstool-NG 1.10.0, remove upstreamed patches
- use more options from the BR config into CT-NG config

 [PATCH 1/4] toolchain/ct-ng: update to crosstool-NG 1.10.0
 [PATCH 2/4] toolchain/ct-ng: use MMU option from the BR config
 [PATCH 3/4] toolchain/ct-ng: use processor variant from BR config
 [PATCH 4/4] toolchain/ct-ng: use soft-float option from BR config

 toolchain/toolchain-crosstool-ng/001-no-cvs.patch  |    2 +-
 .../002-dont-nuke-ct-prefix.patch                  |   37 ------
 .../toolchain-crosstool-ng/003-use-sysroot.patch   |   35 -----
 .../toolchain-crosstool-ng/crosstool-ng.config     |  133 +++++++++++---------
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |   27 ++++-
 5 files changed, 100 insertions(+), 134 deletions(-)

Regards,
Yann E. MORIN.
