From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jul 2010 10:24:08 +0200
Subject: [Buildroot] [git commit master 1/1] xerces: fix download location
Message-ID: <20100730082548.5C594836C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=96451c62fa97815b5f4f3fcc8b9765d021b6011f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

apache.jumper.nu does not work anymore, so use archive.apache.org
instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xerces/xerces.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 8a1f693..fd0417d 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -5,7 +5,7 @@
 #############################################################
 XERCES_VERSION:=3.0.1
 XERCES_SOURCE:=xerces-c-$(XERCES_VERSION).tar.gz
-XERCES_SITE:=http://apache.jumper.nu/xerces/c/3/sources/
+XERCES_SITE:=http://archive.apache.org/dist/xerces/c/3/sources/
 XERCES_CAT:=$(ZCAT)
 XERCES_DIR:=$(BUILD_DIR)/xerces-c-$(XERCES_VERSION)
 LIBXERCES_BINARY:=libxerces-c-3.0.so
-- 
1.7.1
