Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD17C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:27:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B0C96023B
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B0C96023B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DF47827F0;
	Fri,  5 Nov 2021 16:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcZXKHNhN9am; Fri,  5 Nov 2021 16:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC9C8281A;
	Fri,  5 Nov 2021 16:26:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6EA11C1148
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A79A982730
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Gc5kl7aNK1j for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:26:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05BA282718
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:26:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2E4378B2AA; Fri,  5 Nov 2021 16:22:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:26:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d8430f36f22546565c7f83ca7a94d2d2ee5b7af
X-Git-Newrev: eb2a5cc9e6cba056accd165608dbd33078ac42f5
X-Patchwork-Hint: ignore
Message-Id: <20211105162241.2E4378B2AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jack1/Config.in: fix wiki link
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb2a5cc9e6cba056accd165608dbd33078ac42f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The entry seems to have been renamed slightly.

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
