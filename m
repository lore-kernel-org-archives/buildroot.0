From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 8 Feb 2018 10:27:47 +0100
Subject: [Buildroot] [PATCH 3/3] package/rauc: Version bump to 0.3
In-Reply-To: <45c17d05433e7bb40ff6e2b30c5cb41fed04ec76.1518089469.git.jan.kundrat@cesnet.cz>
References: <45c17d05433e7bb40ff6e2b30c5cb41fed04ec76.1518089469.git.jan.kundrat@cesnet.cz>
Message-ID: <7bc2ac0c52c4a9bb10d7abd7d321a55ace1eb965.1518089469.git.jan.kundrat@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's a bug in 0.2 which prevents proper operation when activated via
D-Bus, which is why I'm bumping this.

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
Link: https://github.com/rauc/rauc/issues/125
---
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 649d19571e..91d7c1d62e 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v0.2/rauc-0.2.tar.xz.asc
-sha256 83aa3ac3716e1c29315162e3cbf5d4db79f26dd95efe1bc634bbce364b95491a rauc-0.2.tar.xz
+# https://github.com/rauc/rauc/releases/download/v0.3/rauc-0.3.tar.xz.asc
+sha256 dc01bfb08b1830376782f9a51cfec290171519267ab97cc909435da9ac6d6d98 rauc-0.3.tar.xz
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 4909062cf5..63fbc53022 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 0.2
+RAUC_VERSION = 0.3
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.14.3
