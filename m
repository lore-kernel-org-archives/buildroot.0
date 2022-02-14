Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543C8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E41160D51;
	Mon, 14 Feb 2022 21:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Py0z-bW0btYc; Mon, 14 Feb 2022 21:18:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63BFE60BD5;
	Mon, 14 Feb 2022 21:18:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F4271BF97D
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E4B5819BC
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Tj8JxEbuLmu for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:17:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C28B81496
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:17:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0D35982A50; Mon, 14 Feb 2022 21:10:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 22:01:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5ee6be2bdc8882eb04b5480b61d3c369c06972b8
X-Git-Newrev: 2f7f8f381394207bfb029ec395f5ced5695a0a2e
X-Patchwork-Hint: ignore
Message-Id: <20220214211017.0D35982A50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/liquid-dsp: bump
 version to 1.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f7f8f381394207bfb029ec395f5ced5695a0a2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/liquid-dsp/liquid-dsp.hash | 4 ++--
 package/liquid-dsp/liquid-dsp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.hash b/package/liquid-dsp/liquid-dsp.hash
index 31bcd68767..7e5de6b259 100644
--- a/package/liquid-dsp/liquid-dsp.hash
+++ b/package/liquid-dsp/liquid-dsp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 85093624ef9cb90ead64c836d2f42690197edace1a86257d6524c4e4dc870483  liquid-dsp-1.3.2.tar.gz
-sha256 4df7126196efba1283deb99e3269418dde4ab0ad1fde80a55051153451eb4df2  LICENSE
+sha256  66f38d509aa8f6207d2035bae5ee081a3d9df0f2cab516bc2118b5b1c6ce3333  liquid-dsp-1.4.0.tar.gz
+sha256  4df7126196efba1283deb99e3269418dde4ab0ad1fde80a55051153451eb4df2  LICENSE
diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index 9745893b7c..fcdf572532 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIQUID_DSP_VERSION = 1.3.2
+LIQUID_DSP_VERSION = 1.4.0
 LIQUID_DSP_SITE = $(call github,jgaeddert,liquid-dsp,v$(LIQUID_DSP_VERSION))
 LIQUID_DSP_LICENSE = MIT
 LIQUID_DSP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
