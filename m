Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CABDC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D75924EF7D;
	Fri, 28 Feb 2025 16:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id me6AxWEN-0iT; Fri, 28 Feb 2025 16:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFDB042CF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFDB042CF7;
	Fri, 28 Feb 2025 16:37:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12EAD68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 690FA424C3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQqHvQvQb8RG for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3C1C418F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3C1C418F7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFCC382621; Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Dec 2024 23:34:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0c6b8c989fcca8d057f7598f28eff377a018ed2f
X-Git-Newrev: 2e8cd8199c5024cf419336d509c8714cf560e8b4
X-Patchwork-Hint: ignore
Message-Id: <20250228162935.DFCC382621@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/xdriver_xf86-video-qxl: fix 'appropriate' typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e8cd8199c5024cf419336d509c8714cf560e8b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
index db0bbbaf65..616566f9ab 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
+++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
@@ -19,7 +19,7 @@ XDRIVER_XF86_VIDEO_QXL_DEPENDENCIES = \
 	xorgproto \
 	xserver_xorg-server
 
-# configure doesn't look for drm headers in the appropiate place, so help it
+# configure doesn't look for drm headers in the appropriate place, so help it
 # libdrm is only useful with udev for KMS
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 XDRIVER_XF86_VIDEO_QXL_CONF_ENV += REQUIRED_MODULES=libdrm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
