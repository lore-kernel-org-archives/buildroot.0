From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  3 Feb 2017 15:29:57 -0500
Subject: [Buildroot] [PATCH 09/11] nginx-naxsi: bump version to 0.55.1
In-Reply-To: <20170203202959.18916-1-aduskett@codeblue.com>
References: <20170203202959.18916-1-aduskett@codeblue.com>
Message-ID: <20170203202959.18916-9-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/nginx-naxsi/nginx-naxsi.hash | 2 +-
 package/nginx-naxsi/nginx-naxsi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx-naxsi/nginx-naxsi.hash b/package/nginx-naxsi/nginx-naxsi.hash
index 238993e..e545a1d 100644
--- a/package/nginx-naxsi/nginx-naxsi.hash
+++ b/package/nginx-naxsi/nginx-naxsi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	9cc2c09405bc71f78ef26a8b6d70afcea3fccbe8125df70cb0cfc480133daba5	nginx-naxsi-0.54.tar.gz
+sha256	45dd0df7a6b0b6aa9c64eb8c39a8e294d659d87fb18e192cf58f1402f3cdb0a8	nginx-naxsi-0.55.1.tar.gz
diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
index 0e1f714..1c5bd8d 100644
--- a/package/nginx-naxsi/nginx-naxsi.mk
+++ b/package/nginx-naxsi/nginx-naxsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_NAXSI_VERSION = 0.54
+NGINX_NAXSI_VERSION = 0.55.1
 NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
 NGINX_NAXSI_LICENSE = GPLv2+ with OpenSSL exception
 NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
-- 
2.9.3
