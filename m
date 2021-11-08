Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C73C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:11:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89DDB6101C
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89DDB6101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6686480EB6;
	Mon,  8 Nov 2021 16:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id anN7i_AuJFRt; Mon,  8 Nov 2021 16:11:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C54F380EAD;
	Mon,  8 Nov 2021 16:11:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 949281BF868
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 354D4402F0
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LgujyH5ZzN0X for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:07:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C7A7402F7
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:07:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E21968B6D5; Mon,  8 Nov 2021 16:03:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 17:02:15 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 029b7a2356b75c69ca0c0627c8e8ce252908decb
X-Git-Newrev: 8a46e128eb842f890f119b7b19359192d0f88aaf
X-Patchwork-Hint: ignore
Message-Id: <20211108160323.E21968B6D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/jack1/Config.in:
 fix wiki link
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a46e128eb842f890f119b7b19359192d0f88aaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

The entry seems to have been renamed slightly.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit eb2a5cc9e6cba056accd165608dbd33078ac42f5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack1/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jack1/Config.in b/package/jack1/Config.in
index b9299e2fd8..1c67f10332 100644
--- a/package/jack1/Config.in
+++ b/package/jack1/Config.in
@@ -25,7 +25,7 @@ config BR2_PACKAGE_JACK1
 	  Another implementation (BR2_PACKAGE_JACK2) is also available,
 	  please consult the documentation to choose the right one:
 
-	  https://github.com/jackaudio/jackaudio.github.com/wiki/Q_difference_jack1_jack2
+	  https://github.com/jackaudio/jackaudio.github.com/wiki/Differences-between-jack1-and-jack2
 
 comment "jack1 needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
