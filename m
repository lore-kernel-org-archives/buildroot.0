Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880DEC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32CE340CE2;
	Fri,  9 Dec 2022 17:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32CE340CE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsKd-ZHFU0dD; Fri,  9 Dec 2022 17:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 740E441014;
	Fri,  9 Dec 2022 17:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 740E441014
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70AFC1BF973
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36EB541A53
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36EB541A53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rU452g27817n for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D3A141B3D
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3A141B3D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B06485EA6; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:35:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef8faec32df85cf6172a9e26f68d6c6f704265e2
X-Git-Newrev: 0f18b8dcb4e622f973d73332732d3dd6f548d3a3
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.9B06485EA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xditview: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f18b8dcb4e622f973d73332732d3dd6f548d3a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-October/003220.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xditview/xapp_xditview.hash | 8 +++-----
 package/x11r7/xapp_xditview/xapp_xditview.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xditview/xapp_xditview.hash b/package/x11r7/xapp_xditview/xapp_xditview.hash
index 4586c0b5a4..dbaf5e42b7 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.hash
+++ b/package/x11r7/xapp_xditview/xapp_xditview.hash
@@ -1,7 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002570.html
-md5  3a909116a3b2abe3845215cf49e09fa5  xditview-1.0.5.tar.bz2
-sha1  f06f65bca31168c86bcebd7f92dbbda08817a5cc  xditview-1.0.5.tar.bz2
-sha256  eecb1ed51ab4edc7f454476d1248cfb7799a17c5679b3dd834e8b4658331c04b  xditview-1.0.5.tar.bz2
-sha512  e20c903f38394b496111267e142d84d11e69a3b89f91869652d1f2ee5c997a13f90bfa2966651b42cd3979a330b348a6e397cc6a74c45b1f3f91643e7c06765d  xditview-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003220.html
+sha256  517700df205d4fdf65db182698157c959f1e7c10597670a7f45b1fcb2319819f  xditview-1.0.6.tar.xz
+sha512  249769d27980e9a69ac8f056f329dfa514f3ab6267d6ed69814c5695f315d2a7021c560a0e26fdd2568290a071793d7f2eafdd92f9981ed556047deb244ebf5a  xditview-1.0.6.tar.xz
 # Locally computed
 sha256  023d879308a49249181f78bbb567e93c45138ad847fe969d191e4802e7a1a005  COPYING
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index 388710034c..8655bd3e92 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XDITVIEW_VERSION = 1.0.5
-XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.bz2
-XAPP_XDITVIEW_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDITVIEW_VERSION = 1.0.6
+XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.xz
+XAPP_XDITVIEW_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDITVIEW_LICENSE = MIT
 XAPP_XDITVIEW_LICENSE_FILES = COPYING
 XAPP_XDITVIEW_DEPENDENCIES = xlib_libXaw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
