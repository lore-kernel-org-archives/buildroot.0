From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Feb 2020 09:39:02 +0100
Subject: [Buildroot] [git commit] package.nfs-utils: drop extra empty line
Message-ID: <20200217082743.895C7821F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7868fa78d80bf634aff4b0a8d3003616349c1be2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 12c0f68caf (package/nfs-utils: bump version to 2.4.3) added an
extra empty line, causing check-package to whine:

    package/nfs-utils/nfs-utils.mk:27: consecutive empty lines

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nfs-utils/nfs-utils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 4740435925..7af229a57e 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -24,7 +24,6 @@ NFS_UTILS_CONF_OPTS = \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
 
-
 HOST_NFS_UTILS_CONF_OPTS = \
 	--disable-nfsv4 \
 	--disable-nfsv41 \
