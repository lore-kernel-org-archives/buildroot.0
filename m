From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 11:26:56 +0100
Subject: [Buildroot] [git commit] package/opkg: bump version to v0.3.1 to
	fix musl build
Message-ID: <20160201224700.948197F918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42699e397e4ff0a6dd73e74fd3955f9c58a1356e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream included a fix for musl in the current release:
http://git.yoctoproject.org/cgit/cgit.cgi/opkg/commit/?id=f9a2febe724a514a89046c8cd92c2342e4383846

Fixes
http://autobuild.buildroot.net/results/7e0/7e02c7d81bb83fef22554590521b848acd4fc38c/
http://autobuild.buildroot.net/results/4e0/4e01abdc8cace71802e527273b47dcc49c9bd4ce/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opkg/opkg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index bcf3f78..6e4d4ff 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPKG_VERSION = v0.3.0
+OPKG_VERSION = v0.3.1
 OPKG_SITE = http://git.yoctoproject.org/git/opkg
 OPKG_SITE_METHOD = git
 # Uses PKG_CHECK_MODULES() in configure.ac
