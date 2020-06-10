From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 22:56:56 +0200
Subject: [Buildroot] [git commit] package/haveged: bump to version 1.9.9
Message-ID: <20200610205554.2356C817EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf46f03e8a002751e3c82841ebf936701989cd37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Format hash file with two spaces delimiters.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haveged/haveged.hash | 4 ++--
 package/haveged/haveged.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index 2bb1fdd846..2f1338a6a8 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  99aa1996c6e39ea2459cfc37addfb8b1eecc63f3a2b6da9db17b22e76b6851ae	haveged-1.9.8.tar.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  13a0d81bb395c6ebde70a6474452001d9f898d786ddf4872af9f9f96f9e99ded  haveged-1.9.9.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index cc834304df..40fa1c7c15 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.8
+HAVEGED_VERSION = 1.9.9
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
