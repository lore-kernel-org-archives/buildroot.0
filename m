From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 14:02:16 +0200
Subject: [Buildroot] [git commit] nfs-utils: add license information
Message-ID: <20140507120710.E5C509CB29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e8be4ae93f06561792b9fceee6e08a87b17d2d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license is GPLv2+]
Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nfs-utils/nfs-utils.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 76face5..68772ef 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -7,6 +7,8 @@
 NFS_UTILS_VERSION = 1.2.6
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.bz2
 NFS_UTILS_SITE = http://downloads.sourceforge.net/project/nfs/nfs-utils/$(NFS_UTILS_VERSION)
+NFS_UTILS_LICENSE = GPLv2+
+NFS_UTILS_LICENSE_FILES = COPYING
 NFS_UTILS_AUTORECONF = YES
 NFS_UTILS_DEPENDENCIES = host-pkgconf
 
