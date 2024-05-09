Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB135C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 17:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC65241EBE;
	Thu,  9 May 2024 17:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Tf68Iiatu0F; Thu,  9 May 2024 17:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7337C41E87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7337C41E87;
	Thu,  9 May 2024 17:01:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A55B1BF990
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72A2083EC8
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Svr3Jr9vvLsO for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 17:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0E6A83EC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0E6A83EC7
 for <buildroot@buildroot.org>; Thu,  9 May 2024 17:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 653D28102E; Thu,  9 May 2024 17:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:57:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45c4473bbfcd33de4ab3c9c359632417a25680f1
X-Git-Newrev: ee0ae230e431a20745ce2def5792f011321047af
X-Patchwork-Hint: ignore
Message-Id: <20240509170112.653D28102E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bento4: bump version to
 1.6.0-641-Omega
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee0ae230e431a20745ce2def5792f011321047af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bento4/bento4.hash | 2 +-
 package/bento4/bento4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bento4/bento4.hash b/package/bento4/bento4.hash
index b9391aed6a..b933c74d2d 100644
--- a/package/bento4/bento4.hash
+++ b/package/bento4/bento4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4464cd47b597e6dedbfc231bb6eb097c45cfe5ee0051082460d9ac53e9d74dc3  bento4-1.6.0-639-7-Omega.tar.gz
+sha256  f1f8cfa4f7cb651b609e587f825607cb4b06fe5b08af876fd0154a434f9a5315  bento4-1.6.0-641-Omega.tar.gz
 sha256  7daae92c8628ada28def8d096fe2fde298b72ec3e2d64a3c408afce38edb361b  Documents/LICENSE.txt
diff --git a/package/bento4/bento4.mk b/package/bento4/bento4.mk
index 8aefc401ef..569e320a2f 100644
--- a/package/bento4/bento4.mk
+++ b/package/bento4/bento4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BENTO4_VERSION = 1.6.0-639-7-Omega
+BENTO4_VERSION = 1.6.0-641-Omega
 BENTO4_SITE = $(call github,xbmc,Bento4,$(BENTO4_VERSION))
 BENTO4_INSTALL_STAGING = YES
 BENTO4_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
