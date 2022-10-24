Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DEFC38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E746840357;
	Mon, 24 Oct 2022 21:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E746840357
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id STTrkb6FQWrP; Mon, 24 Oct 2022 21:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 923B44031E;
	Mon, 24 Oct 2022 21:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 923B44031E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3085B1BF30C
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B40040334
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B40040334
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_b8EEKAlQlG for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2A7C402DD
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2A7C402DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B013987048; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 23:27:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54a8261e6f0f80fe8eaa3ad48e0f3936015466e1
X-Git-Newrev: 6fa63bce3f95105220474c1bc6b940e8f2340546
X-Patchwork-Hint: ignore
Message-Id: <20221024214302.B013987048@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpng: bump to version 1.6.38
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fa63bce3f95105220474c1bc6b940e8f2340546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 1.6.38 [September 14, 2022]
  Added configurations and scripts for continuous integration.
  Fixed various errors in the handling of tRNS, hIST and eXIf.
  Implemented many stability improvements across all platforms.
  Updated the internal documentation.

Update hash of LICENSE file (update in year with
https://sourceforge.net/p/libpng/code/ci/723b2d9f2e2bb65c605274ee052f9773e594a5aa)

https://sourceforge.net/p/libpng/code/ci/v1.6.38/tree/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpng/libpng.hash | 10 +++++-----
 package/libpng/libpng.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index b57b1251a0..34b0a8a8b6 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.37/
-md5  015e8e15db1eecde5f2eb9eb5b6e59e9  libpng-1.6.37.tar.xz
-sha1  3ab93fabbf4c27e1c4724371df408d9a1bd3f656  libpng-1.6.37.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.38/
+md5  122e6b7837811698563083b352bc8ca2  libpng-1.6.38.tar.xz
+sha1  60960ed110094843e5efa221df6a7d21614a4dba  libpng-1.6.38.tar.xz
 # Locally computed:
-sha256  505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca  libpng-1.6.37.tar.xz
-sha256  bf5e22b9dce8464064ae17a48ea1133c3369ac9e1d80ef9e320e5219aa14ea9b  LICENSE
+sha256  b3683e8b8111ebf6f1ac004ebb6b0c975cd310ec469d98364388e9cedbfa68be  libpng-1.6.38.tar.xz
+sha256  dfe5a536b0e5a531f844fb9c101a3089aca60772a503893b8e15f9457e369960  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index e4e629bbb5..43b4f373f1 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.37
+LIBPNG_VERSION = 1.6.38
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
