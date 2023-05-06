Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C9EC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B44EA42A9D;
	Sat,  6 May 2023 17:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B44EA42A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxB21r1h1XEK; Sat,  6 May 2023 17:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1D0F40CA8;
	Sat,  6 May 2023 17:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1D0F40CA8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9DC1BF859
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75B9F83EE1
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75B9F83EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qQ9DW3EuNAt1 for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02E8D83CEA
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02E8D83CEA
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:22 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout03.t-online.de (Postfix) with SMTP id 703A85843
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:20 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd72.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsO-1IXP6n0; Sat, 6 May 2023 19:39:20 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsN-0004jT-2J
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:16 +0200
Message-Id: <20230506173917.1112500-21-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394760-3D8ADC0E-4774840B/0/0 CLEAN NORMAL
X-TOI-MSGID: b4c522e1-c4ec-4406-8407-69c14d10379d
Subject: [Buildroot] [PATCH 21/22] package/x11r7/xdriver_xf86-video-amdgpu:
 bump version to 23.0.0
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
https://lists.x.org/archives/xorg-announce/2023-February/003334.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-amdgpu.hash                          | 6 +++---
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
index c45ae59ee4..962cb0e16b 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg/2022-February/060928.html
-sha256  9d23fb602915dc3ccde92aa4d1e9485e7e54eaae2f41f485e55eb20761778266  xf86-video-amdgpu-22.0.0.tar.xz
-sha512  95c64e3fef7729ced6e7adc5e81c60cc218f6d8b6604f7b290e86ff52c917426b5102decbf8be8a66c9181ccde6e5dff7083dca8cc0c493a39e82625b5c7cb2a  xf86-video-amdgpu-22.0.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-February/003334.html
+sha256  4f04f0ea66f3ced0dcc58f617409860163a19c4e8c285cfb5285f36ba09cc061  xf86-video-amdgpu-23.0.0.tar.xz
+sha512  bf26f147629a34e84a0ae8435119e170b9c95edafcab1995b63bb8f55abef32f2efbf4536eb070e64b2ae1460424b1b27a4206cb9836d33ddc6dfbee404f718b  xf86-video-amdgpu-23.0.0.tar.xz
 # Locally computed
 sha256  58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index ba4ab43db2..84f8e39ddd 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 22.0.0
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 23.0.0
 XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.xz
-XDRIVER_XF86_VIDEO_AMDGPU_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_AMDGPU_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
