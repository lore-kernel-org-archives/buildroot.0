From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jun 2017 10:31:40 +0200
Subject: [Buildroot] [git commit] libpth: fix license info
Message-ID: <20170615083304.2A59381DEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2fcf148d233ff2c98bb4f404e1913c9da3ee0a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NEWS states:
* Change license from LGPLv3+/GPLv2+ to LGPLv2+.

Fixes:
http://autobuild.buildroot.net/results/bef/bef969ede5fc792b0a03f5669071600a0f746a7a/
http://autobuild.buildroot.net/results/2d5/2d59b8e6d69b70c621ff2031a9c4fd9e67ef13cf/
http://autobuild.buildroot.net/results/631/6318505c8e293e6c00b20eec39d851d0d15f6fec/

[Peter: also adjust _LICENSE, extend commit message]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnpth/libnpth.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index dcaf868..7b2eb2a 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -7,8 +7,8 @@
 LIBNPTH_VERSION = 1.5
 LIBNPTH_SOURCE = npth-$(LIBNPTH_VERSION).tar.bz2
 LIBNPTH_SITE = https://www.gnupg.org/ftp/gcrypt/npth
-LIBNPTH_LICENSE = LGPL-3.0+ or GPL-2.0+
-LIBNPTH_LICENSE_FILES = COPYING COPYING.LESSER
+LIBNPTH_LICENSE = LGPL-2.0+
+LIBNPTH_LICENSE_FILES = COPYING.LIB
 LIBNPTH_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
