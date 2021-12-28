Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D911C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 13:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE79B4024B;
	Tue, 28 Dec 2021 13:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gzh4Wpzco4zq; Tue, 28 Dec 2021 13:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B75B404D5;
	Tue, 28 Dec 2021 13:13:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF9781BF9AC
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9F4160AE9
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 13:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gx8Lw42D7oVs for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 13:13:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D548660ADD
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 13:13:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7A5FB82BA5; Tue, 28 Dec 2021 13:08:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 14:13:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f14f1f0dac5f58416057a62527c7c1d66450a43a
X-Git-Newrev: 9d097a59417399b01e4bcd406395a7a5c76686ae
X-Patchwork-Hint: ignore
Message-Id: <20211228130805.7A5FB82BA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/graphicsmagick: bump to version
 1.3.37
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d097a59417399b01e4bcd406395a7a5c76686ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of Copryright.txt (update in year)

http://www.graphicsmagick.org/NEWS.html#december-2021

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/graphicsmagick/graphicsmagick.hash | 4 ++--
 package/graphicsmagick/graphicsmagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/graphicsmagick/graphicsmagick.hash b/package/graphicsmagick/graphicsmagick.hash
index 6ad5de9d65..cf6d224216 100644
--- a/package/graphicsmagick/graphicsmagick.hash
+++ b/package/graphicsmagick/graphicsmagick.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5d5b3fde759cdfc307aaf21df9ebd8c752e3f088bb051dd5df8aac7ba7338f46  GraphicsMagick-1.3.36.tar.xz
-sha256  aed5bd8e28cbce601cbe2ca2267b663ccd63152965f2d5caea1311bf0039c325  Copyright.txt
+sha256  90dc22f1a7bd240e4c9065a940962bf13da43c99bcc36cb111cc3c1a0d7477d4  GraphicsMagick-1.3.37.tar.xz
+sha256  8a4d960c5a3e453ee21e459e1794c7a0c85559825d3363a8d3b510b3344fdad4  Copyright.txt
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 2a22936fcc..38743487eb 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRAPHICSMAGICK_VERSION = 1.3.36
+GRAPHICSMAGICK_VERSION = 1.3.37
 GRAPHICSMAGICK_SOURCE = GraphicsMagick-$(GRAPHICSMAGICK_VERSION).tar.xz
 GRAPHICSMAGICK_SITE = https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$(GRAPHICSMAGICK_VERSION)
 GRAPHICSMAGICK_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
