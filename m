From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 19:12:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: bump version to 3.0.5
Message-ID: <20190929171217.13111-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added upstream sha1 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/wireshark/wireshark.hash | 5 +++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 8a94830fcb..403def6460 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,5 +1,6 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.0.3.txt
-sha256 af92729c781d870110885c31ebcbe4c4224ed51bb580d00c896fe9746994211c wireshark-3.0.3.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.0.5.txt
+sha1 82883e96ee247d3fcacb0cafa0bed9112824ee3a wireshark-3.0.5.tar.xz
+sha256 c551fce475c49cea317ccbf9d22404bc827dde9cee0ccdf6648bfed3ecd9f820 wireshark-3.0.5.tar.xz
 
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 0abd55f49e..1be6a4e81c 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.0.3
+WIRESHARK_VERSION = 3.0.5
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.20.1
