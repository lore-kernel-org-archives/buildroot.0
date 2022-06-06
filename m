Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CBDC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3D8640C8F;
	Mon,  6 Jun 2022 10:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-if8LJuZHWy; Mon,  6 Jun 2022 10:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19659403E9;
	Mon,  6 Jun 2022 10:37:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 062261BF39A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8CFD83E28
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5MpVLxNLGwz8 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:37:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43689832EA
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:37:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4B01886CC4; Mon,  6 Jun 2022 10:25:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 12:36:49 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5f1e1c24b4069b4691c2832534801c34ff2cd107
X-Git-Newrev: 28df426f04865255ea497424228f3544c81bb6ce
X-Patchwork-Hint: ignore
Message-Id: <20220606102531.4B01886CC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rockchip-mali:
 fix typo on Config.in help section
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

commit: https://git.buildroot.net/buildroot/commit/?id=28df426f04865255ea497424228f3544c81bb6ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c86318e921d5dddf17340f02ba19b685f8786dd7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rockchip-mali/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rockchip-mali/Config.in b/package/rockchip-mali/Config.in
index 2a8cd786be..d616284911 100644
--- a/package/rockchip-mali/Config.in
+++ b/package/rockchip-mali/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_ROCKCHIP_MALI
 	select BR2_PACKAGE_MALI_DRIVER if BR2_LINUX_KERNEL
 	help
 	  Install the binary user-space libraries for the ARM Mali GPU
-	  suitable for Rockchip platforrms. This package requires a
+	  suitable for Rockchip platforms. This package requires a
 	  kernel with the ARM Mali GPU kernel driver enabled, as found
 	  in the 'mali-driver' package.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
