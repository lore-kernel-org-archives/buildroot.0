Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC60C52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 20:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAA2840233;
	Tue,  6 Aug 2024 20:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2neyLpxRdaG; Tue,  6 Aug 2024 20:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1B9A40253
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1B9A40253;
	Tue,  6 Aug 2024 20:30:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80F6A1BF33D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E2BC40233
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZrFBEH-50BR for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 20:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A59140253
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A59140253
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 20:30:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6219384279; Tue,  6 Aug 2024 20:30:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 22:29:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21f312a53e49a3338db870df778665e42cf72dbf
X-Git-Newrev: 33d45b9c672df06b7157be957f81b2cf17dccdd7
X-Patchwork-Hint: ignore
Message-Id: <20240806203010.6219384279@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swipl: bump version to 9.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=33d45b9c672df06b7157be957f81b2cf17dccdd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://www.swi-prolog.org/ChangeLog?branch=stable&from=9.2.0&to=9.2.6

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swipl/swipl.hash | 2 +-
 package/swipl/swipl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swipl/swipl.hash b/package/swipl/swipl.hash
index 9f980654ba..98611ffcda 100644
--- a/package/swipl/swipl.hash
+++ b/package/swipl/swipl.hash
@@ -1,4 +1,4 @@
 # From https://www.swi-prolog.org/download/stable
-sha256  10d90b15734d14d0d7972dc11a3584defd300d65a9f0b1185821af8c3896da5e  swipl-9.2.0.tar.gz
+sha256  0cb9b80b9922be8165cbac384ebe050d94553e72cf7aebfc980b4395ff01d05d  swipl-9.2.6.tar.gz
 # Locally calculated
 sha256  770594d0f4463b71f1485f00e4bc5cf4b6f667d62ef6bc9bde2fee236541992a  LICENSE
diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
index d4263a6aa8..9ba841084e 100644
--- a/package/swipl/swipl.mk
+++ b/package/swipl/swipl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWIPL_VERSION = 9.2.0
+SWIPL_VERSION = 9.2.6
 SWIPL_SITE = https://www.swi-prolog.org/download/stable/src
 SWIPL_LICENSE = BSD-2-Clause
 SWIPL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
