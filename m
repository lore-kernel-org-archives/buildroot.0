Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD61DC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 828B7820E6;
	Fri,  9 Dec 2022 17:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 828B7820E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flRnOQOQh9sm; Fri,  9 Dec 2022 17:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C409F820F2;
	Fri,  9 Dec 2022 17:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C409F820F2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83FF11BF973
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85CDA41A66
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85CDA41A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQyg0aXBOxhT for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2EBE41B45
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2EBE41B45
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E222385C7A; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:36:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b8022395d32d8bda95ca084436659a983932c11
X-Git-Newrev: e2745a3b89ccc74f5d15ff812feb0b62da860e12
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.E222385C7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_fslsfonts: bump version
 to 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2745a3b89ccc74f5d15ff812feb0b62da860e12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-September/003210.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash | 5 +++--
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
index 1a7985f9a5..20573576c9 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-December/002510.html
-sha256  f1ed55093356b78daec2678d22f52d42ec11fe88575562d734396962e626d7f6  fslsfonts-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-September/003210.html
+sha256  01cb0c5a7dbddadef846ca3b52c2ab9c60f2c32c3f16584cd97a6c7f293341ee  fslsfonts-1.0.6.tar.xz
+sha512  1181a8e6cc820410d1deac98b3e5097506e4168c6515307b6b9aaf705cb57193a009cb331a51d46ce68e9548712f122b5c942d5a1bc1e01bdd191b7b1beab09e  fslsfonts-1.0.6.tar.xz
 # Locally computed
 sha256  fbdfcafb5755565ad688bf3f7f808109d358040ec83ed3de496155105451fdf4  COPYING
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
index 27786a55c1..1b8d630124 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_FSLSFONTS_VERSION = 1.0.5
-XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.bz2
-XAPP_FSLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_FSLSFONTS_VERSION = 1.0.6
+XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.xz
+XAPP_FSLSFONTS_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_FSLSFONTS_LICENSE = MIT
 XAPP_FSLSFONTS_LICENSE_FILES = COPYING
 XAPP_FSLSFONTS_DEPENDENCIES = xlib_libFS xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
