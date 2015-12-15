From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:01:51 +0100
Subject: [Buildroot] [git commit] libbsd: comma separate licenses
Message-ID: <20151215210843.A23C180409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c3e4a77cd30cd54842c7a9e7b73e22718cc747c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libbsd/libbsd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index d6481b2..99a9572 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -7,7 +7,7 @@
 LIBBSD_VERSION = 0.6.0
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = http://libbsd.freedesktop.org/releases
-LIBBSD_LICENSE = BSD-3c MIT
+LIBBSD_LICENSE = BSD-3c, MIT
 LIBBSD_LICENSE_FILES = COPYING
 
 LIBBSD_INSTALL_STAGING = YES
