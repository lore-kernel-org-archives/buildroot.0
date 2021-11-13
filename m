Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A08C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:39:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 825C2610FE
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 825C2610FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57E1D40417;
	Sat, 13 Nov 2021 14:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPqwOwopR0Dw; Sat, 13 Nov 2021 14:39:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A003040401;
	Sat, 13 Nov 2021 14:39:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 831B81BF23C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A013D40157
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CxbD7d5z30S for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 14:38:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D022740401
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 14:38:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B1EFF8C9EC; Sat, 13 Nov 2021 14:34:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 15:30:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 621a076fcaae7f18f8b34f46db3508c068cfec5a
X-Git-Newrev: dfc468c4af354dbead36aec0c80b986415ac4be9
X-Patchwork-Hint: ignore
Message-Id: <20211113143454.B1EFF8C9EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-input-libinput: bump version to 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfc468c4af354dbead36aec0c80b986415ac4be9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switched _SITE to https.

Release notes:
https://lists.x.org/archives/xorg-announce/2021-September/003110.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash    | 6 +++---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk      | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 3ee726bfdc..a2f295d6b5 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-June/003094.html
-sha256  e11d2a41419124a6e9b148f1df181bf7819fc7398c8ee9a1b6390b0742c68d16  xf86-input-libinput-1.1.0.tar.bz2
-sha512  7def9a4834a9203d1672613b1a4b384a0eb3d664818865b375969bf9ca96c512b752859acc8916de9224f7e488f8d59953308e53b983dfa8031ca01fd707fa2b  xf86-input-libinput-1.1.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-September/003110.html
+sha256  f80da3c514fe1cbf57fa1b1bd6ff97f6b0a1f87466ad89247bac59cd0a5869f6  xf86-input-libinput-1.2.0.tar.bz2
+sha512  ebff9490d33fd7495df2e03203060a76b3274f0e638bc92f3d95257fac57cdb9dac308e90e54006fe9522b6de3b1f1c38fd5f0b0b75b7051e5422290f43de52d  xf86-input-libinput-1.2.0.tar.bz2
 
 # Locally computed
 sha256  4114220b281561e80f3422f0e7ae8d3e1fc85131ffc2e3b6265119e66f1adb27  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 73cdad9b85..21d962aa52 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.1.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.2.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_LIBINPUT_SITE = https://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_LIBINPUT_DEPENDENCIES = libinput xserver_xorg-server xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
