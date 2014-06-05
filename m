From: Xh Xiao <xxiao8@fosiao.com>
Date: Thu, 5 Jun 2014 10:38:01 -0500
Subject: [Buildroot] [PATCH 1/1] Bump live555 to 2014.05.27
Message-ID: <CAOMv6Xwi_5S6bxjGMJCUWFgizJtstE1FOXOY-t_U0KafKKj6jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update live555 to newer version

Signed-off-by: xxiao <xxiao8@fosiao.com>
---
 package/live555/live555.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 756bec6..8b2ac10 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LIVE555_VERSION = 2014.01.11
+LIVE555_VERSION = 2014.05.27
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public/
 LIVE555_LICENSE = LGPLv2.1+
-- 
1.7.9.5
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140605/06ba0063/attachment.html>
