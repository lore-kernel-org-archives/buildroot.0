From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun,  3 Mar 2013 13:27:39 -0800
Subject: [Buildroot] [PATCH] httping: bump to version 1.6.0
In-Reply-To: <y>
References: <y>
Message-ID: <1362346059-22762-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/httping/httping.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index e92be61..2ebc75e 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-HTTPING_VERSION = 1.5.7
+HTTPING_VERSION = 1.6
 HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
 HTTPING_SITE = http://www.vanheusden.com/httping
 HTTPING_LICENSE = GPLv2
-- 
1.7.10.4
