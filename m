Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8304C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 18:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 398F741781;
	Wed, 14 Dec 2022 18:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 398F741781
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IwTjhRIv9CMa; Wed, 14 Dec 2022 18:22:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B726416B4;
	Wed, 14 Dec 2022 18:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B726416B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 100DC1BF312
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D66CA416B4
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D66CA416B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOuNFFhvy8_h for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 18:22:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BBB341681
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BBB341681
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 18:22:14 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout04.t-online.de (Postfix) with SMTP id 5F3F214CA0
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 19:22:11 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p5WOR-4TMITJ0; Wed, 14 Dec 2022 19:22:11 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:33950)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p5WOQ-0002sw-28
 for buildroot@buildroot.org; Wed, 14 Dec 2022 19:22:10 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 19:22:10 +0100
Message-Id: <20221214182210.158323-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671042131-D9A4E9D3-74DBDB53/0/0 CLEAN NORMAL
X-TOI-MSGID: ddffcac4-5420-4e7d-afd3-5c8ad76a8cdc
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: security
 bump version to 21.1.5
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

Release notes:
https://lists.x.org/archives/xorg-announce/2022-December/003303.html

Security advisory:
https://lists.x.org/archives/xorg-announce/2022-December/003302.html

Fixes CVE-2022-46340, CVE-2022-46341, CVE-2022-46342, CVE-2022-46343,
CVE-2022-46344 and CVE-2022-4283.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 7 +++----
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 4b2090fa99..654552c8b6 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003193.html
-sha256  5cc4be8ee47edb58d4a90e603a59d56b40291ad38371b0bd2471fc3cbee1c587  xorg-server-21.1.4.tar.xz
-sha512  eb5b8520d02908f72719e6ecfbf7a9bf139acb65ccae04d1db4223a8a2384cd3a94bd5afef10cce327b751b800cc2b79bfaa5ae35c95c3a217f775168082e68f  xorg-server-21.1.4.tar.xz
-
+# From https://lists.x.org/archives/xorg-announce/2022-December/003303.html
+sha256  05b0c8301cee7c5a78083df421ba3a071891553541a417b3d85adf5cf20f8720  xorg-server-21.1.5.tar.xz
+sha512  a39c6ba36f94241d330b679a9a6fe2c5fda73fc3f5a9308a7a9cfd0d58503e407291759c9e553455c07cf5a3862952ae3904334eeca29c97ff5af7cffd2e6953  xorg-server-21.1.5.tar.xz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 8dba9f1ed0..16b7438ee6 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.4
+XSERVER_XORG_SERVER_VERSION = 21.1.5
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
