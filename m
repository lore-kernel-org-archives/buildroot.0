Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02075C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A093E4EBAB;
	Mon, 20 Feb 2023 21:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A093E4EBAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G52-9h66LST7; Mon, 20 Feb 2023 21:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69F534E95A;
	Mon, 20 Feb 2023 21:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F534E95A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C0311BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FE80415BE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FE80415BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ztB6pFRT5-kC for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAA0F415C2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAA0F415C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A738586495; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:35:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dd1c370ad7567fc38732d28cb52d66bc5dbb22fc
X-Git-Newrev: ef8faec32df85cf6172a9e26f68d6c6f704265e2
X-Patchwork-Hint: ignore
Message-Id: <20230220205158.A738586495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xgc: bump
 version to 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef8faec32df85cf6172a9e26f68d6c6f704265e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-October/003221.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xgc/xapp_xgc.hash | 5 +++--
 package/x11r7/xapp_xgc/xapp_xgc.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xgc/xapp_xgc.hash b/package/x11r7/xapp_xgc/xapp_xgc.hash
index 50e1362b64..7664e31186 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.hash
+++ b/package/x11r7/xapp_xgc/xapp_xgc.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002575.html
-sha256  14828d9bda358ad57efc0206bc416ee33ba542091edb186485cca5389adc2f5e  xgc-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003221.html
+sha256  7b87bbdbce4ec858738a3b81b8a3943aff01036001e2a1d00bb5384392a8b240  xgc-1.0.6.tar.xz
+sha512  f449b9b2d313aeba1fe9bf33fef90291776403f1fdf4afc507c4b973045c97fc8ded65ddec4f8c58727e7e4c7c4ad6a65ae79581eb4bdfe9c79a5f909dbc0a1f  xgc-1.0.6.tar.xz
 # Locally computed
 sha256  13ebeb3e59e406064d46e94a707ed5ec5d8d2bf840971265dd46db0850d22d02  COPYING
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index 41d42c461e..fc055f57dd 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XGC_VERSION = 1.0.5
-XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.bz2
-XAPP_XGC_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XGC_VERSION = 1.0.6
+XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.xz
+XAPP_XGC_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XGC_LICENSE = MIT
 XAPP_XGC_LICENSE_FILES = COPYING
 XAPP_XGC_DEPENDENCIES = xlib_libXaw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
