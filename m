Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337F7C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC12D82109;
	Sun,  7 May 2023 12:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC12D82109
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YexD5Au2i83U; Sun,  7 May 2023 12:04:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E271082199;
	Sun,  7 May 2023 12:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E271082199
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 945FC1BF2FA
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B10D4050C
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B10D4050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_Lfb3buafVN for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:04:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78F454049E
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78F454049E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 669B685EF1; Sun,  7 May 2023 12:04:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 13:10:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e45fb0242496ed4d5bb43108c8bac0ba01af2fff
X-Git-Newrev: 33916e184b1e6efa9221c66707132d9b997eb98b
X-Patchwork-Hint: ignore
Message-Id: <20230507120438.669B685EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xinput: bump version to
 1.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=33916e184b1e6efa9221c66707132d9b997eb98b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-April/003389.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xinput/xapp_xinput.hash | 8 +++-----
 package/x11r7/xapp_xinput/xapp_xinput.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xinput/xapp_xinput.hash b/package/x11r7/xapp_xinput/xapp_xinput.hash
index 0961879637..d3a6a66902 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.hash
+++ b/package/x11r7/xapp_xinput/xapp_xinput.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003013.html
-md5  ac6b7432726008b2f50eba82b0e2dbe4  xinput-1.6.3.tar.bz2
-sha1  92ea7dfb3d8465921b0dca85da7d5b01cedae6c8  xinput-1.6.3.tar.bz2
-sha256  35a281dd3b9b22ea85e39869bb7670ba78955d5fec17c6ef7165d61e5aeb66ed  xinput-1.6.3.tar.bz2
-sha512  cb2fef866ac5a71dbca3e23b4ecadaca38e65dc1b30f8bb024bad92486554fafc472706619a1af04c746a4f53ce6aea827d694b9f4f0c7d0d46bb1da81984076  xinput-1.6.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-April/003389.html
+sha256  ad04d00d656884d133110eeddc34e9c69e626ebebbbab04dc95791c2907057c8  xinput-1.6.4.tar.xz
+sha512  6734860852715e5cb9d26259a173e42413fc037546ed7fa4173ffa802c2619ee0322bed228a28cd1911be759d860070867d9b89b115f37323cca1c9ef75354b9  xinput-1.6.4.tar.xz
 # Locally computed
 sha256  bbd35c7a8e8c5cb073935e84b29b0c53f7131a4ef1ce737dc2be5616941e07e1  COPYING
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 0d6c0deffe..614b62fe77 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XINPUT_VERSION = 1.6.3
-XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
+XAPP_XINPUT_VERSION = 1.6.4
+XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.xz
 XAPP_XINPUT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XINPUT_LICENSE = MIT
 XAPP_XINPUT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
