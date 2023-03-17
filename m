Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7F0C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 08:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8DB5416CC;
	Fri, 17 Mar 2023 08:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8DB5416CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QmYWHcsb34da; Fri, 17 Mar 2023 08:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C276C416D1;
	Fri, 17 Mar 2023 08:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C276C416D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 089BE1BF983
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7029415D3
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7029415D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYA_gBgDrwFP for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 08:36:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4BF841528
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4BF841528
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2023874D2; Fri, 17 Mar 2023 08:36:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 09:21:24 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 500cf06a68e9628cb4421cc32858094599582ebd
X-Git-Newrev: 2e0122dd4d832c2e10f87ec726259fbde1082684
X-Patchwork-Hint: ignore
Message-Id: <20230317083632.C2023874D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 package/x11r7/xdriver_xf86-video-qxl: Update broken URL in Config.in
 helptext
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e0122dd4d832c2e10f87ec726259fbde1082684
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 562045056b7a25131cc17f58055fd5d6d7bf305c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-video-qxl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-qxl/Config.in b/package/x11r7/xdriver_xf86-video-qxl/Config.in
index 40f61fd69f..0c6b13eda2 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/Config.in
+++ b/package/x11r7/xdriver_xf86-video-qxl/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_QXL
 	help
 	  QEMU QXL paravirt video driver
 
-	  http://www.spice-space.org/page/XorgQXL
+	  https://gitlab.freedesktop.org/xorg/driver/xf86-video-qxl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
