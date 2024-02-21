Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2C3C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 17:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 274EB6085F;
	Wed, 21 Feb 2024 17:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmMa4jFbVCdx; Wed, 21 Feb 2024 17:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BF8560ED6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BF8560ED6;
	Wed, 21 Feb 2024 17:58:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D9141BF2FD
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0892560ED6
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TUYZlTEF42Vo for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 17:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 502F86085F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 502F86085F
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 17:57:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45C8387A16; Wed, 21 Feb 2024 17:57:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 18:57:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b2bea40abd1d6092f5fd7d201ad1580e7f629d4
X-Git-Newrev: 1c32cdd545767337616f94d076212c6273e59f44
X-Patchwork-Hint: ignore
Message-Id: <20240221175758.45C8387A16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libstrophe: bump to version 0.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c32cdd545767337616f94d076212c6273e59f44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libstrophe/libstrophe.hash | 2 +-
 package/libstrophe/libstrophe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index e284e8cca6..ec5a55985a 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8d7c17c694efff7d2e2d3632684537e7ba874ce3d7f0e750a539f2299021bbaa  libstrophe-0.13.0.tar.xz
+sha256  86c0abd348ae66feb40b6886f2c7f04525f1d5b20a48c10d4db4ed532dc63f22  libstrophe-0.13.1.tar.xz
 sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index 257593bbec..42d582fe9c 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.13.0
+LIBSTROPHE_VERSION = 0.13.1
 LIBSTROPHE_SOURCE = libstrophe-$(LIBSTROPHE_VERSION).tar.xz
 LIBSTROPHE_SITE = https://github.com/strophe/libstrophe/releases/download/$(LIBSTROPHE_VERSION)
 LIBSTROPHE_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
