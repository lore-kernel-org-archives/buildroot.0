Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261EAC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 17:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBA6840533;
	Thu,  9 May 2024 17:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32zHr2kM1hHk; Thu,  9 May 2024 17:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2235741EED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2235741EED;
	Thu,  9 May 2024 17:24:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E2801BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA19860608
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYeFhz3Wcefh for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 17:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDBC26058F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDBC26058F
 for <buildroot@buildroot.org>; Thu,  9 May 2024 17:23:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD74D86CB6; Thu,  9 May 2024 17:23:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 19:02:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c61934611111cb3ea04604707052b1387bde5134
X-Git-Newrev: 6270e4b7916eb9e5fe1effb5fd3c0af06c9fc3bd
X-Patchwork-Hint: ignore
Message-Id: <20240509172344.AD74D86CB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-audiodecoder-*: mass version
 bump to Omega
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6270e4b7916eb9e5fe1effb5fd3c0af06c9fc3bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch from kodi-audiodecoder-timidity which is included in
upstream release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../kodi-audiodecoder-modplug.hash                 |  2 +-
 .../kodi-audiodecoder-modplug.mk                   |  2 +-
 .../kodi-audiodecoder-nosefart.hash                |  2 +-
 .../kodi-audiodecoder-nosefart.mk                  |  2 +-
 .../kodi-audiodecoder-sidplay.hash                 |  2 +-
 .../kodi-audiodecoder-sidplay.mk                   |  2 +-
 .../kodi-audiodecoder-snesapu.hash                 |  2 +-
 .../kodi-audiodecoder-snesapu.mk                   |  2 +-
 .../kodi-audiodecoder-stsound.hash                 |  2 +-
 .../kodi-audiodecoder-stsound.mk                   |  2 +-
 .../0001-MidiScan-include-missing-cstdint.patch    | 29 ----------------------
 .../kodi-audiodecoder-timidity.hash                |  2 +-
 .../kodi-audiodecoder-timidity.mk                  |  2 +-
 .../kodi-audiodecoder-vgmstream.hash               |  2 +-
 .../kodi-audiodecoder-vgmstream.mk                 |  2 +-
 15 files changed, 14 insertions(+), 43 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index 20f13e95f7..054e7581cc 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  619ba20ea19dd9aea15e7d30aa12a146b412c7fcd9e709528f6758e82a3d85e7  kodi-audiodecoder-modplug-20.2.0-Nexus.tar.gz
