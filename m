From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Jun 2014 14:54:32 -0300
Subject: [Buildroot] [PATCH] p910nd: bump to version 0.97
Message-ID: <1402422872-26393-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/p910nd/p910nd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/p910nd/p910nd.mk b/package/p910nd/p910nd.mk
index 48bb7e1..73667d7 100644
--- a/package/p910nd/p910nd.mk
+++ b/package/p910nd/p910nd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P910ND_VERSION = 0.95
+P910ND_VERSION = 0.97
 P910ND_SITE = http://downloads.sourceforge.net/project/p910nd/p910nd/$(P910ND_VERSION)
 P910ND_SOURCE = p910nd-$(P910ND_VERSION).tar.bz2
 P910ND_LICENSE = GPLv2
-- 
1.8.5.5
