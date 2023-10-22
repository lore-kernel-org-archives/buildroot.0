Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A66C0032E
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 14:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3225970A87;
	Sun, 22 Oct 2023 14:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3225970A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LdsfgeiZ2LUv; Sun, 22 Oct 2023 14:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7619E70A84;
	Sun, 22 Oct 2023 14:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7619E70A84
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2325D1BF298
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 14:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 086EE4172A
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 14:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 086EE4172A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4iJFnBYr5z2n for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 14:27:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0999540382
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 14:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0999540382
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA0D385DBB; Sun, 22 Oct 2023 14:27:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Oct 2023 16:26:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 274ca1732f95576ae72811dc904aab2604a8e1cc
X-Git-Newrev: 07aa4dcbfac43defc395d1ff9138a72f07ab4441
X-Patchwork-Hint: ignore
Message-Id: <20231022142727.DA0D385DBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.117
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

commit: https://git.buildroot.net/buildroot/commit/?id=07aa4dcbfac43defc395d1ff9138a72f07ab4441
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-October/003429.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 32b39d6a1b..73f3d29f5a 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-August/003416.html
-sha256  46c53f40735ea3d26d614297f155f6131a510624a24274f654f6469ca905339a  libdrm-2.4.116.tar.xz
-sha512  1287d1896deeb8cfb4532c6750eb43493dcefbfaaa598a73bbb682aa749594eaad3ed1fa2fe73d06280350f365a92a0c20cad8be76f3da2ed59b04aa008de911  libdrm-2.4.116.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-October/003429.html
+sha256  a2888d69e3eb1c8a77adc08a75a60fbae01f0d208d26f034d1a12e362361242b  libdrm-2.4.117.tar.xz
+sha512  326cf565548fb9d50a321562c13acb2a2f5ad5915ffdc2b08ef812fbac887f5b3d271cb2ce8c483633edddf2c55064d55810ff6697f713c179e2d0c8048eb544  libdrm-2.4.117.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 70f449037d..b9201e4bd3 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.116
+LIBDRM_VERSION = 2.4.117
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
