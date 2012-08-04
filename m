From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 13:14:36 +0200
Subject: [Buildroot] [git commit] expat: Add license info
Message-ID: <20120804112012.6777397015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=180c091a83e569d23d1ab2525ac5ef7ea9b5ee90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/expat/expat.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 663abcd..7fa3126 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -10,6 +10,8 @@ EXPAT_INSTALL_STAGING = YES
 EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
 EXPAT_DEPENDENCIES = host-pkg-config
+EXPAT_LICENSE = MIT
+EXPAT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
