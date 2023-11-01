Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37AEC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72BBD431BD;
	Wed,  1 Nov 2023 17:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72BBD431BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 96zOZaGw_9wI; Wed,  1 Nov 2023 17:02:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F1F241768;
	Wed,  1 Nov 2023 17:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F1F241768
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29C5F1BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0341549DFC
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0341549DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s4ZBvDBGKTgl for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:01:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33CAC4ED44
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33CAC4ED44
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B1248639E; Wed,  1 Nov 2023 17:01:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 17:52:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b652a546eb4a25b396a5d6b305df4b0003e3f214
X-Git-Newrev: cc85e9dea5c1a66cbfec6224786ee04d110d5e29
X-Patchwork-Hint: ignore
Message-Id: <20231101170149.1B1248639E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lxc: bump to version 5.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc85e9dea5c1a66cbfec6224786ee04d110d5e29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://discuss.linuxcontainers.org/t/lxc-5-0-3-lts-has-been-released/17708

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lxc/lxc.hash | 2 +-
 package/lxc/lxc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 2dd983a361..8b3365ddfc 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  bea08d2e49efcee34fa58acd2bc95c0adc64d291c07f4cfaf4ac1d8ac5a36f45  lxc-5.0.2.tar.gz
+sha256  2693a4c654dcfdafb3aa95c262051d8122afa1b6f5cef1920221ebbdee934d07  lxc-5.0.3.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 4a4d3a6212..b2afb978e6 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 5.0.2
+LXC_VERSION = 5.0.3
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
