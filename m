Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C99C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EE3E4ED0C;
	Mon, 20 Feb 2023 21:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EE3E4ED0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a7PNoHA7q6CH; Mon, 20 Feb 2023 21:56:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCDB24ED00;
	Mon, 20 Feb 2023 21:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCDB24ED00
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BB5E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6ED461107
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6ED461107
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JPVIJc7Y_G7T for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1056610E7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1056610E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8AB086494; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 671c130b0cc0eee99665554e52af7fad5f99500e
X-Git-Newrev: 5ded7c84b569bc9b9e8bbbb23c768302098c8cfc
X-Patchwork-Hint: ignore
Message-Id: <20230220205157.D8AB086494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_sessreg:
 bump version to 1.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ded7c84b569bc9b9e8bbbb23c768302098c8cfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-October/003246.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_sessreg/xapp_sessreg.hash | 8 +++-----
 package/x11r7/xapp_sessreg/xapp_sessreg.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.hash b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
index b8f55b50c5..1f1b54b877 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.hash
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-June/002994.html
-md5  92be564d4be7d8aa7b5024057b715210  sessreg-1.1.2.tar.bz2
-sha1  169c1ff9fb152b4b4ca0cfbd3e1aee33af042016  sessreg-1.1.2.tar.bz2
-sha256  dfcb9e954273ace63879aec053c7880466f8755752a35aa9ced3fa5f04fd2c33  sessreg-1.1.2.tar.bz2
-sha512  7e3c2bdcadb7133aace463b58d8c6108d315ec95d2a42509073eeddc7f02644092a4b3168bd3b426c041736a016291092e0bf8368acd620dbeff96d53d12f98c  sessreg-1.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003246.html
+sha256  022acd5de8077dddc4f919961f79e102ecd5f3228a333681af5cd0e7344facc2  sessreg-1.1.3.tar.xz
+sha512  bc1e83afc598ac5b4c6ab0861799b6c8727c123ee662c1fb9cbdd9ee926973b7a00cc62e32f6b4e462c0da3516f8b824337d9cf17587ebabd3f4753502641a60  sessreg-1.1.3.tar.xz
 # Locally computed
 sha256  ac8f5cc696e6c473aea4caaf18650316dc8912fcf0f370cae1df5f395cea8631  COPYING
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index 7f488e2423..b196bb947e 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_SESSREG_VERSION = 1.1.2
-XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.bz2
+XAPP_SESSREG_VERSION = 1.1.3
+XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.xz
 XAPP_SESSREG_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SESSREG_LICENSE = MIT
 XAPP_SESSREG_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
