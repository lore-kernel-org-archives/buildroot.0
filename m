From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 18:48:01 -0300
Subject: [Buildroot] [PATCH 12/20] libfuse: bump to version 2.8.7
In-Reply-To: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1331502489-5036-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libfuse/libfuse.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 25cc45f..3616c65 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBFUSE_VERSION = 2.8.6
+LIBFUSE_VERSION = 2.8.7
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/
 
-- 
1.7.3.4
