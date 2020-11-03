From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  3 Nov 2020 22:32:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/alsa-utils: bump version to 1.2.4
In-Reply-To: <20201103213221.727208-1-bernd.kuhls@t-online.de>
References: <20201103213221.727208-1-bernd.kuhls@t-online.de>
Message-ID: <20201103213221.727208-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://www.alsa-project.org/wiki/Changes_v1.2.3.2_v1.2.4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index aec86aee00..dda009c1af 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ff19ae48c22938de7a491bdb39db74a2eee2546013f39bf1a86185e426f921aa  alsa-utils-1.2.3.tar.bz2
+sha256  98ffc2d599de0577d423a48fa5f20a992ca0b82d812ed1f2e58ade49ac6da426  alsa-utils-1.2.4.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 4776a17454..d9f0fea7b4 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.3
+ALSA_UTILS_VERSION = 1.2.4
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
-- 
2.27.0
