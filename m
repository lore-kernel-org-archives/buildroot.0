Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D874C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:22:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14ADD60E05
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14ADD60E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E85A4404DC;
	Mon, 11 Oct 2021 21:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uM9483jgQUUl; Mon, 11 Oct 2021 21:22:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FC3F404DA;
	Mon, 11 Oct 2021 21:22:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 105CB1BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52FD1404DA
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:20:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0sTX7fp9wrAk for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:20:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B22F4404CE
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:20:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 712F59547E; Mon, 11 Oct 2021 21:18:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 23:20:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56ba868ed1ea68da3fb8739d19c8e05ad91454ce
X-Git-Newrev: fe79fba3fd52cd6445c5a1d90629c94605c93519
X-Patchwork-Hint: ignore
Message-Id: <20211011211803.712F59547E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boinc: bump version to 7.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe79fba3fd52cd6445c5a1d90629c94605c93519
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://boinc.berkeley.edu/wiki/Release_Notes

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/boinc/boinc.hash | 2 +-
 package/boinc/boinc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
index 981d9141ea..35e59ce415 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  e66fe2e2a804687c1fef2a0d2819d634dc24c9af1cb371c71ac468352f7a562a  boinc-7.16.18.tar.gz
+sha256  274388d9c49e488b6c8502ffc6eb605d5ceae391fb0c2fc56dbb0254d0ceb27e  boinc-7.18.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 079b065efd..12394ae924 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BOINC_VERSION_MAJOR = 7.16
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).18
+BOINC_VERSION_MAJOR = 7.18
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).1
 BOINC_SITE = \
 	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
 BOINC_LICENSE = LGPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
