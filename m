From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 14:41:54 +0200
Subject: [Buildroot] [git commit branch/next] sudo: bump version to 1.8.5p2
Message-ID: <20120804124502.D644D96FFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d30aaf3e0c5f90306a1c931794d9096d549405cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...t-commit-8209:0c4e3f68b2f5-from-upstream.patch} |    0
 package/sudo/sudo.mk                               |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sudo/sudo-1.8.5p1-backport-commit-8209:0c4e3f68b2f5-from-upstream.patch b/package/sudo/sudo-1.8.5p2-backport-commit-8209:0c4e3f68b2f5-from-upstream.patch
similarity index 100%
rename from package/sudo/sudo-1.8.5p1-backport-commit-8209:0c4e3f68b2f5-from-upstream.patch
rename to package/sudo/sudo-1.8.5p2-backport-commit-8209:0c4e3f68b2f5-from-upstream.patch
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 9b0ebed..00d08f0 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SUDO_VERSION = 1.8.5p1
+SUDO_VERSION = 1.8.5p2
 SUDO_SITE    = http://www.sudo.ws/sudo/dist
 SUDO_CONF_OPT = \
 		--without-lecture \
