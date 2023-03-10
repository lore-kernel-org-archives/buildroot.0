Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C54AC64EC4
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 17:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FABB41B94;
	Fri, 10 Mar 2023 17:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FABB41B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4GYVTVh240q6; Fri, 10 Mar 2023 17:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4BEB41B91;
	Fri, 10 Mar 2023 17:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4BEB41B91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2020F1BF3B8
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 17:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECE84822DB
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 17:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECE84822DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Vu3DjsQE9Ow for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 17:14:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB7D9822CE
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB7D9822CE
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 17:14:38 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout11.t-online.de (Postfix) with SMTP id 2CC7DA3EE
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 18:14:15 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.179.197]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pagJk-0oCFX70; Fri, 10 Mar 2023 18:14:08 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:51668)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pagJj-0003A8-2p
 for buildroot@buildroot.org; Fri, 10 Mar 2023 18:14:07 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 10 Mar 2023 18:14:07 +0100
Message-Id: <20230310171407.429975-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678468448-BFFFE9DF-1964DFF3/0/0 CLEAN NORMAL
X-TOI-MSGID: 32c75237-a09a-420a-9a2b-847f2ee432b1
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-qxl:
 Update broken URL in Config.in helptext
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
