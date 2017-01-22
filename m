From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Jan 2017 23:35:15 +0100
Subject: [Buildroot] [git commit] package/wavpack: bump to version 5.1.0
Message-ID: <20170122223619.7A8C281D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbc108d6729a082d247910d1476df358570036ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wavpack/wavpack.hash | 2 +-
 package/wavpack/wavpack.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
index 0ec287d..56ba7d8 100644
--- a/package/wavpack/wavpack.hash
+++ b/package/wavpack/wavpack.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256  918d7e32a19598df543b17fff840b10a0880f87296f9e32af454d256b6a64049  wavpack-5.0.0.tar.bz2
+sha256  1939627d5358d1da62bc6158d63f7ed12905552f3a799c799ee90296a7612944  wavpack-5.1.0.tar.bz2
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index 8fef548..daa0888 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVPACK_VERSION = 5.0.0
+WAVPACK_VERSION = 5.1.0
 WAVPACK_SITE = http://www.wavpack.com
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.bz2
 WAVPACK_INSTALL_STAGING = YES
