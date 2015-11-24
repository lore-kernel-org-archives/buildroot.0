From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Nov 2015 21:41:46 +0100
Subject: [Buildroot] [git commit] systemd: Bump version
Message-ID: <20151201232121.CB2F57FD28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2fa01e87f2254dfbea4b153d753d973e0c710c9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 60aebcf..8090200 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 6766e8489e359f3d608a9f032eb1f52d7c55d76d0f9171837cf2b3284b2b904b  systemd-227.tar.gz
+sha256 dd124ff561a07e6439ed2b3713f38ca914df7747f110ce86deea17b56d245ae6  systemd-228.tar.gz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 35dac83..e432069 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 227
+SYSTEMD_VERSION = 228
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPLv2.1+, GPLv2+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
