Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDDAC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD1344F267;
	Mon, 20 Feb 2023 22:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD1344F267
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q-0Yga4ee9TP; Mon, 20 Feb 2023 22:44:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 841C94F27F;
	Mon, 20 Feb 2023 22:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 841C94F27F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF0F21BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A746C41706
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A746C41706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V8xlOv-MOOgw for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E50C3416FE
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E50C3416FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF98F86494; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 20:58:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 99127efe6ec2c8c056e252845326cc374859fa74
X-Git-Newrev: 4b473917001fa1145bec2ab118fac97dab0fc26e
X-Patchwork-Hint: ignore
Message-Id: <20230220205215.DF98F86494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/haveged: bump to
 version 1.9.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b473917001fa1145bec2ab118fac97dab0fc26e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/jirka-h/haveged/blob/v1.9.18/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haveged/haveged.hash | 2 +-
 package/haveged/haveged.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index 8c62ead7c3..61bf6cc9a1 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f882919ccead07ad6687a4784c0c501e617321e96dd0118403464969359cf6ad  haveged-1.9.15.tar.gz
+sha256  b835fa02b52ee7d06276e028571cadcb14d08f5e5a4b5767adf81451f70561c7  haveged-1.9.18.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 7035142aee..fbf72a96ad 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.15
+HAVEGED_VERSION = 1.9.18
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
