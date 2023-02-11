Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090D5C636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 22:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F78D81EA2;
	Sat, 11 Feb 2023 22:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F78D81EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ncIj-kbpbsbm; Sat, 11 Feb 2023 22:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7B6681EFA;
	Sat, 11 Feb 2023 22:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7B6681EFA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBB571BF853
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 22:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAC5B41675
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 22:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAC5B41675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6zOK03mB5gTn for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 22:21:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4D5941550
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 22:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4D5941550
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EB3A854C7; Sat, 11 Feb 2023 22:21:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 23:18:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b9bea584c2f2c14122395eba7cdbf325ed7256c
X-Git-Newrev: 5e1fdd144300106704e21176673e465163245669
X-Patchwork-Hint: ignore
Message-Id: <20230211222114.8EB3A854C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.115
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e1fdd144300106704e21176673e465163245669
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-February/003323.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 387beadc3f..87cc170617 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003250.html
-sha256  3049cf843a47d12e5eeefbc3be3496d782fa09f42346bf0b7defe3d1e598d026  libdrm-2.4.114.tar.xz
-sha512  8dcd4be5674e3ea2ab4394fa8f461914e5aa7f4f57a2f448c5216d84ee6682e16b45eafabf97b7d9f5c062183d9a6bf3f0c97499d4cb01c19807a51209a0f644  libdrm-2.4.114.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-February/003323.html
+sha256  554cfbfe0542bddb391b4e3e05bfbbfc3e282b955bd56218d21c0616481f65eb  libdrm-2.4.115.tar.xz
+sha512  0c38d3cfd76f627b899f052527c2939d5fc87a417422dceb0761839ba21e69736703a87ba170b5ba7a4aca2506a240760c8c97ca1781a7fb78468225295293bd  libdrm-2.4.115.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 56366b6c48..52ac13b7d0 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.114
+LIBDRM_VERSION = 2.4.115
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
