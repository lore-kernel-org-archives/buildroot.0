Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C19DC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41948478C4;
	Mon, 20 Feb 2023 21:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41948478C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wadg63Pi-I4e; Mon, 20 Feb 2023 21:38:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A67A4AA84;
	Mon, 20 Feb 2023 21:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A67A4AA84
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27F1C1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20E8B415BD
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20E8B415BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eAVPuIxyyLtO for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E303415B3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E303415B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37B0186494; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8f15b22fdd55611f0a1b64cb8a430df3c6385e11
X-Git-Newrev: 1564c1e6e9e9e72daae419c1a839b986485eff5a
X-Patchwork-Hint: ignore
Message-Id: <20230220205157.37B0186494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xgamma:
 bump version to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=1564c1e6e9e9e72daae419c1a839b986485eff5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-December/003267.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xgamma/xapp_xgamma.hash | 5 +++--
 package/x11r7/xapp_xgamma/xapp_xgamma.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.hash b/package/x11r7/xapp_xgamma/xapp_xgamma.hash
index 0031450c4d..17efe0a975 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.hash
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002574.html
-sha256  0ef1c35b5c18b1b22317f455c8df13c0a471a8efad63c89c98ae3ce8c2b222d3  xgamma-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003267.html
+sha256  1c79dae85a8953a15f4fe5c2895a033307b43b8613456c87ec47b374b113bc8f  xgamma-1.0.7.tar.xz
+sha512  9eeee9b537dcae9e4d153774eb632a6a5e8dd32bebadc9bbd897a773e5b56f76848f32a1699b8c921d3094760c42b5083365d853b89ab31fd85c7a0d46feeceb  xgamma-1.0.7.tar.xz
 # Locally computed
 sha256  78d354d348feaaab8d67a220e84137ec24fece04af4dface2e67132c72e216a2  COPYING
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
index a73a29e5a2..f2e9e91efb 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XGAMMA_VERSION = 1.0.6
-XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.bz2
-XAPP_XGAMMA_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XGAMMA_VERSION = 1.0.7
+XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.xz
+XAPP_XGAMMA_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XGAMMA_LICENSE = MIT
 XAPP_XGAMMA_LICENSE_FILES = COPYING
 XAPP_XGAMMA_DEPENDENCIES = xlib_libXxf86vm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
