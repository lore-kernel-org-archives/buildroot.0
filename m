From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 22:26:05 +0200
Subject: [Buildroot] [PATCH 2/2] package/libcap: bump to 2.27
In-Reply-To: <20191012202605.30113-1-thomas.petazzoni@bootlin.com>
References: <20191012202605.30113-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191012202605.30113-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcap/libcap.hash | 2 +-
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 2d3aee591d..cbef0dc86d 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256	693c8ac51e983ee678205571ef272439d83afe62dd8e424ea14ad9790bc35162  libcap-2.25.tar.xz
+sha256	dac1792d0118bee6aae6ba7fb93ff1602c6a9bda812fd63916eee1435b9c486a  libcap-2.27.tar.xz
 
 # Hash for license file:
 sha256	088cabde4662b4121258d298b0b2967bc1abffa134457ed9bc4a359685ab92bc  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index a947fa0686..4919a4adca 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.25
+LIBCAP_VERSION = 2.27
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.21.0
