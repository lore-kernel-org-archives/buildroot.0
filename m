Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35589C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0080A83C0A;
	Wed,  7 Feb 2024 16:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kKj5NpxOEmje; Wed,  7 Feb 2024 16:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1505883C0F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1505883C0F;
	Wed,  7 Feb 2024 16:26:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 585121BF59A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5235E40179
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zGQKoNl1K8GR for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57B39400CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57B39400CB
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:26:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45DA98763E; Wed,  7 Feb 2024 16:26:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:24:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e591475b4d0c2e2661d3710abd0964b5b42275e5
X-Git-Newrev: 4b33d7a47dd41fed5364a398320c2b7d0687ba5e
X-Patchwork-Hint: ignore
Message-Id: <20240207162621.45DA98763E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tio: bump to version 2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b33d7a47dd41fed5364a398320c2b7d0687ba5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tio/tio.hash | 4 ++--
 package/tio/tio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tio/tio.hash b/package/tio/tio.hash
index cb0311a752..02699fdeb4 100644
--- a/package/tio/tio.hash
+++ b/package/tio/tio.hash
@@ -1,5 +1,5 @@
-# From https://github.com/tio/tio/releases/download/v1.47/tio-1.47.tar.xz.sha256sum:
-sha256  6f39ac582de747feb9a64c14e6b378c61cb0c3bfa6639e62050022c1b7f5c544  tio-1.47.tar.xz
+# From https://github.com/tio/tio/releases/download/v2.7/tio-2.7.tar.xz.sha256sum:
+sha256  bf8fe434848c2c1b6540af0b42503c986068176ddc1a988cf02e521e7de5daa5  tio-2.7.tar.xz
 
 # Hash for license files:
 sha256  9248dee77ee136321f24556a96e07ff8f90461013941884a9defd0ac825ef131  LICENSE
diff --git a/package/tio/tio.mk b/package/tio/tio.mk
index 0035ce445e..d7b554ee84 100644
--- a/package/tio/tio.mk
+++ b/package/tio/tio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIO_VERSION = 1.47
+TIO_VERSION = 2.7
 TIO_SOURCE = tio-$(TIO_VERSION).tar.xz
 TIO_SITE = https://github.com/tio/tio/releases/download/v$(TIO_VERSION)
 TIO_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
