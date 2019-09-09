From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 00:20:53 +0200
Subject: [Buildroot] [git commit] package/tclap: bump to 1.2.2
Message-ID: <20190909221722.28C738D6D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb569ea39e58e3bcfa9b99270eeec9f0dafa3c45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tclap/tclap.hash | 3 ++-
 package/tclap/tclap.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tclap/tclap.hash b/package/tclap/tclap.hash
index 55d475fc89..2b2097be97 100644
--- a/package/tclap/tclap.hash
+++ b/package/tclap/tclap.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  9f9f0fe3719e8a89d79b6ca30cf2d16620fba3db5b9610f9b51dd2cd033deebb  tclap-1.2.1.tar.gz
+sha256	f5013be7fcaafc69ba0ce2d1710f693f61e9c336b6292ae4f57554f59fde5837  tclap-1.2.2.tar.gz
+sha256	cd81a61d47aeb1ed63036ca260baee37719923bbd7ebd988ec4edae128f3b6eb  COPYING
diff --git a/package/tclap/tclap.mk b/package/tclap/tclap.mk
index 807f247988..63dea67ac4 100644
--- a/package/tclap/tclap.mk
+++ b/package/tclap/tclap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCLAP_VERSION = 1.2.1
+TCLAP_VERSION = 1.2.2
 TCLAP_SITE = http://downloads.sourceforge.net/project/tclap
 TCLAP_LICENSE = MIT
 TCLAP_LICENSE_FILES = COPYING
