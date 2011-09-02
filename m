From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Sep 2011 11:04:50 -0300
Subject: [Buildroot] [PATCH 02/13] libreplaygain: bump to r475
In-Reply-To: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
References: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1314972301-5067-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/libreplaygain/libreplaygain.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libreplaygain/libreplaygain.mk b/package/multimedia/libreplaygain/libreplaygain.mk
index c941092..cc023a0 100644
--- a/package/multimedia/libreplaygain/libreplaygain.mk
+++ b/package/multimedia/libreplaygain/libreplaygain.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBREPLAYGAIN_VERSION =  r453
+LIBREPLAYGAIN_VERSION =  r475
 LIBREPLAYGAIN_SITE = http://files.musepack.net/source
 LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
 # upstream doesn't ship configure
-- 
1.7.3.4
