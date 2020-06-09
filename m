From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 10 Jun 2020 00:41:16 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/haveged: bump to version 1.9.9
In-Reply-To: <20200609224116.13607-1-nolange79@gmail.com>
References: <20200609224116.13607-1-nolange79@gmail.com>
Message-ID: <20200609224116.13607-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Format hash file with two spaces delimiters.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
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
-- 
2.26.2
