Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E49ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5370D40297;
	Sat, 17 Sep 2022 20:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5370D40297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-VhhfL5dOS1; Sat, 17 Sep 2022 20:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A14F4011F;
	Sat, 17 Sep 2022 20:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A14F4011F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD0381BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79BDD41842
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79BDD41842
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwzBQAxCMSMU for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:37:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A07C41838
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A07C41838
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B82A846CF; Sat, 17 Sep 2022 20:37:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 22:35:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c25b4454881c8cd49ea725fed44db00d12fd1811
X-Git-Newrev: 5d87139f69e0b1a05ee5307c77c3f830c99fac19
X-Patchwork-Hint: ignore
Message-Id: <20220917203729.2B82A846CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2_image: bump version to 2.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d87139f69e0b1a05ee5307c77c3f830c99fac19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file has moved from COPYING.txt from LICENSE.txt, but the
license conditions remain the same.

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2_image/sdl2_image.hash | 6 +++---
 package/sdl2_image/sdl2_image.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index 6572ee8d54..e1efa4debe 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,3 +1,3 @@
-# Locally calculated
-sha256  bdd5f6e026682f7d7e1be0b6051b209da2f402a2dd8bd1c4bd9c25ad263108d0  SDL2_image-2.0.5.tar.gz
-sha256  45079362e2230154205413a6940544ca94e3479ccf76205c71c4f542a6815d25  COPYING.txt
+# Locally calculated after checking https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.6.2.tar.gz.sig
+sha256  48355fb4d8d00bac639cd1c4f4a7661c4afef2c212af60b340e06b7059814777  SDL2_image-2.6.2.tar.gz
+sha256  28aabfed22b3cb0b7e23ef40385e4f66297c960082f029c96d073cc1d4e008d5  LICENSE.txt
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index 13de7b1268..953742de28 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.0.5
+SDL2_IMAGE_VERSION = 2.6.2
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
 SDL2_IMAGE_LICENSE = Zlib
-SDL2_IMAGE_LICENSE_FILES = COPYING.txt
+SDL2_IMAGE_LICENSE_FILES = LICENSE.txt
 SDL2_IMAGE_CPE_ID_VENDOR = libsdl
 SDL2_IMAGE_CPE_ID_PRODUCT = sdl_image
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
