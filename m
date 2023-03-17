Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F04C6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 08:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A480F410C5;
	Fri, 17 Mar 2023 08:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A480F410C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDLEAHLSEs8r; Fri, 17 Mar 2023 08:38:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84B6A4184E;
	Fri, 17 Mar 2023 08:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B6A4184E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E123E1BF276
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B40DD41851
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B40DD41851
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uma-MDWa7nNn for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71241416CE
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71241416CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FD7C874F5; Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 09:21:20 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: afb90502dae53b2a4dffd3b0125cf2eda20ce49d
X-Git-Newrev: 875ea2df1743cee70967693b99c2aac9cba6207d
X-Patchwork-Hint: ignore
Message-Id: <20230317083810.5FD7C874F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=875ea2df1743cee70967693b99c2aac9cba6207d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
