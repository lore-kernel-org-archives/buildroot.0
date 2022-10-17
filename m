Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C24C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 15:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C5CC82A17;
	Mon, 17 Oct 2022 15:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C5CC82A17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTq09CqrCP5N; Mon, 17 Oct 2022 15:07:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3711A81970;
	Mon, 17 Oct 2022 15:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3711A81970
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 365C31BF2A5
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F88D8142E
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F88D8142E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlIPdbmBAmkx for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 15:06:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7993A81493
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 15:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7993A81493
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65A5486E6E; Mon, 17 Oct 2022 15:06:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 17:04:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5af2679ddaaa887aa58eb841d37afcecddb73d3
X-Git-Newrev: 2ebdd163c0d7bbf77bbe61a71a4d0fb13d9d9796
X-Patchwork-Hint: ignore
Message-Id: <20221017150655.65A5486E6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-zattoo: bump version to
 19.7.16-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ebdd163c0d7bbf77bbe61a71a4d0fb13d9d9796
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index a24a7abcd8..c1d3b476b9 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3126ce811e03ac92363a4e399b908336bb54328b7fa0d42c25ac85b2fe5aa7d4  kodi-pvr-zattoo-19.7.15-Matrix.tar.gz
+sha256  ac09db721e51b47f1ca7f4c2201833dbcd69040fd19b09c194fa7491ff4dad41  kodi-pvr-zattoo-19.7.16-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 559dbf884b..49b33916ee 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 19.7.15-Matrix
+KODI_PVR_ZATTOO_VERSION = 19.7.16-Matrix
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
