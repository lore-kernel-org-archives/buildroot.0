Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE309C4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 13:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 967E182FBE;
	Wed,  6 Dec 2023 13:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 967E182FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fIQWVX-LU31o; Wed,  6 Dec 2023 13:00:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBFA38316A;
	Wed,  6 Dec 2023 13:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBFA38316A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2C141BF34C
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 13:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC2488316A
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 13:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC2488316A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-YiX5tWDont for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 13:00:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26B34831B0
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 13:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26B34831B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1052087A1F; Wed,  6 Dec 2023 13:00:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Dec 2023 13:45:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 402c9fcb5ef1d6c2f9209bbe5853c6f6c48b503b
X-Git-Newrev: 0ee24b86d83001ac90f99bb2f1bcccb487c7e6aa
X-Patchwork-Hint: ignore
Message-Id: <20231206130009.1052087A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.118
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ee24b86d83001ac90f99bb2f1bcccb487c7e6aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-November/003433.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 73f3d29f5a..bcbcdccf30 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-October/003429.html
-sha256  a2888d69e3eb1c8a77adc08a75a60fbae01f0d208d26f034d1a12e362361242b  libdrm-2.4.117.tar.xz
-sha512  326cf565548fb9d50a321562c13acb2a2f5ad5915ffdc2b08ef812fbac887f5b3d271cb2ce8c483633edddf2c55064d55810ff6697f713c179e2d0c8048eb544  libdrm-2.4.117.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-November/003433.html
+sha256  a777bd85f2b5fc9c57f886c82058300578317cafdbc77d0a769d7e9a9567ab88  libdrm-2.4.118.tar.xz
+sha512  2740ec10dfe96b520345c3f6f0d99a30aac95b1f96656bd9cd11269c2a83a9dac423da29d74a3deb55360e3ae2ca4a1de283e1e443667bedd22673f6629c9920  libdrm-2.4.118.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index b9201e4bd3..0db0c51284 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.117
+LIBDRM_VERSION = 2.4.118
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
