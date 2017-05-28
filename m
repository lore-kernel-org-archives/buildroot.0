From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 16:04:38 +0200
Subject: [Buildroot] [git commit branch/next] package/coreutils: bump
	version to 8.27
Message-ID: <20170528140442.D42A3827BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4731bb9d73c40d3e17ef00c876b27770c34b6d54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/coreutils/coreutils.hash | 2 +-
 package/coreutils/coreutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 37d630b..472cab5 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	155e94d748f8e2bc327c66e0cbebdb8d6ab265d2f37c3c928f7bf6c3beba9a8e	coreutils-8.26.tar.xz
+sha256 8891d349ee87b9ff7870f52b6d9312a9db672d2439d289bc57084771ca21656b  coreutils-8.27.tar.xz
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 0769bca..14b952f 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 8.26
+COREUTILS_VERSION = 8.27
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
