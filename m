From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 24 Sep 2013 16:42:44 +0200
Subject: [Buildroot] [PATCHv2] libevent: Bump to 2.0.21
Message-ID: <1380033764-906-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the build on ARC as well, as 2.0.17 includes a fix
that checks for existence of 'sysctl'.

v2: Change 2.0.17 to 2.0.21, as that is the latest stable version.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/libevent/libevent.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 94882b5..a6def1a 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVENT_VERSION = 2.0.14
+LIBEVENT_VERSION = 2.0.21
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
 LIBEVENT_INSTALL_STAGING = YES
-- 
1.7.9.5
