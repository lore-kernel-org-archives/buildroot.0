From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Mar 2015 23:46:52 +0100
Subject: [Buildroot] [git commit] kmod: bump version to 20
Message-ID: <20150302224950.8D9AD7FA36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca079a1fc2e75ddd1b7c8b3e7f7284aaf7cb7b49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 20
- Update the hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kmod/kmod.hash |    2 +-
 package/kmod/kmod.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index 28f1ca1..cf7e802 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  3e7fee6eeff5435848b2dcc852bc8959066478d687d232284d67300c071e7b14  kmod-19.tar.xz
+sha256  89c1a1a2193c31f9ebe582640bfa2bd401341dc24119f5a7f702588116fadaa0  kmod-20.tar.xz
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index ff07c78..1ac83ea 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 19
+KMOD_VERSION = 20
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
