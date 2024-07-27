Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E0CC3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5387140CD7;
	Sat, 27 Jul 2024 14:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x9HUwtlgHuaX; Sat, 27 Jul 2024 14:18:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B4B040CE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B4B040CE7;
	Sat, 27 Jul 2024 14:18:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C25481BF84C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AED6A40274
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JvGy14dpwJd for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C591D4024E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C591D4024E
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:18:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B08A9875BA; Sat, 27 Jul 2024 14:18:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 16:16:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c19a417674961fe6a10b566d600ceb6b4989ec8b
X-Git-Newrev: 94951ff187b305bc18f2e24e8f642c26c777a6a2
X-Patchwork-Hint: ignore
Message-Id: <20240727141808.B08A9875BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nasm: bump to version 2.16.03
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

commit: https://git.buildroot.net/buildroot/commit/?id=94951ff187b305bc18f2e24e8f642c26c777a6a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://nasm.us/doc/nasmdocc.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nasm/nasm.hash | 2 +-
 package/nasm/nasm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index d6513ff9c6..141e141b0c 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e1b942ea88f22edae89659e15be26fa027eae0747f51413540f52d4eac4790d  nasm-2.16.02.tar.xz
+sha256  1412a1c760bbd05db026b6c0d1657affd6631cd0a63cddb6f73cc6d4aa616148  nasm-2.16.03.tar.xz
 sha256  1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  LICENSE
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index ec03b03977..e44d265be6 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.16.02
+NASM_VERSION = 2.16.03
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = https://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
