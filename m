From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 22:47:20 +0100
Subject: [Buildroot] [git commit] autofs: update to 5.1.4
Message-ID: <20180131214757.0E9B7881C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=772cac0f4695eb0d0a3cc06ee4f6279c6ddac139
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/autofs/autofs.hash | 2 +-
 package/autofs/autofs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/autofs/autofs.hash b/package/autofs/autofs.hash
index 61e58825cc..1f2060bdef 100644
--- a/package/autofs/autofs.hash
+++ b/package/autofs/autofs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/daemons/autofs/v5/sha256sums.asc
-sha256 e96eebfe3ed5fb1a30f4510f538198affde223e370c6dc2bed9780309272b1bf  autofs-5.1.3.tar.xz
+sha256 8fce30ee51ffd528fe1a4e8374ef57f43367e1f123030e175fb1b1cf15bc1722  autofs-5.1.4.tar.xz
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 148ab1bd3d..90cc38de55 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOFS_VERSION = 5.1.3
+AUTOFS_VERSION = 5.1.4
 AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPL-2.0+
