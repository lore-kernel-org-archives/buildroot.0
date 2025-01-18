Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D59C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 381148569D;
	Fri, 28 Feb 2025 17:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IxyrJ1qzlGJ; Fri, 28 Feb 2025 17:03:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3E208514C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3E208514C;
	Fri, 28 Feb 2025 17:03:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A07368
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F36249B7A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkfbeH6XnmxW for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B58F42521
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B58F42521
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66E6782581; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 22:13:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c4af7f1db519903c3ff2ac275170457e061bed29
X-Git-Newrev: 41013bb615b9eb1e20874bbe6e2b47ed2fac062d
X-Patchwork-Hint: ignore
Message-Id: <20250228163015.66E6782581@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi-screensaver-*:
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

commit: https://git.buildroot.net/buildroot/commit/?id=41013bb615b9eb1e20874bbe6e2b47ed2fac062d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash      | 2 +-
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk        | 2 +-
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash      | 2 +-
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk        | 2 +-
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash    | 2 +-
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk      | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash          | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk            | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash      | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk        | 2 +-
 .../kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash    | 2 +-
 package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk  | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash        | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk          | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash                | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk                  | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash              | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk                | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index 21e1617412..0210157d2a 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  41c20f2fec17b60a3baa98edff80ba01053a80ada0ffd056459c2f4ae6588867  kodi-screensaver-asteroids-9cdcb84a4464fee5ae4b6ab3b300e6a3824ec084.tar.gz
+sha256  468527220845a411af4dd021a907c6449327015fb848e61adfb46b47edde331a  kodi-screensaver-asteroids-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index 53c71f73d2..878ab22c3b 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = 9cdcb84a4464fee5ae4b6ab3b300e6a3824ec084
+KODI_SCREENSAVER_ASTEROIDS_VERSION = 21.0.2-Omega
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,xbmc,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index 2825a7be83..c63d3be3e8 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4cb21eed4a679bbebcc0ed4c4ec3f510f4a9319327eba8d896dd8944bb5ff0f8  kodi-screensaver-asterwave-701111a81875688f016ce62b25670608a7fcd2d2.tar.gz
+sha256  de92f8773f23c77f388201d316273f1a06103965bdb9684cbda19a73180c1488  kodi-screensaver-asterwave-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index d2fffab74d..90507bf8b0 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 701111a81875688f016ce62b25670608a7fcd2d2
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 21.0.2-Omega
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index a62070430d..865f31b201 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  92491cbcb1abaa8ab2cf113a0eb4d0ad588f59c062c91e8e06b035c6eb0ea84f  kodi-screensaver-biogenesis-953947d07fdf69967e2dc64b289631c57c79e800.tar.gz
+sha256  fdd5a5abf98318e01e22c88f81ae3838b2f3b76f99b39e01fc94af528a200849  kodi-screensaver-biogenesis-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index bb40c7eb65..4455caedda 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 953947d07fdf69967e2dc64b289631c57c79e800
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 21.0.2-Omega
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,xbmc,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index 0d653a272c..bb6918a03b 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  84213263bad9d5dbaadc704b28d79f4bd2603287f05f0264563cf560f23f5309  kodi-screensaver-cpblobs-cd96c71c22940014d5c79c58af99b60e0b418f71.tar.gz
+sha256  f56b57dfc8535331e36527462bd820e06e287a5a48ffdb33d00bdf1a2dc62b90  kodi-screensaver-cpblobs-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index 9e010ec774..8154bda2e1 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = cd96c71c22940014d5c79c58af99b60e0b418f71
+KODI_SCREENSAVER_CPBLOBS_VERSION = 21.0.2-Omega
 KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,xbmc,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index a1678be4c9..df652f3286 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0974661ce4725e685222cce04b9f43d24b4161f8af9400b6e739549368a0e1eb  kodi-screensaver-greynetic-2955c4105ea1223e9901dbc804812bdb3c0412a7.tar.gz
+sha256  9ed9dba2040268bfd82648856b3e07da5cf51f39909c71c2579475221477e3a6  kodi-screensaver-greynetic-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index 4789cdfcd7..e484305485 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 2955c4105ea1223e9901dbc804812bdb3c0412a7
+KODI_SCREENSAVER_GREYNETIC_VERSION = 21.0.2-Omega
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,xbmc,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 8bc932579f..27bba5d3ba 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6016fc31cdb489417cf3c39d13403d5d8ff332e5b3aef5bf8916e70c61d479c4  kodi-screensaver-matrixtrails-364b7275fb02edf9a5c03bd56c8010431711b249.tar.gz
+sha256  cc342d201606e682fc9def894a308784b74633f981209570c87d1bd206894311  kodi-screensaver-matrixtrails-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index a00bcf85df..ab51a5bc2b 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 364b7275fb02edf9a5c03bd56c8010431711b249
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 21.0.2-Omega
 KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index cd3a0315dd..867ebf865a 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  861a752aa5090817670c378cc4be05e06f27b60f3c9e30503facc28cea45312d  kodi-screensaver-pingpong-a0b8b956002ddc64eb6d433e3230fa09619f2aef.tar.gz
+sha256  4d7c15a0070e4792b4b56726d9a37ab6ca8c569186e0beebd256a57203d5e362  kodi-screensaver-pingpong-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 9b90da2912..5d1854b9a2 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = a0b8b956002ddc64eb6d433e3230fa09619f2aef
+KODI_SCREENSAVER_PINGPONG_VERSION = 21.0.2-Omega
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,xbmc,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index 4a8d00de28..23d1e1b1f3 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bea100644c2e29f645f379cc51f58b5b87b745cf51d2863649a16869d514e60d  kodi-screensaver-pyro-b0d14d3f8cfe7d0c71ce8df8a6b8d6f121b42908.tar.gz
+sha256  4a6b5d7efd789be40226ffe337bac8f64c47335c40085d940d624d42cdaa1be0  kodi-screensaver-pyro-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index b82d2e0f32..72bbf2e913 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = b0d14d3f8cfe7d0c71ce8df8a6b8d6f121b42908
+KODI_SCREENSAVER_PYRO_VERSION = 21.0.2-Omega
 KODI_SCREENSAVER_PYRO_SITE = $(call github,xbmc,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index e4bedbfc3f..6f9ca93d8d 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  84d63373984f83e04bb8990a00a5b57a95ddd595f6a2b5fdf56bbd424cd546c8  kodi-screensaver-stars-e31111555b41692fd373719a9ba74aba3e7f4790.tar.gz
+sha256  86a479a4c6d0b27723a701330b83704f223566eabe7a25302ecf8f0a66e5b27e  kodi-screensaver-stars-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index c9aef4dc79..cff60ae5db 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = e31111555b41692fd373719a9ba74aba3e7f4790
+KODI_SCREENSAVER_STARS_VERSION = 21.0.2-Omega
 KODI_SCREENSAVER_STARS_SITE = $(call github,xbmc,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
