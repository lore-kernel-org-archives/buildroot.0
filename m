From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 16 Jul 2014 20:15:37 -0300
Subject: [Buildroot] [PATCH] transmission: security bump to version 2.84
Message-ID: <1405552537-4307-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-4909 (peer communication vulnerability).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/transmission/transmission.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 07a76ab..10a11d4 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 2.83
+TRANSMISSION_VERSION = 2.84
 TRANSMISSION_SITE = http://download.transmissionbt.com/files/
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
-- 
1.8.5.5
