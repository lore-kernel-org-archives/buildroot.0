From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 8 Feb 2018 10:27:36 +0100
Subject: [Buildroot] [PATCH 2/3] package/libgpiod: Bump to stable 1.0
In-Reply-To: <45c17d05433e7bb40ff6e2b30c5cb41fed04ec76.1518089469.git.jan.kundrat@cesnet.cz>
References: <45c17d05433e7bb40ff6e2b30c5cb41fed04ec76.1518089469.git.jan.kundrat@cesnet.cz>
Message-ID: <e5dd92052698b756ed2e956aa246ea22276c97b5.1518089469.git.jan.kundrat@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to upstream, this one has non-backward-compatible API changes,
so porting of end users' code will be required. On the other hand, the
library also got a stable API now.

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 73150dc9b9..a98e138fa4 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 50c7862428ca90b58672e2475aea66d33a6fc86c6bab1928c0660f3aedf44a37  libgpiod-0.3.2.tar.xz
+sha256 34c76b3730b9d4a1159bcb14000f78b1e890251b8a3823b794fa930654eabdd0  libgpiod-1.0.tar.xz
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index bc2e51d280..598adcc599 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = 0.3.2
+LIBGPIOD_VERSION = 1.0
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.14.3
