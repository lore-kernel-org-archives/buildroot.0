Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1042C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 07:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 552B440C23;
	Sat,  1 Oct 2022 07:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 552B440C23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFszOsH-itLz; Sat,  1 Oct 2022 07:49:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AA5340C0E;
	Sat,  1 Oct 2022 07:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AA5340C0E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEDAF1BF488
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 07:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA7AA60E5B
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 07:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA7AA60E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-oR9OlTWx1X for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 07:49:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B18C60B55
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 07:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B18C60B55
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55B1D847A4; Sat,  1 Oct 2022 07:49:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 1 Oct 2022 09:48:31 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: d2f3ab0e5ddc4478333f0654f7340f8c69c329ea
X-Git-Newrev: 3b1cef1c0b6a6b1b2da0892bb8469d12cc403ee1
X-Patchwork-Hint: ignore
Message-Id: <20221001074902.55B1D847A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/graphicsmagick:
 bump to version 1.3.38
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b1cef1c0b6a6b1b2da0892bb8469d12cc403ee1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

License file hash is changed, due to a copyright year change:

-  Copyright (C) 2002-2021 GraphicsMagick Group
+  Copyright (C) 2002-2022 GraphicsMagick Group

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f27ea50528755b5f353e3db124dee535645dcf09)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/graphicsmagick/graphicsmagick.hash | 4 ++--
 package/graphicsmagick/graphicsmagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/graphicsmagick/graphicsmagick.hash b/package/graphicsmagick/graphicsmagick.hash
index cf6d224216..80130da5d6 100644
--- a/package/graphicsmagick/graphicsmagick.hash
+++ b/package/graphicsmagick/graphicsmagick.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  90dc22f1a7bd240e4c9065a940962bf13da43c99bcc36cb111cc3c1a0d7477d4  GraphicsMagick-1.3.37.tar.xz
-sha256  8a4d960c5a3e453ee21e459e1794c7a0c85559825d3363a8d3b510b3344fdad4  Copyright.txt
+sha256  d60cd9db59351d2b9cb19beb443170acaa28f073d13d258f67b3627635e32675  GraphicsMagick-1.3.38.tar.xz
+sha256  0a20e661de942ebe115a354d0ec6d1d42b93856ea765f813f350a5ce5024cdb7  Copyright.txt
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 38743487eb..dbaa8ddf70 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRAPHICSMAGICK_VERSION = 1.3.37
+GRAPHICSMAGICK_VERSION = 1.3.38
 GRAPHICSMAGICK_SOURCE = GraphicsMagick-$(GRAPHICSMAGICK_VERSION).tar.xz
 GRAPHICSMAGICK_SITE = https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$(GRAPHICSMAGICK_VERSION)
 GRAPHICSMAGICK_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
