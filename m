Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B7FEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 13:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3045860EF6;
	Mon, 17 Jul 2023 13:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3045860EF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U2UY9Vyvg_BL; Mon, 17 Jul 2023 13:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09D9560F29;
	Mon, 17 Jul 2023 13:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09D9560F29
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39B351BF2BD
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 13:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5489681DEA
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 13:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5489681DEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_VfN521DRXc for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 13:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65C5A819F5
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 13:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65C5A819F5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50555872EE; Mon, 17 Jul 2023 13:17:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 15:07:39 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 8b26a893f567422d56de9ac4edf7310ddb6d8954
X-Git-Newrev: e90f7de85644aa81069c79d8a1d9bbcdd7e1d18f
X-Patchwork-Hint: ignore
Message-Id: <20230717131709.50555872EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/wine: bump to
 version 8.0.1
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
Content-Type: multipart/mixed; boundary="===============0924869924481396245=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0924869924481396245==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e90f7de85644aa81069c79d8a1d9bbcdd7e1d18f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: André Zwing <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e97efdeef9a5a61cbd3c246aa605a88c5dfaf905)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index b87964da12..58261d3b18 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  0272c20938f8721ae4510afaa8b36037457dd57661e4d664231079b9e91c792e  wine-8.0.tar.xz
+sha256  22035f3836b4f9c3b1940ad90f9b9e3c1be09234236d2a80d893180535c75b7d  wine-8.0.1.tar.xz
 # Locally calculated
 sha256  e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c  COPYING.LIB
 sha256  793d045546467c8f49e35fbd6e02859e57e78f8bb53571e8200bffd0e966dfa8  LICENSE
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index a629bf0dd6..ccaeadff5e 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 8.0
+WINE_VERSION = 8.0.1
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
 WINE_SITE = https://dl.winehq.org/wine/source/8.0
 WINE_LICENSE = LGPL-2.1+

--===============0924869924481396245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0924869924481396245==--
