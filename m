Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBC9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15D9F4298D;
	Sun, 12 Dec 2021 15:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFy7uJboFtNI; Sun, 12 Dec 2021 15:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 578BF426C3;
	Sun, 12 Dec 2021 15:54:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3408C1BF97A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FB2F81991
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R75ybK_o_6-y for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:53:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B13681971
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:53:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 240BC8353F; Sun, 12 Dec 2021 15:48:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 16:51:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77e208730e7c666a463c967387220a2be93f3b7f
X-Git-Newrev: 01414cc093d9e791b15caff37dd426623068883c
X-Patchwork-Hint: ignore
Message-Id: <20211212154839.240BC8353F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xauth: bump version to
 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=01414cc093d9e791b15caff37dd426623068883c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed md5 and sha1 license hashes.

Release notes:
https://lists.x.org/archives/xorg-announce/2021-November/003118.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xauth/xapp_xauth.hash | 9 ++++-----
 package/x11r7/xapp_xauth/xapp_xauth.mk   | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xauth/xapp_xauth.hash b/package/x11r7/xapp_xauth/xapp_xauth.hash
index 0251c083a7..22ea4cadfd 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.hash
+++ b/package/x11r7/xapp_xauth/xapp_xauth.hash
@@ -1,7 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003005.html
-md5 e50587c1bb832aafd1a19d91a0890a0b  xauth-1.1.tar.bz2
-sha1 16180e36d75a23cb182cb91e78f24273f1a63967  xauth-1.1.tar.bz2
-sha256 6d1dd1b79dd185107c5b0fdd22d1d791ad749ad6e288d0cdf80964c4ffa7530c  xauth-1.1.tar.bz2
-sha512 b6ecd59a853a491ef45bf8cfbff63bed36645f81cb79ae9d18458b57f7502bccf92f0d979d3337578518646f680ad379e67b1dac15a927cbb11372733e7a3a0c  xauth-1.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-November/003118.html
+sha256  164ea0a29137b284a47b886ef2affcb0a74733bf3aad04f9b106b1a6c82ebd92  xauth-1.1.1.tar.bz2
+sha512  998c3158378fff50d368959c29335173b8d98e02591cb3d7b2f9534b5a44b19deb4cb7da9bf291ca5a37f69f833d72839b2c6611723306d10c1b4968ae4d4120  xauth-1.1.1.tar.bz2
+
 # Locally computed
 sha256 dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5  COPYING
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index cd900f0055..64b064d3bd 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XAUTH_VERSION = 1.1
+XAPP_XAUTH_VERSION = 1.1.1
 XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
 XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XAUTH_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
