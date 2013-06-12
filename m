From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Jun 2013 11:14:27 -0300
Subject: [Buildroot] [PATCH 3/5] gzip: bump to version 1.6
In-Reply-To: <1371046469-19194-1-git-send-email-gustavo@zacarias.com.ar>
References: <1371046469-19194-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1371046469-19194-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gzip/gzip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 5ece73a..fd06bbc 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.5
+GZIP_VERSION = 1.6
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 GZIP_LICENSE = GPLv3+
 GZIP_LICENSE_FILES = COPYING
-- 
1.8.1.5
