Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891ACC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FB8940197;
	Mon, 27 Dec 2021 21:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yo3QpuxKOlh6; Mon, 27 Dec 2021 21:22:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B85340190;
	Mon, 27 Dec 2021 21:22:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AF671BF35D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 251764014E
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KO9-j35ONSia for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:21:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41D48401A3
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5F25282BAD; Mon, 27 Dec 2021 21:15:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 22:19:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53dc91b8f259434e87e7bade653f4af16043f69c
X-Git-Newrev: d790dcace2003d07e450fe5b7b93857fef82f0cb
X-Patchwork-Hint: ignore
Message-Id: <20211227211533.5F25282BAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/davfs2: bump to version 1.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d790dcace2003d07e450fe5b7b93857fef82f0cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://savannah.nongnu.org/forum/forum.php?forum_id=10067

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/davfs2/davfs2.hash | 2 +-
 package/davfs2/davfs2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/davfs2/davfs2.hash b/package/davfs2/davfs2.hash
index 88a314d1c2..a555779dbc 100644
--- a/package/davfs2/davfs2.hash
+++ b/package/davfs2/davfs2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2e6b675685bd917772be60f0999ae098c80f79ff20dc131e8fec4547cbb63b50  davfs2-1.6.0.tar.gz
+sha256  ce3eb948ece582a51c934ccb0cc70e659839172717caff173f69a5e2af90c5c0  davfs2-1.6.1.tar.gz
 # License file, locally calculated
 sha256  0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index 9b96140fd8..42192faa59 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAVFS2_VERSION = 1.6.0
+DAVFS2_VERSION = 1.6.1
 DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
