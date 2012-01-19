From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Jan 2012 12:25:22 +0100
Subject: [Buildroot] [git commit] kmod: bump version
Message-ID: <20120119120038.36EF4902F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95632704cd966b32c3391aa732eaad10d24fe0fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/kmod.mk |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index a7a5bf5..0e3bc34 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -1,8 +1,7 @@
-KMOD_VERSION = 3
-KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.bz2
-KMOD_SITE = http://git.profusion.mobi/cgit.cgi/kmod.git/snapshot
-KMOD_INSTALL_STAGING =YES
-KMOD_AUTORECONF = YES
+KMOD_VERSION = 4
+KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
+KMOD_SITE = http://packages.profusion.mobi/kmod/
+KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkg-config
 
 $(eval $(call AUTOTARGETS))
