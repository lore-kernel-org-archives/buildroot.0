From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:49:01 +0200
Subject: [Buildroot] [PATCH 18/19] xerces: fix download location
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <96451c62fa97815b5f4f3fcc8b9765d021b6011f.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
