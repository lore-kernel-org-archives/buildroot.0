Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57B5C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 15:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CB8040587;
	Sun, 14 Aug 2022 15:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CB8040587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QMmOtjUBTayn; Sun, 14 Aug 2022 15:32:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A3E240576;
	Sun, 14 Aug 2022 15:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A3E240576
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4CB1BF282
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32C0A82A3B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32C0A82A3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTHi3RqJAzZA for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 15:32:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EFE0827B5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 15:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EFE0827B5
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 10456874E5; Sun, 14 Aug 2022 15:18:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 17:31:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d4afac3ab11ea4b8c2d45312f70dadb63d17d628
X-Git-Newrev: f3b3887012de06c69b73291693c1bd4a35f21250
X-Patchwork-Hint: ignore
Message-Id: <20220814151826.10456874E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ttyd: bump to version
 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3b3887012de06c69b73291693c1bd4a35f21250
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update hash for license file to account for an update in the (C) years.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
[yann.morin.1998@free.fr: update the license hash]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ttyd/ttyd.hash | 4 ++--
 package/ttyd/ttyd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
index c4263d6e94..283288febf 100644
--- a/package/ttyd/ttyd.hash
+++ b/package/ttyd/ttyd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1116419527edfe73717b71407fb6e06f46098fc8a8e6b0bb778c4c75dc9f64b9  ttyd-1.6.3.tar.gz
-sha256  711762f081c180ade3d09d7b0b7537eaf35eca8d1671e47bc66eaa39376edb12  LICENSE
+sha256  47bc98d43cf2060af06378a2113605b229c46895a391613bdaa5a1197bfe5d47  ttyd-1.7.0.tar.gz
+sha256  8b7e100f8311cb428c57609164d93099bada2599f948359045d1ac876a7a625b  LICENSE
diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
index 856270a88d..7b582a696c 100644
--- a/package/ttyd/ttyd.mk
+++ b/package/ttyd/ttyd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TTYD_VERSION = 1.6.3
+TTYD_VERSION = 1.7.0
 TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
 TTYD_LICENSE = MIT
 TTYD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
