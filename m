Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDDACD343F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED74760674;
	Tue,  3 Sep 2024 21:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vDLGlSAm20z; Tue,  3 Sep 2024 21:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 022BF606F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 022BF606F7;
	Tue,  3 Sep 2024 21:39:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E8201BF421
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C97E606F7
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8khOhV5hyQu for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B025A60674
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B025A60674
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:39:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9994986D69; Tue,  3 Sep 2024 21:39:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:38:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 41132c0541b0d69e88f9f720cac166e304d7b64d
X-Git-Newrev: 9ce0861a58582fa1dfbc31277d163e023028e8d9
X-Patchwork-Hint: ignore
Message-Id: <20240903213943.9994986D69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rpi-rgb-led-matrix:
 update to latest commit
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
Content-Type: multipart/mixed; boundary="===============3058472195258393663=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3058472195258393663==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9ce0861a58582fa1dfbc31277d163e023028e8d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The rpi-rgb-led-matrix project doesn't have tagged releases, so this
patch updates the package to the latest commit on the master branch.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
[yann.morin.1998@free.fr: drop comment at end of _VERSION line]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash | 2 +-
 package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash
index 265e4c4249..ee6c50dee0 100644
--- a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash
+++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  490ca6fa0c81451f2472b4aa85796a876790f2e212bf0882e3bb7caf5c47e2c3  rpi-rgb-led-matrix-a56338db0f003d5236f2ce98c73a591d64a70852.tar.gz
+sha256  9a6da5b0ad730883a5fa18afc59b1297b4b05eb581c2c14ae50a3583296a4bed  rpi-rgb-led-matrix-f55736f7595bc028451658996eedea9742688bbc.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
index 499fb408c2..c0b2e61c79 100644
--- a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
+++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_RGB_LED_MATRIX_VERSION = a56338db0f003d5236f2ce98c73a591d64a70852
+RPI_RGB_LED_MATRIX_VERSION = f55736f7595bc028451658996eedea9742688bbc
 RPI_RGB_LED_MATRIX_SITE = $(call github,hzeller,rpi-rgb-led-matrix,$(RPI_RGB_LED_MATRIX_VERSION))
 RPI_RGB_LED_MATRIX_LICENSE = GPL-2.0
 RPI_RGB_LED_MATRIX_LICENSE_FILES = COPYING

--===============3058472195258393663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3058472195258393663==--
