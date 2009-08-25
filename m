From: Will Newton <will.newton@gmail.com>
Date: Tue, 25 Aug 2009 13:07:52 +0100
Subject: [Buildroot] [PATCH] autoconf: Bump version to 2.64.
Message-ID: <87a5b0800908250507t49d4d1f7k8e65d2b73d8cb1c1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release of autoconf brings a number of bug fixes, including a change
to the autoreconf script to pass the correct include path parameter to
aclocal.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/autoconf/autoconf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 5e29909..97675c0 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -3,7 +3,7 @@
 # autoconf
 #
 #############################################################
-AUTOCONF_VERSION = 2.63
+AUTOCONF_VERSION = 2.64
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.bz2
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf

-- 
1.5.5.2
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-autoconf-Bump-version-to-2.64.patch
Type: text/x-patch
Size: 933 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090825/0ce8dec6/attachment.bin>
