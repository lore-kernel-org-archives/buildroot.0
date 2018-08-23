From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 21:14:49 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] package/cryptsetup: bump
 version to 2.0.3
Message-ID: <20180823190734.CB2E48E367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0db7121aac821721d9f07b4e28e1b05c9d500b06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dffbda38534199f8bd21c178328591ea7701e45c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 7629691a66..1573d53080 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.0/sha256sums.asc
-sha256 4f8105d7f3bf758d58da3058b3cbd66c0ca81492b2dafe8ae7c049cc9e939e97  cryptsetup-2.0.2.tar.xz
+sha256 4d6cca04c1f5ff4a68d045d190efb2623087eda0274ded92f92a4b6911e501d4  cryptsetup-2.0.3.tar.xz
 sha256 45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256 8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 39c9b7b0bc..d5ab022b77 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.0
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf json-c \
