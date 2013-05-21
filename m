From: Will Newton <will.newton@gmail.com>
Date: Tue, 21 May 2013 16:07:56 +0100
Subject: [Buildroot] [PATCH] libnspr: Bump version to 4.9.6.
Message-ID: <CAFbHwiSA_213BPUWeLKhLuXPcVXvyjSxHr7HR4j9gO+4Hv+DQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the build for aarch64.

Signed-off-by: Will Newton <will.newton@linaro.org>
---
 package/libnspr/libnspr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 5b1333d..e934281 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -3,7 +3,7 @@
 # libnspr
 #
 #############################################################
-LIBNSPR_VERSION = 4.9.2
+LIBNSPR_VERSION = 4.9.6
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE =
https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src/
 LIBNSPR_SUBDIR = mozilla/nsprpub
--
1.8.1.4
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-libnspr-Bump-version-to-4.9.6.patch
Type: application/octet-stream
Size: 875 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130521/1c09c4e9/attachment.obj>
