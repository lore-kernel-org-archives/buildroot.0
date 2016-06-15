From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 15:29:18 +0200
Subject: [Buildroot] [git commit] autofs: bump to version 5.1.2
Message-ID: <20160615132944.739F08182E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fa3a819c8a9b8f9fdd4cd3aeeec6f96a79c867d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/autofs/autofs.hash | 2 +-
 package/autofs/autofs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/autofs/autofs.hash b/package/autofs/autofs.hash
index 2d98375..72b1378 100644
--- a/package/autofs/autofs.hash
+++ b/package/autofs/autofs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/daemons/autofs/v5/sha256sums.asc
-sha256 e08ff0ef9ff365d87b6c33dca136d20e4e07675197a324f2816894cb437021c3  autofs-5.1.1.tar.xz
+sha256 88b7de39088aead983e02072a7b753d5ee52ce419c8913f7a3d4ff5521313f0c  autofs-5.1.2.tar.xz
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index a98e5eb..622bbe0 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOFS_VERSION = 5.1.1
+AUTOFS_VERSION = 5.1.2
 AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPLv2+
