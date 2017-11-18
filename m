From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Nov 2017 11:48:09 +0100
Subject: [Buildroot] [git commit] netcat-openbsd: bump to 1.178-3
Message-ID: <20171201205331.C70C97FBCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f50d30a944b1e39c7f3983fcebbd9e7ae8e587f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netcat-openbsd/netcat-openbsd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index e1a6fee..a758714 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETCAT_OPENBSD_VERSION = debian/1.105-7
+NETCAT_OPENBSD_VERSION = debian/1.178-3
 NETCAT_OPENBSD_SITE = git://anonscm.debian.org/collab-maint/netcat-openbsd
 NETCAT_OPENBSD_LICENSE = BSD-3-Clause
 NETCAT_OPENBSD_LICENSE_FILES = debian/copyright
