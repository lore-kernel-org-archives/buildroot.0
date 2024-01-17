Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D224C47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 13:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D45E4010F;
	Wed, 17 Jan 2024 13:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D45E4010F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HdzgIp0V-9hA; Wed, 17 Jan 2024 13:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC7BC40144;
	Wed, 17 Jan 2024 13:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC7BC40144
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CB9C1BF3FF
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 13:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81D1B414C6
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 13:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81D1B414C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39fq5EE_u6fx for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 13:13:13 +0000 (UTC)
X-Greylist: delayed 464 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 17 Jan 2024 13:13:13 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 058634097D
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 058634097D
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 13:13:12 +0000 (UTC)
Received: from andi-ThinkPad-P52.fritz.box
 (ipb21bd56e.dynamic.kabel-deutschland.de [178.27.213.110])
 by dd5108.kasserver.com (Postfix) with ESMTPA id E48155241FE7;
 Wed, 17 Jan 2024 14:05:24 +0100 (CET)
From: Andreas Naumann <anaumann@ultratronik.de>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 14:05:22 +0100
Message-Id: <20240117130522.628211-1-anaumann@ultratronik.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spamd-Bar: +++++
Subject: [Buildroot] [PATCH 1/1] package/libevdev: bump to version 1.13.1
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
Cc: Andreas Naumann <anaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/libevdev/libevdev.hash | 6 +++---
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index dd76e158ef..acaedfad56 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/input-tools/2022-March/001574.html
-sha256  1dbba41bc516d3ca7abc0da5b862efe3ea8a7018fa6e9b97ce9d39401b22426c  libevdev-1.12.1.tar.xz
-sha512  eefce287a665e4f89eb2e0437dfefd45ecf8925c7dac35a1bdd46158541f77f2032c6146900a30a01321751d55a9b537bd1d61777cca9cfa02c39a6e31c97be4  libevdev-1.12.1.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2023-May/001585.html
+sha256  06a77bf2ac5c993305882bc1641017f5bec1592d6d1b64787bad492ab34f2f36  libevdev-1.13.1.tar.xz
+sha512  9b75bad4bc13948854c8dff7a7a46aca6c06d1410ccb000f881bf76055ccac040595c3b24fb1a574be875b5c262eb86820b9ec3383752641bc2047135e5a412f  libevdev-1.13.1.tar.xz
 
 # Hash for license files:
 sha256  6f13de7ce28e4948ba95170e0723ee1254c1978ce1f127af82aeca597b567cb9  COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 726a5afcee..b0cf6c9ba8 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.12.1
+LIBEVDEV_VERSION = 1.13.1
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
