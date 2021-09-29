Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49049C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 15:09:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08D5E613D3
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 15:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08D5E613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43C740769;
	Wed, 29 Sep 2021 15:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUK4h1RtAvAs; Wed, 29 Sep 2021 15:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DD1140699;
	Wed, 29 Sep 2021 15:09:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22EB71BF21A
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 15:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0585960C1B
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 15:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hMdLlI114xpj for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 15:07:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3FFC60C1A
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 15:07:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BAD858D4E9; Wed, 29 Sep 2021 15:04:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 16:57:40 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: b0d5a312e8264cd41934e1ae18a393ca1d29ff89
X-Git-Newrev: f052a19a7a3d3a518a58e2f2266eac5e8ffc6ca1
X-Patchwork-Hint: ignore
Message-Id: <20210929150458.BAD858D4E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/gst1-rtsp-server:
 bump version to 1.18.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=f052a19a7a3d3a518a58e2f2266eac5e8ffc6ca1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 931c6e2a7099ba786a42c8b3f6c9efca1512caae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index b07b24413b..627a451d04 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.18.4.tar.xz.sha256sum
-sha256  a46bb8de40b971a048580279d2660e616796f871ad3ed00c8a95fe4d273a6c94  gst-rtsp-server-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.18.5.tar.xz.sha256sum
+sha256  04d63bf48816c6f41c73f6de0f912a7cef0aab39c44162a7bcece1923dfc9d1f  gst-rtsp-server-1.18.5.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 878195b74d..37942423a5 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.18.4
+GST1_RTSP_SERVER_VERSION = 1.18.5
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
