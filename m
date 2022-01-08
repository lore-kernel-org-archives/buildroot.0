Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84071C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DE0881516;
	Sat,  8 Jan 2022 17:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Viid1szaD6c6; Sat,  8 Jan 2022 17:40:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71650814A0;
	Sat,  8 Jan 2022 17:40:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B2901BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A0C7408D0
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IyVsYybBiEv7 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:39:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9792408CD
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:39:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0886D832C8; Sat,  8 Jan 2022 17:33:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 18:39:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0730b8b8228391ec36ace6e1d1d0831590b8d0cf
X-Git-Newrev: e0de6291e3fe8d9f6c572a5206b8ead3719f6829
X-Patchwork-Hint: ignore
Message-Id: <20220108173323.0886D832C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libss7: add Linux in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0de6291e3fe8d9f6c572a5206b8ead3719f6829
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add "Linux" before kernel in comment to be consistent with other
packages and manual

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libss7/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libss7/Config.in b/package/libss7/Config.in
index bdf5fbe3a8..d8bcf11ce7 100644
--- a/package/libss7/Config.in
+++ b/package/libss7/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBSS7
 
 	  http://www.asterisk.org/downloads/libss7
 
-comment "libss7 needs a kernel to be built"
+comment "libss7 needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
 comment "libss7 needs a toolchain w/ threads"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
