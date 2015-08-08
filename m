From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 11:16:30 +0200
Subject: [Buildroot] [git commit] package/cpio: remove useless comment
Message-ID: <20150808095147.190377F963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f70c58c2c7fba4d700dae3dd8da07e7449d6d03c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This comment is about host-cpio which hasn't
been added in Buildroot.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cpio/cpio.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index e18af81..c29305e 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -16,8 +16,7 @@ CPIO_PATCH = \
 	https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-arch/cpio/files/cpio-2.11-stat.patch
 
 # cpio uses argp.h which is not provided by uclibc or musl by default.
-# Use the argp-standalone package to provide this but make sure
-# the host package does not try to use the host version.
+# Use the argp-standalone package to provide this.
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 CPIO_DEPENDENCIES += argp-standalone
 endif
