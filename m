Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193F5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0D8C40C3F;
	Wed,  6 Jul 2022 21:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0D8C40C3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MpKV57w1Iboa; Wed,  6 Jul 2022 21:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E37F640B67;
	Wed,  6 Jul 2022 21:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E37F640B67
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E98951C1135
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3FDF61125
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3FDF61125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKLBSRPWaxqX for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:28:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0687361120
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0687361120
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 24ACA82BDF; Wed,  6 Jul 2022 21:15:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:27:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4558c5299ea5dab67cc218466d13ff7e4c9ada6
X-Git-Newrev: 07b7f88668b1e51e3d17e14bd8795ef042df144e
X-Patchwork-Hint: ignore
Message-Id: <20220706211543.24ACA82BDF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/earlyoom: bump to version 1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=07b7f88668b1e51e3d17e14bd8795ef042df144e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/rfjakob/earlyoom/blob/v1.7/README.md#changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/earlyoom/earlyoom.hash | 2 +-
 package/earlyoom/earlyoom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/earlyoom/earlyoom.hash b/package/earlyoom/earlyoom.hash
index ab91383ee4..207f0e15ff 100644
--- a/package/earlyoom/earlyoom.hash
+++ b/package/earlyoom/earlyoom.hash
@@ -1,4 +1,4 @@
 # locally calculated
-sha256  227234cf9e77831c21c748bd361e1a7c415e158b96034eacd59e70586779bb6c  earlyoom-1.6.2.tar.gz
+sha256  ebda1279a813d9b0f7860ce5029ccf5ea9f8868be070f2eaf40f90f2e64b6414  earlyoom-1.7.tar.gz
 # License files, locally calculated
 sha256  e730b3ec729de46d987ae73f30ed337e4cbe832f09205330acfa71848c6e0087  LICENSE
diff --git a/package/earlyoom/earlyoom.mk b/package/earlyoom/earlyoom.mk
index d1cf9d4de1..c7042a054e 100644
--- a/package/earlyoom/earlyoom.mk
+++ b/package/earlyoom/earlyoom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EARLYOOM_VERSION = 1.6.2
+EARLYOOM_VERSION = 1.7
 EARLYOOM_SITE = $(call github,rfjakob,earlyoom,v$(EARLYOOM_VERSION))
 EARLYOOM_LICENSE = MIT
 EARLYOOM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
