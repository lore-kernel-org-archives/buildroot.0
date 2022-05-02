Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1707CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4311408D1;
	Mon,  2 May 2022 22:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igr317Lire2u; Mon,  2 May 2022 22:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD75840445;
	Mon,  2 May 2022 22:00:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D15B1BF968
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5102D408B4
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ck3s2AcGZ7rU for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 307F4404E9
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EEB3284F10; Mon,  2 May 2022 21:48:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 23:40:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a667c62433d617ab0645c9ac0547aa6e854cf9d8
X-Git-Newrev: 8ea0b4fce62d8527d45e12490030126d568c9811
X-Patchwork-Hint: ignore
Message-Id: <20220502214850.EEB3284F10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtai: bump to version 5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ea0b4fce62d8527d45e12490030126d568c9811
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rtai/rtai.hash | 2 +-
 package/rtai/rtai.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtai/rtai.hash b/package/rtai/rtai.hash
index f0afafbd7c..f2eb7f33ad 100644
--- a/package/rtai/rtai.hash
+++ b/package/rtai/rtai.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 13669da744a0ba411bdb8e47fa47b6e19171646ae42c8dbb2735d12e555fb1a3 rtai-4.0.1.tar.bz2
+sha256  57acd3ad46cc8f1e01dc21089a24587c59e7328cbac06abb62bb0152de0b9df7  rtai-5.3.tar.bz2
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 90f2cc4c8d..6b309ebf85 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTAI_VERSION = 4.0.1
+RTAI_VERSION = 5.3
 RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
 RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
 RTAI_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
