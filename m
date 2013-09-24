From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 24 Sep 2013 16:37:27 +0200
Subject: [Buildroot] [PATCH] libevent: Bump to 2.0.21
Message-ID: <1380033447-494-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the build on ARC as well, as 2.0.17 includes a fix
that checks for existence of 'sysctl'.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/libevent/libevent.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 94882b5..f7b4253 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVENT_VERSION = 2.0.14
+LIBEVENT_VERSION = 2.0.17
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
 LIBEVENT_INSTALL_STAGING = YES
-- 
1.7.9.5
