Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E7EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 08:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E29416D1;
	Wed, 13 Apr 2022 08:14:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DdloQJ7uFVTq; Wed, 13 Apr 2022 08:14:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F15F44024E;
	Wed, 13 Apr 2022 08:14:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEB4B1BF403
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7B11400C6
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5JXfLP13433g for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1627B401B2
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2528083C16; Wed, 13 Apr 2022 08:02:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 09:59:43 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 352fb7eb39e7a419c5d1d6c08f4cb2903c255542
X-Git-Newrev: 721901a4ddb4681b234bdf50c96bd8afaeac0d34
X-Patchwork-Hint: ignore
Message-Id: <20220413080257.2528083C16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mc: bump to
 version 4.8.28
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

commit: https://git.buildroot.net/buildroot/commit/?id=721901a4ddb4681b234bdf50c96bd8afaeac0d34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f17b71d3a8c7971d0f24f4832815f3e77cb7e1d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 6400f64b99..b0381474ff 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,4 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.27.sha256
-sha256  31be59225ffa9920816e9a8b3be0ab225a16d19e4faf46890f25bdffa02a4ff4  mc-4.8.27.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.28.sha256
+sha256  e994d9be9a7172e9ac4a4ad62107921f6aa312e668b056dfe5b8bcebbaf53803  mc-4.8.28.tar.xz
 # sha256 locally computed:
 sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 678d687bcf..ac12c2173a 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.27
+MC_VERSION = 4.8.28
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
