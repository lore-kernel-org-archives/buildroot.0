From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 18:52:04 +0100
Subject: [Buildroot] [PATCH 1/5] package/unzip: make version compliant with
 release-monitoring
Message-ID: <20210117175208.366428-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unzip/unzip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 1d972055de..d435fb6b5d 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UNZIP_VERSION = 60
-UNZIP_SOURCE = unzip$(UNZIP_VERSION).tgz
+UNZIP_VERSION = 6.0
+UNZIP_SOURCE = unzip$(subst .,,$(UNZIP_VERSION)).tgz
 UNZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
-- 
2.29.2
