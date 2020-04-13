From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Apr 2020 15:05:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/unrar: bump version to 5.9.2
Message-ID: <20200413130551.885399-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.rarlab.com/rarnew.htm

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index f688a4e364..86549b4ea7 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	3591685c8f5bbcb0be09de3d0a0544adb88966b9cccb80986f6cd2b534fd91a6	unrarsrc-5.8.3.tar.gz
+sha256	73d3baf18cf0a197976af2794a848893c35e7d42cee0ff364c89d2e476ebdaa6	unrarsrc-5.9.2.tar.gz
 sha256	6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a	license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index cdaff26988..5c6f4b58da 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 5.8.3
+UNRAR_VERSION = 5.9.2
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = http://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
-- 
2.25.0
