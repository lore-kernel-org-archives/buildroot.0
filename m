From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 21:06:26 +0200
Subject: [Buildroot] [git commit] package/libsquish: fix legal-info
Message-ID: <20170429190859.6419B816B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1aa5740cb71a0e96e4763e267bc92a5909bdae2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/4f8/4f81644ca2e0ec4064f43c6cb00f2d5c858bbf77/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsquish/libsquish.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsquish/libsquish.mk b/package/libsquish/libsquish.mk
index 9b447b0..67892dd 100644
--- a/package/libsquish/libsquish.mk
+++ b/package/libsquish/libsquish.mk
@@ -10,7 +10,7 @@ LIBSQUISH_SITE = http://downloads.sourceforge.net/project/libsquish
 LIBSQUISH_INSTALL_STAGING = YES
 LIBSQUISH_STRIP_COMPONENTS = 0
 LIBSQUISH_LICENSE = MIT
-LIBSQUISH_LICENSE_FILES = README
+LIBSQUISH_LICENSE_FILES = LICENSE.txt
 
 define LIBSQUISH_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
