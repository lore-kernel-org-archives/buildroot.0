Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E46C77B75
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 16:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 279E961549;
	Wed,  3 May 2023 16:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 279E961549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dc9gd3ZelVDq; Wed,  3 May 2023 16:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B02E461568;
	Wed,  3 May 2023 16:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B02E461568
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A35131BF861
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 16:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A04040865
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 16:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A04040865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WeHufwszWur5 for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 16:45:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39F1D4055D
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39F1D4055D
 for <buildroot@buildroot.org>; Wed,  3 May 2023 16:45:05 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout12.t-online.de (Postfix) with SMTP id AEA57A168
 for <buildroot@buildroot.org>; Wed,  3 May 2023 18:45:02 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.11.39]) by fwd83.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1puFbB-0FT8aX0; Wed, 3 May 2023 18:45:01 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:51960)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1puFbA-0002ho-1d
 for buildroot@buildroot.org; Wed, 03 May 2023 18:45:00 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 18:44:56 +0200
Message-Id: <20230503164458.747478-9-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503164458.747478-1-bernd.kuhls@t-online.de>
References: <20230503164458.747478-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683132301-18BB8C11-E47A5085/0/0 CLEAN NORMAL
X-TOI-MSGID: 49fb5245-b267-4d80-9cc3-736fae605023
Subject: [Buildroot] [PATCH 09/11] package/kodi-screensaver-*: mass version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash  | 2 +-
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk    | 2 +-
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash  | 2 +-
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk    | 2 +-
 .../kodi-screensaver-biogenesis.hash                            | 2 +-
 .../kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk  | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash  | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk    | 2 +-
 .../kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash  | 2 +-
 .../kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk    | 2 +-
 .../kodi-screensaver-matrixtrails.hash                          | 2 +-
 .../kodi-screensaver-matrixtrails.mk                            | 2 +-
 .../kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash    | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk  | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash        | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk          | 2 +-
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash        | 2 +-
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk          | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash      | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk        | 2 +-
 20 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index 0f1d77e814..3f1163fe1b 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  189b4f45ac2c0920445db0240f080203041c77053430595e764d773fdcd8604a  kodi-screensaver-asteroids-19.0.1-Matrix.tar.gz
+sha256  492d826efa7a252ce62a1bebf075fe9b0c0cf452929f4cd6f228003f6e445b82  kodi-screensaver-asteroids-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index 0c660e9556..d91779610b 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = 19.0.1-Matrix
+KODI_SCREENSAVER_ASTEROIDS_VERSION = 20.2.0-Nexus
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,xbmc,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index 95c37a8e69..79815b3cba 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e1d97cf5628dd844745d152a2b3633a22c720c35ef0e81aa61857f47a78003aa  kodi-screensaver-asterwave-19.0.1-Matrix.tar.gz
+sha256  2c07219218fad17ef285577ff8309f7b6503302e52048d12ee20459dbcedf89c  kodi-screensaver-asterwave-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 2ae243eba0..c721f21cc0 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 19.0.1-Matrix
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 20.2.0-Nexus
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index 314c067878..5426cb3f6c 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ef90c940f70ae9ffb4e5b6928993f053c24de2180566a5fdb21eea359a6c61df  kodi-screensaver-biogenesis-19.0.1-Matrix.tar.gz
+sha256  dfc291fbafe16444f3a5a5f886ba562b5d7b16ed77f4302017fbbe5f5ef9a82d  kodi-screensaver-biogenesis-20.1.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index 70e4cdc0bd..f25ad9c666 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 19.0.1-Matrix
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 20.1.0-Nexus
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,xbmc,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index 80dfbad357..6ca36c0d32 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f281efde421cfe9d5f251520853e43e8b1ee128de216af760fcafb80861f504b  kodi-screensaver-cpblobs-19.0.1-Matrix.tar.gz
+sha256  0e398a30aac0e6316778d7bb93256b9a3758ac11bc42388ac4367417bf82ea55  kodi-screensaver-cpblobs-20.1.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index 9ca6718c92..49b510f229 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = 19.0.1-Matrix
+KODI_SCREENSAVER_CPBLOBS_VERSION = 20.1.0-Nexus
 KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,xbmc,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index 2268b2e52c..27b5a0f712 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5428bc2bf17132dbc98ef0f9df0c98ab5abcbe4bf6e9040460cbf5be58ea3058  kodi-screensaver-greynetic-19.0.1-Matrix.tar.gz
