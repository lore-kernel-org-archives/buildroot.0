Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3A7C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 07:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8F21409E3;
	Mon, 14 Nov 2022 07:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8F21409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FP7nPho3BsEg; Mon, 14 Nov 2022 07:25:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5A9A409D8;
	Mon, 14 Nov 2022 07:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5A9A409D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC5D81BF3A7
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4D62409D6
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4D62409D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CfD6CzzvxvHG for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 07:24:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF1EC409D8
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 07:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF1EC409D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD51D838DA; Mon, 14 Nov 2022 07:24:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 08:07:43 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 6bda05ca73c94e435f0638d5552ce74e6c428542
X-Git-Newrev: dea1804c6ac8f43463cb897240e2a8fc22991178
X-Patchwork-Hint: ignore
Message-Id: <20221114072433.BD51D838DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/pixman: security
 bump version to 0.42.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=dea1804c6ac8f43463cb897240e2a8fc22991178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Release notes:
https://lists.x.org/archives/xorg-announce/2022-October/003228.html
https://lists.x.org/archives/xorg-announce/2022-November/003249.html

Fixes CVE-2022-44638:
https://lists.x.org/archives/xorg-announce/2022-November/003251.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0ceeb39303267400d6335e3c687ce1f73d9e6dcc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pixman/pixman.hash | 6 +++---
 package/pixman/pixman.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
index 1af632a9f4..78407bf048 100644
--- a/package/pixman/pixman.hash
+++ b/package/pixman/pixman.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2020-April/003043.html
-sha256  da8ed9fe2d1c5ef8ce5d1207992db959226bd4e37e3f88acf908fd9a71e2704e  pixman-0.40.0.tar.xz
-sha512  8a60edb113d68791b41bd90b761ff7b3934260cb3dada3234c9351416f61394e4157353bc4d61b8f6c2c619de470f6feefffb4935bfcf79d291ece6285de7270  pixman-0.40.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-October/003228.html
+sha256  5747d2ec498ad0f1594878cc897ef5eb6c29e91c53b899f7f71b506785fc1376  pixman-0.42.2.tar.xz
+sha512  3476e2676e66756b1af61b1e532cd80c985c191fb7956eb01702b419726cce99e79163b7f287f74f66414680e7396d13c3fee525cd663f12b6ac4877070ff4e8  pixman-0.42.2.tar.xz
 
 # Locally computed
 sha256  fac9270f0987b96ff4533fca3548c633e02083cbba4a0172a3b149b2e4019793  COPYING
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 64302fa49a..5affd47a3f 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.40.0
+PIXMAN_VERSION = 0.42.2
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.xz
 PIXMAN_SITE = https://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
