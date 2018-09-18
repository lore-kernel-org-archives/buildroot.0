From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 21:09:03 +0200
Subject: [Buildroot] [git commit] smcroute: bump to version 2.4.2
Message-ID: <20180918190905.793AD884C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0760e6ba8cae4fb9c646bd1be54857f48319df76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it, add a hash for the license file.

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
[Thomas: add hash for license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/smcroute/smcroute.hash | 7 ++++---
 package/smcroute/smcroute.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index 0487ef6cab..e5929bff7a 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,4 +1,5 @@
 # Locally generated
-sha256  cd6c5cc2edfa1348acb07ed026180ebfc8dd0f87153f5382cb27cb5557724c56  smcroute-2.3.1.tar.xz
-# From https://github.com/troglobit/smcroute/releases/download/2.3.1/smcroute-2.3.1.tar.xz.md5
-md5     d8080828b7730bffb86969afd2bf94cb  smcroute-2.3.1.tar.xz
+sha256  d8c6abb45f5e13c8c557ad143f05e79778641eebef9bb28ef6eadb583d2a225e  smcroute-2.4.2.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+# From https://github.com/troglobit/smcroute/releases/download/2.4.2/smcroute-2.4.2.tar.xz.md5
+md5     85b8bbdf2dccecfea770bcd17a731cc7  smcroute-2.4.2.tar.xz
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index e7e6ef1521..aacf211387 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.3.1
+SMCROUTE_VERSION = 2.4.2
 SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