+sha256  7c637f4e012e7e26a3431244a8444331f9bfeaf9c6af73cac799b58b9a0eefdf  kodi-audiodecoder-modplug-e697156054ea3eb5974fb9727e046287220985e5.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index bbbada01da..e435591cbf 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 20.2.0-Nexus
+KODI_AUDIODECODER_MODPLUG_VERSION = e697156054ea3eb5974fb9727e046287220985e5
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,xbmc,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index 4012353b0b..b2e3a36a0d 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2f7a92bfaddcd5aa63e2ea7348ae9eeefd07dee2aba46840ce5376677e2abc19  kodi-audiodecoder-nosefart-20.2.0-Nexus.tar.gz
+sha256  fd0d12af9d3d59fbcf41e67d1f8ac9e1339c702219da4a3393688e89ff911ebb  kodi-audiodecoder-nosefart-92c6daeb278b02cd63fee724c96051421c9149f3.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index 8954da18de..7425447115 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_NOSEFART_VERSION = 20.2.0-Nexus
+KODI_AUDIODECODER_NOSEFART_VERSION = 92c6daeb278b02cd63fee724c96051421c9149f3
 KODI_AUDIODECODER_NOSEFART_SITE = $(call github,xbmc,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index caf9390eaa..1f0da25fc3 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ab1f89237c91bc7157557f42dadcff50a7191eb7285ee668543defce9f1efcf2  kodi-audiodecoder-sidplay-20.2.0-Nexus.tar.gz
+sha256  63090c74af51db7a859f8a2aa317ea2c4f2125be3306190502efc5522f00ec93  kodi-audiodecoder-sidplay-0ba1bc70faced93352cdd9ec1a5ec84e22a2e0f5.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index c30be0774b..a08901328f 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = 20.2.0-Nexus
+KODI_AUDIODECODER_SIDPLAY_VERSION = 0ba1bc70faced93352cdd9ec1a5ec84e22a2e0f5
 KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,xbmc,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index 3ed7483fdb..db8b33cb4b 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f216a7d25c864986618118236c575687ab62d129a16cb1f73c15860948d9ac92  kodi-audiodecoder-snesapu-20.2.0-Nexus.tar.gz
+sha256  4932d6d00c3b8662bc6e1600757bd85856c79028c5ecb920fa0d257bab30b7a2  kodi-audiodecoder-snesapu-532186702c49ba7fe007badc74fa6a6e9cac48fe.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index 577adc0bc3..5b6cafcc0f 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = 20.2.0-Nexus
+KODI_AUDIODECODER_SNESAPU_VERSION = 532186702c49ba7fe007badc74fa6a6e9cac48fe
 KODI_AUDIODECODER_SNESAPU_SITE = $(call github,xbmc,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index c4d6a68ef9..daa3f537fd 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a8138fb075a480c59d7041a9408eca6e52dc88f188daed519cd9e684b430f333  kodi-audiodecoder-stsound-20.2.0-Nexus.tar.gz
+sha256  bf292e364bd9bbc0286fb49815cd4c2f86e5952d9bd1c878f6d1952d081d87de  kodi-audiodecoder-stsound-b72c793e2ada7ab2358568ec5b01fd71ddf7cdb3.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index 0fa9a654e4..36535cde60 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = 20.2.0-Nexus
+KODI_AUDIODECODER_STSOUND_VERSION = b72c793e2ada7ab2358568ec5b01fd71ddf7cdb3
 KODI_AUDIODECODER_STSOUND_SITE = $(call github,xbmc,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/0001-MidiScan-include-missing-cstdint.patch b/package/kodi-audiodecoder-timidity/0001-MidiScan-include-missing-cstdint.patch
deleted file mode 100644
index a0fb586e44..0000000000
--- a/package/kodi-audiodecoder-timidity/0001-MidiScan-include-missing-cstdint.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0d4d3fcf5c58dd16b3e9a7337189141b839e4ace Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sat, 15 Apr 2023 07:41:15 +1000
-Subject: [PATCH] MidiScan: include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
-included [1]. Explicitly include it for uint{32,64}_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Upstream: https://github.com/xbmc/audiodecoder.timidity/commit/0d4d3fcf5c58dd16b3e9a7337189141b839e4ace
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/MidiScan.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/MidiScan.h b/src/MidiScan.h
-index 9c19bdf..ac959e0 100644
---- a/src/MidiScan.h
-+++ b/src/MidiScan.h
-@@ -8,6 +8,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index d8c1535395..8714ebbdac 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ef1b384090df3c2c78d00ed33de1d989ce802702b0a9aa13575946409a5cd0f1  kodi-audiodecoder-timidity-20.2.0-Nexus.tar.gz
+sha256  6f8e72ab3c63db04fd863893bbc5afe2c8cfcc7a71d86b68ed5bfe26ea5bf066  kodi-audiodecoder-timidity-00bee97ded3bc824dc454104bd53d0f431404571.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index 6ec66fab9b..bef0d67214 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = 20.2.0-Nexus
+KODI_AUDIODECODER_TIMIDITY_VERSION = 00bee97ded3bc824dc454104bd53d0f431404571
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index d861b5957e..a39c49bbb2 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  72367d7196f8049ef1fae426d32d3de1eac56bd4cb5a8fc38a6ba0c3da1b23d8  kodi-audiodecoder-vgmstream-20.2.0-Nexus.tar.gz
+sha256  c198151522b082feef1855e8a94d45ee498388c6764d58b92af9de20c72896c0  kodi-audiodecoder-vgmstream-56bedfc90ca600401e6dda407a5b933da0976664.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 78e7a9f1a2..62d956892b 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_VGMSTREAM_VERSION = 20.2.0-Nexus
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 56bedfc90ca600401e6dda407a5b933da0976664
 KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,xbmc,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
