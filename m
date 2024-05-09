Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F25C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 17:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C25A41F76;
	Thu,  9 May 2024 17:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ibh1VLWNcFtu; Thu,  9 May 2024 17:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B25941F7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B25941F7F;
	Thu,  9 May 2024 17:24:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 815751BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3237641DAA
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMwU4YytFoE9 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 17:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69E7941DA3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69E7941DA3
 for <buildroot@buildroot.org>; Thu,  9 May 2024 17:23:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6551F86622; Thu,  9 May 2024 17:23:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 19:04:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce0f6dee2acf085047c3d6aa8d6937269faa752d
X-Git-Newrev: 969f5558bee8afd030f08a199d52002ea1eeacbb
X-Patchwork-Hint: ignore
Message-Id: <20240509172345.6551F86622@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-visualisation-*: mass version
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

commit: https://git.buildroot.net/buildroot/commit/?id=969f5558bee8afd030f08a199d52002ea1eeacbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash     | 2 +-
 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk       | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash           | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk             | 2 +-
 package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash       | 2 +-
 package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk         | 2 +-
 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash | 2 +-
 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk   | 2 +-
 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash   | 2 +-
 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk     | 2 +-
 package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash | 2 +-
 package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk   | 2 +-
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash   | 2 +-
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk     | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
index 5edb2b9ac2..42d6cab712 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  168788d7cd292edf9c13c0e0e0148f19b2ecd35edd8f65f24240dff99f01677a  kodi-visualisation-fishbmc-20.2.0-Nexus.tar.gz
+sha256  a21d1683cf648b188a39fd32b123c147ce7dad99fa1a67078652b28365ce6666  kodi-visualisation-fishbmc-daa4e6b3e952075b813768e3518ac6e6b0724f55.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index 58087d4f0d..2e27ed69a8 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = 20.2.0-Nexus
+KODI_VISUALISATION_FISHBMC_VERSION = daa4e6b3e952075b813768e3518ac6e6b0724f55
 KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index cc82b1f59a..835fcf5685 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  75102a8c3f066a889493b77fbe26070be78c6dff8e7d44ebda89295ddb2da3b0  kodi-visualisation-goom-20.1.1-Nexus.tar.gz
+sha256  dcf46760c0b1e6eb90fff94684c907ca10261febae12c63d1253325452704ecc  kodi-visualisation-goom-a8cb12592900fcd099d65d7760cbb113489ec884.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index b7b048f165..0f40b2ab23 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 20.1.1-Nexus
+KODI_VISUALISATION_GOOM_VERSION = a8cb12592900fcd099d65d7760cbb113489ec884
 KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
index abc97a892f..ed3ee016cd 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f0b76edf45df7161d8525fa2ba623dee64ca66d515342e942100dc46c8220553  kodi-visualisation-matrix-20.2.0-Nexus.tar.gz
+sha256  2abe39666e64bb1b3e8d3b88876524ed022d2dbeeb141cb9bd43549d8b5b403c  kodi-visualisation-matrix-8a373e240e47f27f1289c1c606621403794eb0d1.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
index 8cd5ea2045..125aee1d46 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_MATRIX_VERSION = 20.2.0-Nexus
+KODI_VISUALISATION_MATRIX_VERSION = 8a373e240e47f27f1289c1c606621403794eb0d1
 KODI_VISUALISATION_MATRIX_SITE = $(call github,xbmc,visualization.matrix,$(KODI_VISUALISATION_MATRIX_VERSION))
 KODI_VISUALISATION_MATRIX_LICENSE = GPL-2.0+
 KODI_VISUALISATION_MATRIX_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index c38931f2dd..b74b0a76f6 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2f97a34f74ee3e3e1d9fe8cfd37796564f8f88eb4c07d60b27ff635d64a5a724  kodi-visualisation-shadertoy-20.3.0-Nexus.tar.gz
+sha256  6144e32ee4c1f7e75be6b2827555b4999d251ebdd67d785cac0e8b38869ef529  kodi-visualisation-shadertoy-364132b12b6da78e281b6a1d678155d43aace83f.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index a056c3481d..45313a3e92 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 20.3.0-Nexus
+KODI_VISUALISATION_SHADERTOY_VERSION = 364132b12b6da78e281b6a1d678155d43aace83f
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index 4b8a1f7e71..a6083e55c5 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1c405ea9b6f43ba5f24df13ebce12cb428369279336deb97790917aa675c809f  kodi-visualisation-spectrum-20.2.0-Nexus.tar.gz
+sha256  ae794542e8c7de00528bf486d381134f4da8b7c35903c5f5e06a1a6015878b12  kodi-visualisation-spectrum-8f2fc2135b34740af538ade3faf310f1a188db7f.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 67d02ab38a..c50eae3fae 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 20.2.0-Nexus
+KODI_VISUALISATION_SPECTRUM_VERSION = 8f2fc2135b34740af538ade3faf310f1a188db7f
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
index 3e1669f776..870c5088b0 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0d63b38ba8d5b3bac542546b1ecfb7d722b79652da485d75b22086e26ef4f825  kodi-visualisation-starburst-20.2.0-Nexus.tar.gz
+sha256  3755544db4d633c411236ca2149f93c641c4c8d858a68f9eb4176b046fbf0ea4  kodi-visualisation-starburst-7923772cd986849531bdfee0a0bc989842b41996.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
index 3e876797b6..bd61e4c770 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_STARBURST_VERSION = 20.2.0-Nexus
+KODI_VISUALISATION_STARBURST_VERSION = 7923772cd986849531bdfee0a0bc989842b41996
 KODI_VISUALISATION_STARBURST_SITE = $(call github,xbmc,visualization.starburst,$(KODI_VISUALISATION_STARBURST_VERSION))
 KODI_VISUALISATION_STARBURST_LICENSE = GPL-2.0+
 KODI_VISUALISATION_STARBURST_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index fe9d164234..29bb077261 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  865e72a5f2ed8fd53469518280cbe26f9516467d091009fe5e012ea0d85d5edd  kodi-visualisation-waveform-20.2.1-Nexus.tar.gz
+sha256  edda37479bc38eb129a9e83c30f14f21646b17693b5679130fd644787b63dce0  kodi-visualisation-waveform-a388be3b9c4a62a5087616d3c92a26d6cbbeb24f.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 92e46b8997..925d76cbe4 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = 20.2.1-Nexus
+KODI_VISUALISATION_WAVEFORM_VERSION = a388be3b9c4a62a5087616d3c92a26d6cbbeb24f
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
