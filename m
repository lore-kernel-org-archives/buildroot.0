Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A739C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 10:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D86A820C8;
	Sun,  7 May 2023 10:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D86A820C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yET1JXaT3n0I; Sun,  7 May 2023 10:38:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E003083B92;
	Sun,  7 May 2023 10:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E003083B92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 396851BF861
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC23E40273
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC23E40273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVqycKOl5Sf8 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 10:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E83B4015A
 for <buildroot@buildroot.org>; Sun,  7 May 2023 10:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E83B4015A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BB2885EEB; Sun,  7 May 2023 10:37:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 12:28:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8c647c204242e6f2fd6086b4aebaa5bb91043d5
X-Git-Newrev: 171d4f56dcf95c356a20174d925690b4feb24e43
X-Patchwork-Hint: ignore
Message-Id: <20230507103723.6BB2885EEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-audiodecoder-*: mass version
 bump to Nexus
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=171d4f56dcf95c356a20174d925690b4feb24e43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash     | 2 +-
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk       | 2 +-
 package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash   | 2 +-
 package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk     | 2 +-
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash     | 2 +-
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk       | 2 +-
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash     | 2 +-
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk       | 2 +-
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash     | 2 +-
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk       | 2 +-
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash   | 2 +-
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk     | 2 +-
 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash | 2 +-
 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk   | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index e2bfe09928..20f13e95f7 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6e1b1910e799ea8c5ab11428084feb8f6a0a9b1b0d4b5760033545fe765a59e9  kodi-audiodecoder-modplug-19.0.2-Matrix.tar.gz
+sha256  619ba20ea19dd9aea15e7d30aa12a146b412c7fcd9e709528f6758e82a3d85e7  kodi-audiodecoder-modplug-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index f5736e7db7..bbbada01da 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 19.0.2-Matrix
+KODI_AUDIODECODER_MODPLUG_VERSION = 20.2.0-Nexus
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,xbmc,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index 9d1c9a2a76..4012353b0b 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  631b2abded62a34bf66a6769f7b1597a418057f64d79e54322f57090e53e63e7  kodi-audiodecoder-nosefart-19.0.2-Matrix.tar.gz
+sha256  2f7a92bfaddcd5aa63e2ea7348ae9eeefd07dee2aba46840ce5376677e2abc19  kodi-audiodecoder-nosefart-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index fbf327032b..8954da18de 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_NOSEFART_VERSION = 19.0.2-Matrix
+KODI_AUDIODECODER_NOSEFART_VERSION = 20.2.0-Nexus
 KODI_AUDIODECODER_NOSEFART_SITE = $(call github,xbmc,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index 28999afb7b..caf9390eaa 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a4fe4f0c48649222930c8c574156c5c3b2ad82fc97de2bdbd0c5e510402853ec  kodi-audiodecoder-sidplay-19.0.1-Matrix.tar.gz
+sha256  ab1f89237c91bc7157557f42dadcff50a7191eb7285ee668543defce9f1efcf2  kodi-audiodecoder-sidplay-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index 173a2b10ca..c30be0774b 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = 19.0.1-Matrix
+KODI_AUDIODECODER_SIDPLAY_VERSION = 20.2.0-Nexus
 KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,xbmc,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index 1a0227f415..3ed7483fdb 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b7180132472b27e71bf9f30675c0af58330f3ad07d7065492d28f3e97117c341  kodi-audiodecoder-snesapu-19.0.2-Matrix.tar.gz
+sha256  f216a7d25c864986618118236c575687ab62d129a16cb1f73c15860948d9ac92  kodi-audiodecoder-snesapu-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index ff988dffce..577adc0bc3 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = 19.0.2-Matrix
+KODI_AUDIODECODER_SNESAPU_VERSION = 20.2.0-Nexus
 KODI_AUDIODECODER_SNESAPU_SITE = $(call github,xbmc,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index 5f8d4564c8..c4d6a68ef9 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1c740e69047d93d34cfe8c574f923f8dd205adb997fb5d1444a55a6b9d9f0f75  kodi-audiodecoder-stsound-19.0.1-Matrix.tar.gz
+sha256  a8138fb075a480c59d7041a9408eca6e52dc88f188daed519cd9e684b430f333  kodi-audiodecoder-stsound-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index 491be3a7ba..0fa9a654e4 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = 19.0.1-Matrix
+KODI_AUDIODECODER_STSOUND_VERSION = 20.2.0-Nexus
 KODI_AUDIODECODER_STSOUND_SITE = $(call github,xbmc,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index b1131ff43d..d8c1535395 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d9aa6f00315d227a39cb67089c64671987fd9167766f37c28a91168cb8e230e  kodi-audiodecoder-timidity-19.0.2-Matrix.tar.gz
+sha256  ef1b384090df3c2c78d00ed33de1d989ce802702b0a9aa13575946409a5cd0f1  kodi-audiodecoder-timidity-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index d10fd161cb..6ec66fab9b 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = 19.0.2-Matrix
+KODI_AUDIODECODER_TIMIDITY_VERSION = 20.2.0-Nexus
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index 152f1a6eb5..d861b5957e 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0e349225f35ce4bae3026c669b13c696cec2399ec34c0f7726527d19503e14d4  kodi-audiodecoder-vgmstream-19.0.0-Matrix.tar.gz
+sha256  72367d7196f8049ef1fae426d32d3de1eac56bd4cb5a8fc38a6ba0c3da1b23d8  kodi-audiodecoder-vgmstream-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 15cfdcded9..78e7a9f1a2 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_VGMSTREAM_VERSION = 19.0.0-Matrix
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 20.2.0-Nexus
 KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,xbmc,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
