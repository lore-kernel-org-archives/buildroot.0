Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0837C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 05:22:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69F0161183
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 05:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69F0161183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4559460711;
	Tue, 21 Sep 2021 05:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cd-gijeVvNKJ; Tue, 21 Sep 2021 05:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0DD660B20;
	Tue, 21 Sep 2021 05:22:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09CAB1BF285
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 05:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2A40404F1
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 05:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLWb7LOVqSC0 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 05:20:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E6FC404EE
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 05:20:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 960C98B8A5; Tue, 21 Sep 2021 05:18:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 21:09:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da8f069d745de73fb5810c21b2896ff173fa6090
X-Git-Newrev: 743517d4c8b3d73eacf4c67c2313705f4a647cd4
X-Patchwork-Hint: ignore
Message-Id: <20210921051847.960C98B8A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kismet: bump to version 2021-08-R1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=743517d4c8b3d73eacf4c67c2313705f4a647cd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://www.kismetwireless.net/release/kismet-2021-08-R1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-nrf_51822.h-fix-build-on-sparc.patch      | 59 ----------------------
 package/kismet/kismet.hash                         |  2 +-
 package/kismet/kismet.mk                           |  2 +-
 3 files changed, 2 insertions(+), 61 deletions(-)

diff --git a/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch b/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch
deleted file mode 100644
index c675654721..0000000000
--- a/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From b347fea1a5ba0f66bf15e7de56d748e0f0dd624a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 20 Jul 2021 22:27:45 +0200
-Subject: [PATCH] nrf_51822.h: fix build on sparc
-
-apple is not the only target that miss some defines, for example build
-fails on sparc with:
-
-capture_nrf_51822.c: In function 'get_baud':
-capture_nrf_51822.c:80:16: error: 'B2500000' undeclared (first use in this function); did you mean 'B2000000'?
-   80 |         return B2500000;
-      |                ^~~~~~~~
-      |                B2000000
-capture_nrf_51822.c:80:16: note: each undeclared identifier is reported only once for each function it appears in
-capture_nrf_51822.c:82:16: error: 'B3000000' undeclared (first use in this function); did you mean 'B2000000'?
-   82 |         return B3000000;
-      |                ^~~~~~~~
-      |                B2000000
-capture_nrf_51822.c:84:16: error: 'B3500000' undeclared (first use in this function); did you mean 'B500000'?
-   84 |         return B3500000;
-      |                ^~~~~~~~
-      |                B500000
-capture_nrf_51822.c:86:16: error: 'B4000000' undeclared (first use in this function); did you mean 'B2000000'?
-   86 |         return B4000000;
-      |                ^~~~~~~~
-      |                B2000000
-
-Fixes:
- - http://autobuild.buildroot.org/results/38f20816a654894c0625f00b1360c92fdc251e8b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/kismetwireless/kismet/pull/388]
----
- capture_nrf_51822/nrf_51822.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/capture_nrf_51822/nrf_51822.h b/capture_nrf_51822/nrf_51822.h
-index cf7fee1e..d9203f61 100644
---- a/capture_nrf_51822/nrf_51822.h
-+++ b/capture_nrf_51822/nrf_51822.h
-@@ -3,7 +3,6 @@
- #ifndef __NRF51822_H__
- #define __NRF51822_H__
- 
--#ifdef __APPLE__
- #ifndef B9600
- #define B9600 9600
- #endif
-@@ -58,7 +57,6 @@
- #ifndef B4000000
- #define B4000000 4000000
- #endif
--#endif
- 
- 
- 
--- 
-2.30.2
-
diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index 4c986a159b..9a9d2260b9 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f85939c9d32fa72d777db35c68af84c379171b94380acad0db7924f95a81bdaa  kismet-2021-06-R1.tar.xz
+sha256  1c8e31b1babdb0fc93ac38fd0772a24d4b40f865fbc292fa8ec7f4a18ced0135  kismet-2021-08-R1.tar.xz
 sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 64f9501db8..819ed510d7 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2021-06-R1
+KISMET_VERSION = 2021-08-R1
 KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
