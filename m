From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 20:50:41 +0200
Subject: [Buildroot] [git commit] toolchain-crosstool-ng: remove support
Message-ID: <20131006194411.536AD9B92C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f742fe440797ef345266845a14c6c65a86e3af4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to avoid the work of converting the toolchain-crosstool-ng
logic to the package infrastructure, we remove it from Buildroot,
since it has been deprecated since quite some time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                                           |    7 -
 package/Makefile.in                                |    2 +-
 package/libglib2/libglib2.mk                       |    2 +-
 toolchain/Config.in                                |   13 -
 toolchain/helpers.mk                               |    4 +-
 toolchain/toolchain-common.in                      |    4 -
 toolchain/toolchain-crosstool-ng.mk                |    5 -
 toolchain/toolchain-crosstool-ng/Config.in         |  133 ------
 .../crosstool-ng.config-eglibc                     |  502 --------------------
 .../crosstool-ng.config-glibc                      |  491 -------------------
 .../crosstool-ng.config-uClibc                     |  473 ------------------
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |  396 ---------------
 12 files changed, 3 insertions(+), 2029 deletions(-)

Patch is too large, so refusing to show it
