Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAC2C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 12:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CAD141682;
	Sun, 30 Jul 2023 12:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CAD141682
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4ZswZmOGf4x; Sun, 30 Jul 2023 12:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D2E41681;
	Sun, 30 Jul 2023 12:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1D2E41681
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62DB51BF419
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 12:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4891D4160B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 12:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4891D4160B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DdaqhFZNS6KH for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 12:41:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 376C2415FD
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 12:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 376C2415FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C23283C66; Sun, 30 Jul 2023 12:41:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 14:40:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38b8f6aa050bcb5a8e2facdd0d053f1553bfe702
X-Git-Newrev: 7b9f5e15305e38bbdc211e807bff1a44d0732110
X-Patchwork-Hint: ignore
Message-Id: <20230730124111.1C23283C66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wine: bump to version 8.0.2
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
Content-Type: multipart/mixed; boundary="===============8006129663802532236=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8006129663802532236==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7b9f5e15305e38bbdc211e807bff1a44d0732110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: André Zwing <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 58261d3b18..756859c844 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  22035f3836b4f9c3b1940ad90f9b9e3c1be09234236d2a80d893180535c75b7d  wine-8.0.1.tar.xz
+sha256  6ec8fb6f2c72d576cb11f52b2f8d59af64404802154651d122b98466d91dc847  wine-8.0.2.tar.xz
 # Locally calculated
 sha256  e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c  COPYING.LIB
 sha256  793d045546467c8f49e35fbd6e02859e57e78f8bb53571e8200bffd0e966dfa8  LICENSE
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index ccaeadff5e..f47922dc70 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 8.0.1
+WINE_VERSION = 8.0.2
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
 WINE_SITE = https://dl.winehq.org/wine/source/8.0
 WINE_LICENSE = LGPL-2.1+

--===============8006129663802532236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8006129663802532236==--
