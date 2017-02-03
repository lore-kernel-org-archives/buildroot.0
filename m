From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  3 Feb 2017 15:29:54 -0500
Subject: [Buildroot] [PATCH 06/11] libmicrohttpd: bump version to 0.9.52
In-Reply-To: <20170203202959.18916-1-aduskett@codeblue.com>
References: <20170203202959.18916-1-aduskett@codeblue.com>
Message-ID: <20170203202959.18916-6-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index b228716..5c15b9d 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d1b6385068abded29b6470e383287aa7705de05ae3c08ad0bf5747ac4dc6ebd7	libmicrohttpd-0.9.50.tar.gz
+sha256	54797f6e763d417627f89f60e4ae0a431dab0523f92f83def23ea02d0defafea	libmicrohttpd-0.9.52.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 2266d3c..83791b3 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.50
+LIBMICROHTTPD_VERSION = 0.9.52
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
-- 
2.9.3
