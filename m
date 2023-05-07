Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E18C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 10:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7208783BD2;
	Sun,  7 May 2023 10:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7208783BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QvlN0eL9EdE6; Sun,  7 May 2023 10:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17E3B820EF;
	Sun,  7 May 2023 10:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17E3B820EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28CF41BF307
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02D0A6079D
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02D0A6079D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUz5dCAKu9zJ for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 10:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD29B60B99
 for <buildroot@buildroot.org>; Sun,  7 May 2023 10:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD29B60B99
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB19785EEC; Sun,  7 May 2023 10:37:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 12:29:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc6c7401cb57fa38146f765546b78c7814ebcc51
X-Git-Newrev: 7296a0659bcf5383303774aac02797f94bd564fb
X-Patchwork-Hint: ignore
Message-Id: <20230507103723.CB19785EEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-visualisation-*: mass version
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

commit: https://git.buildroot.net/buildroot/commit/?id=7296a0659bcf5383303774aac02797f94bd564fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
index 449b2a4817..5edb2b9ac2 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3023e6cf739985c31ff9a6cd2a217909563b9817de5c1047aab8d9928a00cfd9  kodi-visualisation-fishbmc-19.0.1-Matrix.tar.gz
+sha256  168788d7cd292edf9c13c0e0e0148f19b2ecd35edd8f65f24240dff99f01677a  kodi-visualisation-fishbmc-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index 060e1d9b69..58087d4f0d 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = 19.0.1-Matrix
+KODI_VISUALISATION_FISHBMC_VERSION = 20.2.0-Nexus
 KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index f49fff77de..cc82b1f59a 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1936aaacdf0b3b032e848f8e7b7694111e1c78ce16efdb063263d543d70f003a  kodi-visualisation-goom-19.0.2-Matrix.tar.gz
+sha256  75102a8c3f066a889493b77fbe26070be78c6dff8e7d44ebda89295ddb2da3b0  kodi-visualisation-goom-20.1.1-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 8b258e19c2..b7b048f165 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 19.0.2-Matrix
+KODI_VISUALISATION_GOOM_VERSION = 20.1.1-Nexus
 KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
index 9a5652a2d9..abc97a892f 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aba081aca30b6ff2b349f90ecc3ad9519fa7b8b88d61e08aeba2b66fad2a17a2  kodi-visualisation-matrix-19.0.1-Matrix.tar.gz
+sha256  f0b76edf45df7161d8525fa2ba623dee64ca66d515342e942100dc46c8220553  kodi-visualisation-matrix-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
index f8959facbd..8cd5ea2045 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_MATRIX_VERSION = 19.0.1-Matrix
+KODI_VISUALISATION_MATRIX_VERSION = 20.2.0-Nexus
 KODI_VISUALISATION_MATRIX_SITE = $(call github,xbmc,visualization.matrix,$(KODI_VISUALISATION_MATRIX_VERSION))
 KODI_VISUALISATION_MATRIX_LICENSE = GPL-2.0+
 KODI_VISUALISATION_MATRIX_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index d3f489e4f9..c38931f2dd 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  49ffaf8ee1a95193d7ac4a6280ae7db8d59ca44c9e5554c0b8cd85a768d1d002  kodi-visualisation-shadertoy-19.1.2-Matrix.tar.gz
+sha256  2f97a34f74ee3e3e1d9fe8cfd37796564f8f88eb4c07d60b27ff635d64a5a724  kodi-visualisation-shadertoy-20.3.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index 5c644bb3ee..a056c3481d 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 19.1.2-Matrix
+KODI_VISUALISATION_SHADERTOY_VERSION = 20.3.0-Nexus
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index 1198dd1eab..4b8a1f7e71 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  524a740db973673c0038bcc9f73fbae9af497c6699dd3c34527683f29824a5c9  kodi-visualisation-spectrum-19.0.2-Matrix.tar.gz
+sha256  1c405ea9b6f43ba5f24df13ebce12cb428369279336deb97790917aa675c809f  kodi-visualisation-spectrum-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 0da5f22bae..67d02ab38a 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 19.0.2-Matrix
+KODI_VISUALISATION_SPECTRUM_VERSION = 20.2.0-Nexus
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
index 7f335ed9e2..3e1669f776 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e2b3ad0473d1ae40c3ecc81f9631c7d956fd4ec3edc7ef43eaeefec242fa79e5  kodi-visualisation-starburst-19.0.1-Matrix.tar.gz
+sha256  0d63b38ba8d5b3bac542546b1ecfb7d722b79652da485d75b22086e26ef4f825  kodi-visualisation-starburst-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
index afa1fb1aef..3e876797b6 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_STARBURST_VERSION = 19.0.1-Matrix
+KODI_VISUALISATION_STARBURST_VERSION = 20.2.0-Nexus
 KODI_VISUALISATION_STARBURST_SITE = $(call github,xbmc,visualization.starburst,$(KODI_VISUALISATION_STARBURST_VERSION))
 KODI_VISUALISATION_STARBURST_LICENSE = GPL-2.0+
 KODI_VISUALISATION_STARBURST_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 3265477050..fe9d164234 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a89b7d82afaa3bb279ecf32a2c04e6c7653f536b0df6fee2b7389c15340a01c7  kodi-visualisation-waveform-19.0.3-Matrix.tar.gz
+sha256  865e72a5f2ed8fd53469518280cbe26f9516467d091009fe5e012ea0d85d5edd  kodi-visualisation-waveform-20.2.1-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 9d75f79a87..92e46b8997 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = 19.0.3-Matrix
+KODI_VISUALISATION_WAVEFORM_VERSION = 20.2.1-Nexus
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
