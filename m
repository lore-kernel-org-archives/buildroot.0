From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 21:42:12 +0100
Subject: [Buildroot] [git commit] cryptsetup: bump version to 1.7.4
Message-ID: <20170315205804.8FDD57FAF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa52abc0367fa07dcf6f4d690280808ff1cbefd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index b8c0d2b..f328bc3 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/sha256sums.asc
-sha256 af2b04e8475cf40b8d9ffd97a1acfa73aa787c890430afd89804fb544d6adc02  cryptsetup-1.7.3.tar.xz
+sha256 7ccf893ef79a38fb92d61f03c17b964982119f5319cdaa85a1335b8558cca016  cryptsetup-1.7.4.tar.xz
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 6081009..8337bed 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 1.7
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
