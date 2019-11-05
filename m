From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue,  5 Nov 2019 21:32:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/unrar: bump to version 5.8.3
Message-ID: <20191105203219.1855-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index 7f9bb865c8..f688a4e364 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	33386623fd3fb153b56292df4a6a69b457e69e1803b6d07b614e5fd22fb33dda	unrarsrc-5.8.2.tar.gz
+sha256	3591685c8f5bbcb0be09de3d0a0544adb88966b9cccb80986f6cd2b534fd91a6	unrarsrc-5.8.3.tar.gz
 sha256	6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a	license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index 942f52b031..cdaff26988 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 5.8.2
+UNRAR_VERSION = 5.8.3
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = http://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
-- 
2.20.1
