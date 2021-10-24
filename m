Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0912C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:09:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AAFE60F6F
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AAFE60F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E333D4020E;
	Sun, 24 Oct 2021 13:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpPaiDGabS06; Sun, 24 Oct 2021 13:09:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5469D40248;
	Sun, 24 Oct 2021 13:09:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 399EF1BF2F2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29BBF80BBF
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LE6CNwJ8o5Jh for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:09:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73C1A80B5B
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:09:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D31B08857A; Sun, 24 Oct 2021 13:06:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 15:09:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8dbb173004c96e204b91d447452767fc572ca7c
X-Git-Newrev: 7cdfec3f779d164fca835c172b278f9faee04559
X-Patchwork-Hint: ignore
Message-Id: <20211024130616.D31B08857A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: bump to version 14.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cdfec3f779d164fca835c172b278f9faee04559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license hash due to updating Acorn to v8.4.1

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 098049c021..3a4571e8e5 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From https://nodejs.org/dist/v14.17.6/SHASUMS256.txt
-sha256  f458cd0b1cb1540611cb08709d833c0c59c74da79310ae1984cc8bad1404ad5e  node-v14.17.6.tar.xz
+sha256  3fa1d71adddfab2f5e3e41874b4eddbdf92b65cade4a43922fb1e437afcf89ed  node-v14.18.1.tar.xz
 
 # Hash for license file
-sha256  4c3016fb267bc473af18b305068f7f2d206ccd5ab98297ec593e1c32d73ad4fc  LICENSE
+sha256  b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 32f4947c0d..42ef1baa64 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 14.17.6
+NODEJS_VERSION = 14.18.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-qemu host-python3 host-nodejs c-ares \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
