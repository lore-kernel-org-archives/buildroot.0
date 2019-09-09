From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 00:22:17 +0200
Subject: [Buildroot] [git commit] package/smcroute: bump to 2.4.4
Message-ID: <20190909221852.41DA2814D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09cc81ff1bf113a268520ea6ab30d9ab05ef5c0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/smcroute/smcroute.hash | 8 ++++----
 package/smcroute/smcroute.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index e5929bff7a..f79ce167ed 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,5 +1,5 @@
 # Locally generated
-sha256  d8c6abb45f5e13c8c557ad143f05e79778641eebef9bb28ef6eadb583d2a225e  smcroute-2.4.2.tar.xz
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-# From https://github.com/troglobit/smcroute/releases/download/2.4.2/smcroute-2.4.2.tar.xz.md5
-md5     85b8bbdf2dccecfea770bcd17a731cc7  smcroute-2.4.2.tar.xz
+sha256	431be94c46646767f69c85fee445277b7e765a55177d3ee29522416cfe2cc067  smcroute-2.4.4.tar.xz
+sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+# From https://github.com/troglobit/smcroute/releases/download/2.4.4/smcroute-2.4.4.tar.xz.md5
+md5	a1dc8c54c684e8c8de139444f73a0ba3  smcroute-2.4.4.tar.xz
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index aacf211387..1a36c75d47 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.4.2
+SMCROUTE_VERSION = 2.4.4
 SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
