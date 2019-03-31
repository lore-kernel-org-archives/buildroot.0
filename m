From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 12:06:07 +0200
Subject: [Buildroot] [git commit] package/luvi: bump to version 2.9.3
Message-ID: <20190331100230.717448A53C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e7fda9d5a73dcd13d2c8847a16c9e5285346ede
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luvi/luvi.hash | 2 +-
 package/luvi/luvi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index 084f3a42cd..4627db5c5c 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  81e898dc67b8166222716f763d8d0e0307132edc999167259d28ad0b54e20a7f  luvi-src-v2.9.0.tar.gz
+sha256  a38e440d3f82d75f428bafc3f3cd51cb64f8a03c9e0eb297b0ff27c5209edebb  luvi-src-v2.9.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index c43033f4f3..ea296d2d7b 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUVI_VERSION = v2.9.0
+LUVI_VERSION = v2.9.3
 LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
 LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
