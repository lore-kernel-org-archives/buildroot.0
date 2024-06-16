Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457D6C27C6E
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 10:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C79140297;
	Sun, 16 Jun 2024 10:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4Ms24wM9vnT; Sun, 16 Jun 2024 10:25:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC9DD4064C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC9DD4064C;
	Sun, 16 Jun 2024 10:25:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC8C41BF8C7
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E27E4403CB
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZ2o7oPcjWaa for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 177C94015E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 177C94015E
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10CBF87FAD; Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jun 2024 12:23:19 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6a543bd03f1cdb4271a8be6c874949d138f8e5e2
X-Git-Newrev: 1561b6b56fcb9ff454443b2e7262be34db721163
X-Patchwork-Hint: ignore
Message-Id: <20240616102528.10CBF87FAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: fix
 alphabetical order
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

commit: https://git.buildroot.net/buildroot/commit/?id=1561b6b56fcb9ff454443b2e7262be34db721163
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 436d86840af0de56ded6843d02d3b2f3805d53e2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 253e3ff343..9e14ac5c5f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1909,8 +1909,8 @@ F:	package/libcamera/
 N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
 F:	board/avnet/rzboard_v2l/
 F:	board/radxa/rock5b/
-F:	configs/rock5b_defconfig
 F:	configs/avnet_rzboard_v2l_defconfig
+F:	configs/rock5b_defconfig
 F:	package/rockchip-rkbin/
 
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
