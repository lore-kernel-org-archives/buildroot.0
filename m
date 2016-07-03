From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:48:05 +0200
Subject: [Buildroot] [git commit] expat: add explicit dependencies for host
	variant
Message-ID: <20160703064824.BF79E80AC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3aa12cc0dadaaeba6d3ed15c85422d96a86973fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/expat/expat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 5c1a444..e7bb74a 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -11,6 +11,7 @@ EXPAT_INSTALL_STAGING = YES
 EXPAT_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) installlib
 EXPAT_DEPENDENCIES = host-pkgconf
+HOST_EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
 EXPAT_LICENSE_FILES = COPYING
 
