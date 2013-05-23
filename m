From: Will Newton <will.newton@gmail.com>
Date: Thu, 23 May 2013 14:19:13 +0100
Subject: [Buildroot] [PATCH 1/2] udpcast: Bump version to 20120424.
Message-ID: <CAFbHwiSP74i6Qiid7uozxeKd5QPrf=5aD9+0=fUu6VZhZnwrJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@linaro.org>
---
 package/udpcast/udpcast.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index f900b92..54051b9 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -4,7 +4,7 @@
 #
 #############################################################

-UDPCAST_VERSION = 20071228
+UDPCAST_VERSION = 20120424
 UDPCAST_SOURCE = udpcast-$(UDPCAST_VERSION).tar.gz
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_CONF_ENV = $(if
$(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
--
1.8.1.4
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-udpcast-Bump-version-to-20120424.patch
Type: application/octet-stream
Size: 857 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130523/9724562f/attachment.obj>
