From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 21:42:15 +0100
Subject: [Buildroot] [git commit] package/mrouted: bump to version 4.2
Message-ID: <20210123202257.4ECF27FAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a983787f44cdc28b2ccfda76967df390923f7cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mrouted/mrouted.hash | 6 +++---
 package/mrouted/mrouted.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
index 22eeb8cef8..188293025f 100644
--- a/package/mrouted/mrouted.hash
+++ b/package/mrouted/mrouted.hash
@@ -1,6 +1,6 @@
-# From https://github.com/troglobit/mrouted/releases/download/4.1/mrouted-4.1.tar.gz.md5
-md5  e1f9bc0a895a2accae511a44e2a4a6f7  mrouted-4.1.tar.gz
+# From https://github.com/troglobit/mrouted/releases/download/4.2/mrouted-4.2.tar.gz.md5
+md5  b921f9e152e039efdac745438ef8362c  mrouted-4.2.tar.gz
 
 # Locally calculated
-sha256  fd4735316f5510dfccfcbed441aa11619b261501dccf9e793a311d618c0843c5  mrouted-4.1.tar.gz
+sha256  689541334ea951286054b771640e9d0f26b6a3242ff7f3894a3ef1b680811b34  mrouted-4.2.tar.gz
 sha256  834f45ed282fd010f354ecc0a50538af519a1cfcc4d2866de3be06982fa9ed29  LICENSE
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 4e3715b445..6005066577 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MROUTED_VERSION = 4.1
+MROUTED_VERSION = 4.2
 MROUTED_SITE = \
 	https://github.com/troglobit/mrouted/releases/download/$(MROUTED_VERSION)
 MROUTED_DEPENDENCIES = host-bison