+sha256  e060f69a7c403a5d7bb59058dc38e8c6a6ea1aa7bc9b82f8ffa7c5e94ede0866  kodi-screensaver-greynetic-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index 3e91cfb03a..4c3f358894 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 19.0.1-Matrix
+KODI_SCREENSAVER_GREYNETIC_VERSION = 20.2.0-Nexus
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,xbmc,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 2c4de82049..4f0c3f4746 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a7054eedcf7b614f5a9cf584ac1f92225b5b960ff5f8d846372e920319a47d30  kodi-screensaver-matrixtrails-19.0.1-Matrix.tar.gz
+sha256  929af1a5a08399449497a13c2eb9761b4770b41445a13ee61d78b82677978ea5  kodi-screensaver-matrixtrails-20.1.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index 230977bb94..b9a3e8d681 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 19.0.1-Matrix
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 20.1.0-Nexus
 KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index 20e725f07a..39853836fb 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d8d87943bfb795fc66565d06197a6b3a12b2cdc2b60269197ddccf295217b776  kodi-screensaver-pingpong-19.0.1-Matrix.tar.gz
+sha256  72b3c9be5b65afe7fbc6d496eb7700786d88811bfafcd131a3219a646d30805d  kodi-screensaver-pingpong-20.2.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index fffdc82d88..3801515329 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = 19.0.1-Matrix
+KODI_SCREENSAVER_PINGPONG_VERSION = 20.2.0-Nexus
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,xbmc,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index 9b0effef15..aa48d490e5 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6a68904ff6915a7b908126d1336f5ad78e0791680fae14c71d5a187b13ce3730  kodi-screensaver-pyro-19.0.1-Matrix.tar.gz
+sha256  ec981d070cccdfaa9116244e80a63d86c37f67dccd11aacfcc66dcfcbb608ce1  kodi-screensaver-pyro-20.1.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index 3ab7234370..e33c09ab97 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = 19.0.1-Matrix
+KODI_SCREENSAVER_PYRO_VERSION = 20.1.0-Nexus
 KODI_SCREENSAVER_PYRO_SITE = $(call github,xbmc,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index 073a1b2702..c66d3b2cd3 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8bd1012dc2ae10d2c3b7920214616b0bca5278e4e78f8b0e41fa9cf14569273c  kodi-screensaver-rsxs-19.0.2-Matrix.tar.gz
+sha256  e135408812b8c267554e3881a05396d4286c1f47b20416b4e5d88b632367ace7  kodi-screensaver-rsxs-20.1.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index 59ec30b868..adf7451723 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_RSXS_VERSION = 19.0.2-Matrix
+KODI_SCREENSAVER_RSXS_VERSION = 20.1.0-Nexus
 KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index 9cf978bbbc..4641296596 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1c65bd9baa351ba4c5d443205b9e125303e341bd85e99aaf36793f95395372bf  kodi-screensaver-stars-19.0.0-Matrix.tar.gz
+sha256  5ea0d19c3ef94e9603a0e06c78ae01cd6f9227da7b505eaa7d4527ca6018ea03  kodi-screensaver-stars-20.1.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index 06c77331af..a38ad5c7db 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = 19.0.0-Matrix
+KODI_SCREENSAVER_STARS_VERSION = 20.1.0-Nexus
 KODI_SCREENSAVER_STARS_SITE = $(call github,xbmc,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
