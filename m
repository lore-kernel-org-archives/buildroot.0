From: Will Newton <will.newton@gmail.com>
Date: Mon, 21 Sep 2009 17:42:22 +0200
Subject: [Buildroot] [git commit master] autoconf: Bump version to 2.64.
Message-ID: <20090921154311.932DC77764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b7f689ae2d72a830ec1d1a6583ba8cf66a01e7a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release of autoconf brings a number of bug fixes, including a change
to the autoreconf script to pass the correct include path parameter to
aclocal.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/autoconf/autoconf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 4f5d95a..e2761c7 100644
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
1.6.3.3
