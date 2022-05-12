Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCFAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA86A40339;
	Thu, 12 May 2022 19:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15KFN72Uddau; Thu, 12 May 2022 19:54:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4BE240359;
	Thu, 12 May 2022 19:54:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72FA11BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABB0682553
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T-8XekwC_W7T for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1400080D9D
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 573B285C90; Thu, 12 May 2022 19:41:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:50:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23e6fba6c1eb195aa9cdb4e97075a8bbdf4bb3d7
X-Git-Newrev: 720c3b3cac5f2c44afdc8c07ba4b4c131b1d9a85
X-Patchwork-Hint: ignore
Message-Id: <20220512194101.573B285C90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xauth: bump version to
 1.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=720c3b3cac5f2c44afdc8c07ba4b4c131b1d9a85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003158.html

Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xauth/xapp_xauth.hash | 7 +++----
 package/x11r7/xapp_xauth/xapp_xauth.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xauth/xapp_xauth.hash b/package/x11r7/xapp_xauth/xapp_xauth.hash
index 22ea4cadfd..e66c1a67b1 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.hash
+++ b/package/x11r7/xapp_xauth/xapp_xauth.hash
@@ -1,6 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-November/003118.html
-sha256  164ea0a29137b284a47b886ef2affcb0a74733bf3aad04f9b106b1a6c82ebd92  xauth-1.1.1.tar.bz2
-sha512  998c3158378fff50d368959c29335173b8d98e02591cb3d7b2f9534b5a44b19deb4cb7da9bf291ca5a37f69f833d72839b2c6611723306d10c1b4968ae4d4120  xauth-1.1.1.tar.bz2
-
+# From https://lists.x.org/archives/xorg-announce/2022-April/003158.html
+sha256  78ba6afd19536ced1dddb3276cba6e9555a211b468a06f95f6a97c62ff8ee200  xauth-1.1.2.tar.xz
+sha512  ac23fcd166b45abf7b030994ff3332c9906023dc1ddfa9b9d3000e6a914dc5e0213c4a2aa409cb3ddb93e1f9f4f6374376109241a95ef8c36af842de1f6f76e8  xauth-1.1.2.tar.xz
 # Locally computed
 sha256 dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5  COPYING
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index 64b064d3bd..248a66e3a0 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XAUTH_VERSION = 1.1.1
-XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
+XAPP_XAUTH_VERSION = 1.1.2
+XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.xz
 XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XAUTH_LICENSE = MIT
 XAPP_XAUTH_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
