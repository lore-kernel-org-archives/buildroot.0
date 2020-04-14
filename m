From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Apr 2020 21:48:40 +0200
Subject: [Buildroot] [PATCH 3/3] package/snort: bump version to 2.9.16
In-Reply-To: <20200414194840.1344508-1-bernd.kuhls@t-online.de>
References: <20200414194840.1344508-1-bernd.kuhls@t-online.de>
Message-ID: <20200414194840.1344508-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added md5 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/snort/snort.hash | 4 +++-
 package/snort/snort.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index 7364df1330..2c7f37e0d5 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,5 +1,7 @@
+# From https://www.snort.org/downloads/snort/md5s
+md5 1cec58babaea3420014d61a93e6e1545 snort-2.9.16.tar.gz
 # Locally computed:
-sha256 2cccfc1d1a706586cd47ae9f085a7d5e4e36390b8e9c28cd2020b4b5b587f6c3  snort-2.9.15.1.tar.gz
+sha256 9688d8edf1da09dec6574000fb3c0e62f99c56428587616e17c60103c0bcbad7  snort-2.9.16.tar.gz
 
 # Hash for license files:
 sha256 f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 0f1d6b13de..f84cf83138 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.15.1
+SNORT_VERSION = 2.9.16
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
-- 
2.25.0
