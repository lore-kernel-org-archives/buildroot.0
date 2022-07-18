Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A214BC43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 12:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 348DC83E19;
	Mon, 18 Jul 2022 12:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 348DC83E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDMxSxnyi07M; Mon, 18 Jul 2022 12:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A9383E15;
	Mon, 18 Jul 2022 12:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37A9383E15
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 407961BF97C
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 12:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B9E181AAD
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 12:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B9E181AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7GF4KqJLT-eN for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 12:55:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B21D81A5F
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 12:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B21D81A5F
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DF9D583CBB; Mon, 18 Jul 2022 12:41:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 14:25:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bea626fbec2a09527498b9beb854a26e286592b4
X-Git-Newrev: 958c52bd7052bacd21c6efa96e59cd07576a6370
X-Patchwork-Hint: ignore
Message-Id: <20220718124159.DF9D583CBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stellarium: bump version to 0.22.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=958c52bd7052bacd21c6efa96e59cd07576a6370
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
http://stellarium.org/release/2022/07/07/stellarium-0.22.2.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stellarium/stellarium.hash | 4 ++--
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index c742df464f..f33dd385ca 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,5 +1,5 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha1  55b5915dfb616b9748e1c2d2de6150f7159cf36c  stellarium-0.22.1.tar.gz
-sha256  61a595ecc345dcc7517359573d0dc772e67ecaf6d52fefab142a77c92cf3fa24  stellarium-0.22.1.tar.gz
+sha1  3661b4e8a94e7a520873fa22ddc79f39904eb1c4  stellarium-0.22.2.tar.gz
+sha256  31e965d32cafc0fbad212c7ef4efbeac988f909206013554e1fe35123ebb9376  stellarium-0.22.2.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 9c24263a43..769e7049c1 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.22.1
+STELLARIUM_VERSION = 0.22.2
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
