Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D31C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72D4682890;
	Mon, 15 Aug 2022 09:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72D4682890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id us4nHZewy__C; Mon, 15 Aug 2022 09:18:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A68FC827CE;
	Mon, 15 Aug 2022 09:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A68FC827CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E64E1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE4C383E19
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE4C383E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RfE-_Sfi-ViX for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E40C6827FD
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E40C6827FD
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EBC96875A8; Mon, 15 Aug 2022 09:02:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:03:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f5afac198870a9df011f0f4cbe9b67aaf8fc8fe
X-Git-Newrev: d6f1b338176c1f2b43016ba9c2a60d45a629a6bd
X-Patchwork-Hint: ignore
Message-Id: <20220815090237.EBC96875A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcnano-binaries: fix typo on help
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6f1b338176c1f2b43016ba9c2a60d45a629a6bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libaries -> libraries

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcnano-binaries/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcnano-binaries/Config.in b/package/gcnano-binaries/Config.in
index ade19e2121..89f909f2c3 100644
--- a/package/gcnano-binaries/Config.in
+++ b/package/gcnano-binaries/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_GCNANO_BINARIES
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WAYLAND
 	help
-	  Driver and libaries for stm vivante gcnano gpu.
+	  Driver and libraries for stm vivante gcnano gpu.
 	  https://github.com/STMicroelectronics/gcnano-binaries/
 
 if BR2_PACKAGE_GCNANO_BINARIES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
