From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 21:12:31 +0200
Subject: [Buildroot] [git commit] package/terminology: bump to version 1.4.0
Message-ID: <20190413190814.0AB138E695@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aeb64b466fb62446e9b8a11e6f02e0f2d2050de8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update COPYING file hash due to year update.

https://sourceforge.net/p/enlightenment/mailman/message/36626985/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/terminology/terminology.hash | 6 +++---
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index 1e0a85cd23..6b96ed72ad 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,3 +1,3 @@
-# From https://sourceforge.net/p/enlightenment/mailman/message/36497308/
-sha256  b5171181da42cc5f384238f71e43302c2c760938f6a8ab931647ccdad4ef94cd  terminology-1.3.2.tar.xz
-sha256  605988548c7a52562d6f64d936a579b53f690e62ca92261b6a440bf9023ff521  COPYING
+# From https://sourceforge.net/p/enlightenment/mailman/message/36626985/
+sha256  ed5904ba5eb11c67790964306ec260b4134e2a443ef5abd5105610d9943b3e60  terminology-1.4.0.tar.xz
+sha256  a907d434f4691990ed8f2826ff7546672e9934a26c798351da12ed544dadc628  COPYING
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index c53f6829de..09b4e536a9 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.3.2
+TERMINOLOGY_VERSION = 1.4.0
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
