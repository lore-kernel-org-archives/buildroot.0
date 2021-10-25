Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B07C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:37:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6569A60E08
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6569A60E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38F4B80DBD;
	Mon, 25 Oct 2021 12:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F210dlUiYZpD; Mon, 25 Oct 2021 12:37:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7EA180DBB;
	Mon, 25 Oct 2021 12:37:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DE8C1BF97C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E1AE80DBB
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5r1EjYwW3wOk for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 12:37:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4DA880DB7
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C64D688776; Mon, 25 Oct 2021 12:34:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 14:37:08 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 948ca1d6b4c5adcffff38ecc94b39c5bb09fca74
X-Git-Newrev: 8c24dde2f7308f0d767427b7afbafbc5cd47af39
X-Patchwork-Hint: ignore
Message-Id: <20211025123407.C64D688776@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/earlyoom: bump to
 version 1.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c24dde2f7308f0d767427b7afbafbc5cd47af39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

https://github.com/rfjakob/earlyoom/blob/v1.6.2/README.md#changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ee5efd4bbb93cee24850426d63acc34854ba1dc2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/earlyoom/earlyoom.hash | 2 +-
 package/earlyoom/earlyoom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/earlyoom/earlyoom.hash b/package/earlyoom/earlyoom.hash
index b0095cb8ec..ab91383ee4 100644
--- a/package/earlyoom/earlyoom.hash
+++ b/package/earlyoom/earlyoom.hash
@@ -1,4 +1,4 @@
 # locally calculated
-sha256  b81804fc4470f996014d52252a87a1cf3b43d3d8754140035b10dcee349302b8  earlyoom-1.6.tar.gz
+sha256  227234cf9e77831c21c748bd361e1a7c415e158b96034eacd59e70586779bb6c  earlyoom-1.6.2.tar.gz
 # License files, locally calculated
 sha256  e730b3ec729de46d987ae73f30ed337e4cbe832f09205330acfa71848c6e0087  LICENSE
diff --git a/package/earlyoom/earlyoom.mk b/package/earlyoom/earlyoom.mk
index 066a479bd1..d1cf9d4de1 100644
--- a/package/earlyoom/earlyoom.mk
+++ b/package/earlyoom/earlyoom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EARLYOOM_VERSION = 1.6
+EARLYOOM_VERSION = 1.6.2
 EARLYOOM_SITE = $(call github,rfjakob,earlyoom,v$(EARLYOOM_VERSION))
 EARLYOOM_LICENSE = MIT
 EARLYOOM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
