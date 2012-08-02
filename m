From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:51 -0000
Subject: [Buildroot] [git commit branch/next] nfs-utils: needs pkg-config
Message-ID: <20120802195234.E30FA96AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54f88ee8eed9d3ae7ab670d14ba77a97a44caaca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nfs-utils/nfs-utils.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 87c136c..a7c42fb 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -8,6 +8,7 @@ NFS_UTILS_VERSION = 1.2.6
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.bz2
 NFS_UTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/nfs/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_AUTORECONF = YES
+NFS_UTILS_DEPENDENCIES = host-pkg-config
 
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
