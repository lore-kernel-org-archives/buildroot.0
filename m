Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA243C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90F4885101;
	Fri, 28 Feb 2025 17:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53PixvNk9QiW; Fri, 28 Feb 2025 17:01:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02588850F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02588850F9;
	Fri, 28 Feb 2025 17:01:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07F6B1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0080D42E30
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdH3G1Byem-W for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C53442585
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C53442585
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 849D6818ED; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 22:13:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5940088ffcb98460659b64a8840150cdf8c1f5ae
X-Git-Newrev: fec8fca48056fa09ba458238d86d1230d82d0327
X-Patchwork-Hint: ignore
Message-Id: <20250228163015.849D6818ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi-visualisation-*:
 mass version bump to 21.0.2-Omega
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=fec8fca48056fa09ba458238d86d1230d82d0327
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
index 42d6cab712..3f5f761968 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a21d1683cf648b188a39fd32b123c147ce7dad99fa1a67078652b28365ce6666  kodi-visualisation-fishbmc-daa4e6b3e952075b813768e3518ac6e6b0724f55.tar.gz
+sha256  d7433e4e88e29f1dd3524d2d0b660ce529852561f14f479f4b83a9c5ac436ffc  kodi-visualisation-fishbmc-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index 2e27ed69a8..b1eb305620 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = daa4e6b3e952075b813768e3518ac6e6b0724f55
+KODI_VISUALISATION_FISHBMC_VERSION = 21.0.2-Omega
 KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index 835fcf5685..71ce1c657e 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dcf46760c0b1e6eb90fff94684c907ca10261febae12c63d1253325452704ecc  kodi-visualisation-goom-a8cb12592900fcd099d65d7760cbb113489ec884.tar.gz
+sha256  f87356122f91ea40d096d559d1180571e701e39867448768d14d6c2ba3b2e264  kodi-visualisation-goom-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 0f40b2ab23..6b35c64a87 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = a8cb12592900fcd099d65d7760cbb113489ec884
+KODI_VISUALISATION_GOOM_VERSION = 21.0.2-Omega
 KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
index ed3ee016cd..a924eaa6f8 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2abe39666e64bb1b3e8d3b88876524ed022d2dbeeb141cb9bd43549d8b5b403c  kodi-visualisation-matrix-8a373e240e47f27f1289c1c606621403794eb0d1.tar.gz
+sha256  b1d1f3da5470d657e70c4b914a77445fe1d0a0ba35007fc402982a8b1b4cf9b0  kodi-visualisation-matrix-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
index 125aee1d46..fd885712ad 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_MATRIX_VERSION = 8a373e240e47f27f1289c1c606621403794eb0d1
+KODI_VISUALISATION_MATRIX_VERSION = 21.0.2-Omega
 KODI_VISUALISATION_MATRIX_SITE = $(call github,xbmc,visualization.matrix,$(KODI_VISUALISATION_MATRIX_VERSION))
 KODI_VISUALISATION_MATRIX_LICENSE = GPL-2.0+
 KODI_VISUALISATION_MATRIX_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index b74b0a76f6..508820876d 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6144e32ee4c1f7e75be6b2827555b4999d251ebdd67d785cac0e8b38869ef529  kodi-visualisation-shadertoy-364132b12b6da78e281b6a1d678155d43aace83f.tar.gz
+sha256  30a5081365cea1dbdf49ccbb059076d4c7abc28604a58749fcd0d025e2faa760  kodi-visualisation-shadertoy-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index 45313a3e92..32d6d6f056 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 364132b12b6da78e281b6a1d678155d43aace83f
+KODI_VISUALISATION_SHADERTOY_VERSION = 21.0.2-Omega
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index a6083e55c5..6bbd7b8c9a 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae794542e8c7de00528bf486d381134f4da8b7c35903c5f5e06a1a6015878b12  kodi-visualisation-spectrum-8f2fc2135b34740af538ade3faf310f1a188db7f.tar.gz
+sha256  7b6635789d226ee4cd4e17d54d57e880731d0762835802835d0d5ac4f0084b99  kodi-visualisation-spectrum-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index c50eae3fae..1946cf598a 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 8f2fc2135b34740af538ade3faf310f1a188db7f
+KODI_VISUALISATION_SPECTRUM_VERSION = 21.0.2-Omega
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
index 870c5088b0..a362fbd23d 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3755544db4d633c411236ca2149f93c641c4c8d858a68f9eb4176b046fbf0ea4  kodi-visualisation-starburst-7923772cd986849531bdfee0a0bc989842b41996.tar.gz
+sha256  a3f70985fee6b1014e7e7599431e646f36bd3870ead78bbc8936151b805e4241  kodi-visualisation-starburst-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
index bd61e4c770..6adb21687e 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_STARBURST_VERSION = 7923772cd986849531bdfee0a0bc989842b41996
+KODI_VISUALISATION_STARBURST_VERSION = 21.0.2-Omega
 KODI_VISUALISATION_STARBURST_SITE = $(call github,xbmc,visualization.starburst,$(KODI_VISUALISATION_STARBURST_VERSION))
 KODI_VISUALISATION_STARBURST_LICENSE = GPL-2.0+
 KODI_VISUALISATION_STARBURST_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 29bb077261..1041fd5287 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  edda37479bc38eb129a9e83c30f14f21646b17693b5679130fd644787b63dce0  kodi-visualisation-waveform-a388be3b9c4a62a5087616d3c92a26d6cbbeb24f.tar.gz
+sha256  fe6d2f3990ea5f2ea2d4a0a905f451b1c2c7f1300529d8957b5d93a97421f415  kodi-visualisation-waveform-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 925d76cbe4..819b064789 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = a388be3b9c4a62a5087616d3c92a26d6cbbeb24f
+KODI_VISUALISATION_WAVEFORM_VERSION = 21.0.2-Omega
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
