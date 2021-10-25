Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B8CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:40:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBA2D60EE9
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBA2D60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DCDB401AF;
	Mon, 25 Oct 2021 12:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sTlEhCo79B8G; Mon, 25 Oct 2021 12:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A03A74037F;
	Mon, 25 Oct 2021 12:40:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 746451BF375
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B9ED60737
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S55grmIzihX1 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 12:40:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C55006064C
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:40:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D91AC8877A; Mon, 25 Oct 2021 12:36:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 14:36:53 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: a2bc7a73c2551fb03e2fe7c720be0e7e7fb447dd
X-Git-Newrev: c495217f73de5e9686164b9b7d23e1d425d94087
X-Patchwork-Hint: ignore
Message-Id: <20211025123659.D91AC8877A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/earlyoom: bump to
 version 1.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c495217f73de5e9686164b9b7d23e1d425d94087
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

https://github.com/rfjakob/earlyoom/blob/v1.6.2/README.md#changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ee5efd4bbb93cee24850426d63acc34854ba1dc2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/earlyoom/earlyoom.hash | 2 +-
 package/earlyoom/earlyoom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/earlyoom/earlyoom.hash b/package/earlyoom/earlyoom.hash
index b0095cb8ec..ab91383ee4 100644
--- a/package/earlyoom/earlyoom.hash
+++ b/package/earlyoom/earlyoom.hash
@@ -1,4 +1,4 @@
 # locally calculated
-sha256  b81804fc4470f996014d52252a87a1cf3b43d3d8754140035b10dcee349302b8  earlyoom-1.6.tar.gz
+sha256  227234cf9e77831c21c748bd361e1a7c415e158b96034eacd59e70586779bb6c  earlyoom-1.6.2.tar.gz
 # License files, locally calculated
 sha256  e730b3ec729de46d987ae73f30ed337e4cbe832f09205330acfa71848c6e0087  LICENSE
diff --git a/package/earlyoom/earlyoom.mk b/package/earlyoom/earlyoom.mk
index 066a479bd1..d1cf9d4de1 100644
--- a/package/earlyoom/earlyoom.mk
+++ b/package/earlyoom/earlyoom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EARLYOOM_VERSION = 1.6
+EARLYOOM_VERSION = 1.6.2
 EARLYOOM_SITE = $(call github,rfjakob,earlyoom,v$(EARLYOOM_VERSION))
 EARLYOOM_LICENSE = MIT
 EARLYOOM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
