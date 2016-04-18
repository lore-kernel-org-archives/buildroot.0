From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:21:42 +0200
Subject: [Buildroot] [git commit] rp-pppoe: bump to version 3.12
Message-ID: <20160418192251.D2BBA8082A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dbb9d978839b9dca062e272cbc5f3b049e8ea4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rp-pppoe/rp-pppoe.hash | 2 +-
 package/rp-pppoe/rp-pppoe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rp-pppoe/rp-pppoe.hash b/package/rp-pppoe/rp-pppoe.hash
index ab162ee..0cf85a0 100644
--- a/package/rp-pppoe/rp-pppoe.hash
+++ b/package/rp-pppoe/rp-pppoe.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	86a1a4d92fcea74fa6dd45516c5975933fa978b36fafe71f76ea70b4b4747720	rp-pppoe-3.11.tar.gz
+sha256	00794e04031546b0e9b8cf286f2a6d1ccfc4a621b2a3abb2d7ef2a7ab7cc86c2	rp-pppoe-3.12.tar.gz
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 5cb4960..4306254 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RP_PPPOE_VERSION = 3.11
+RP_PPPOE_VERSION = 3.12
 RP_PPPOE_SITE = http://www.roaringpenguin.com/files/download
 RP_PPPOE_LICENSE = GPLv2
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
