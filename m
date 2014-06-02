From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 12:46:39 +0200
Subject: [Buildroot] [git commit] package/libbsd: bump version
Message-ID: <20140602111141.83DE39CE7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e2a7bf2bd6dcd061d8cfa40a5d8995b1b257ef3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... and switch to using .tar.xz as that's all upstream is providing now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbsd/libbsd.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index c1cd59e..d6481b2 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.4.2
+LIBBSD_VERSION = 0.6.0
+LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = http://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-3c MIT
 LIBBSD_LICENSE_FILES = COPYING
