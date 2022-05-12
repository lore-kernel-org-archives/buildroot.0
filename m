Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5507C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EDC182553;
	Thu, 12 May 2022 19:51:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHn-s-4Gl84V; Thu, 12 May 2022 19:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 816E182AF8;
	Thu, 12 May 2022 19:51:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DE2F1BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 173CC80E4F
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cD18L-7zQ63K for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6601A80C5E
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A5CB785C8A; Thu, 12 May 2022 19:41:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:49:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42bda53514e8d4f2277b08c328f5546d1745e756
X-Git-Newrev: 432714f8187b0ceabf9441cf173438b4f4bd3a8e
X-Patchwork-Hint: ignore
Message-Id: <20220512194100.A5CB785C8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_twm: bump version to
 1.0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=432714f8187b0ceabf9441cf173438b4f4bd3a8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003135.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_twm/xapp_twm.hash | 6 +++---
 package/x11r7/xapp_twm/xapp_twm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_twm/xapp_twm.hash b/package/x11r7/xapp_twm/xapp_twm.hash
index 26661f1fbd..75d89a9984 100644
--- a/package/x11r7/xapp_twm/xapp_twm.hash
+++ b/package/x11r7/xapp_twm/xapp_twm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-June/003047.html
-sha256  f4e8a842dec410e79741f25ed4dfac09df080835d0bba2e3983b5914569b68c7  twm-1.0.11.tar.xz
-sha512  948034bba23e6b6c4412fcd2e46bb11a9980297601218a54a5055165ab0229a44dde0d50f338b24e82d76f390597e2fa09d11ff7f3fe1b1d736b10083c7da20d  twm-1.0.11.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-April/003135.html
+sha256  aaf201d4de04c1bb11eed93de4bee0147217b7bdf61b7b761a56b2fdc276afe4  twm-1.0.12.tar.xz
+sha512  f3d68df7e06516f6b74f19181efcfd9db2479c8ea0c72c3a6ed0dc1b222405b40d81a2dea17b662955e0c1783e87d0d3eb067c3b6e7c6eed8c0d38d03d362260  twm-1.0.12.tar.xz
 # Locally computed
 sha256  4809ffc9656bc9a704e19ab467d1cedc97c48c9d1f9a4018e6d99d2e61f75945  COPYING
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index 46d4ca331d..b222830497 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_TWM_VERSION = 1.0.11
+XAPP_TWM_VERSION = 1.0.12
 XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.xz
 XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_TWM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
