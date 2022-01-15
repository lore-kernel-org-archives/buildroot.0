Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B83C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0866860BE9;
	Sat, 15 Jan 2022 11:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEV1fluBJp39; Sat, 15 Jan 2022 11:03:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A60860BCD;
	Sat, 15 Jan 2022 11:03:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3217A1BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D6A560A8F
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IGNh3TZZ-SK for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02F50605E8
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:01:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 18F7882911; Sat, 15 Jan 2022 10:55:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:54:02 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: daa07be55df578ba78994aba964e8f6f91ccae23
X-Git-Newrev: dccdddf13ac2106c65ebbfd6e211581e13578517
X-Patchwork-Hint: ignore
Message-Id: <20220115105522.18F7882911@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/x11r7/xapp_xauth:
 bump version to 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=dccdddf13ac2106c65ebbfd6e211581e13578517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Removed md5 and sha1 license hashes.

Release notes:
https://lists.x.org/archives/xorg-announce/2021-November/003118.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 01414cc093d9e791b15caff37dd426623068883c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
