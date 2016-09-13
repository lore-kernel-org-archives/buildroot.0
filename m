From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 13 Sep 2016 20:01:02 +0200
Subject: [Buildroot] [PATCH] package/nginx-naxsi: add pcre dependency to .mk
Message-ID: <20160913180102.4825-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change completes the commit 218dfdd9038af882a02fe64f13a533c8ce75ddc1.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/nginx-naxsi/nginx-naxsi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
index 0e1f714..ad7749e 100644
--- a/package/nginx-naxsi/nginx-naxsi.mk
+++ b/package/nginx-naxsi/nginx-naxsi.mk
@@ -8,5 +8,6 @@ NGINX_NAXSI_VERSION = 0.54
 NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
 NGINX_NAXSI_LICENSE = GPLv2+ with OpenSSL exception
 NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
+NGINX_NAXSI_DEPENDENCIES = pcre
 
 $(eval $(generic-package))
-- 
2.9.3
