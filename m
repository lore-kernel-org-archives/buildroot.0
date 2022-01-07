Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB32C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11C9281751;
	Fri,  7 Jan 2022 20:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Us4AIND07cCP; Fri,  7 Jan 2022 20:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 666838174D;
	Fri,  7 Jan 2022 20:34:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11BD91BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0FB9429A2
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bYOsjvo3W3kE for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:34:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 546554299F
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:34:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9283A82A92; Fri,  7 Jan 2022 20:28:39 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 21:33:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1fba3711d03687fb05c2c849ebe11a2761a7474
X-Git-Newrev: c86ec14d2aab1afe7815801d194d0da477e81db7
X-Patchwork-Hint: ignore
Message-Id: <20220107202839.9283A82A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbuffer: bump to version 20211018
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

commit: https://git.buildroot.net/buildroot/commit/?id=c86ec14d2aab1afe7815801d194d0da477e81db7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mbuffer/mbuffer.hash | 4 ++--
 package/mbuffer/mbuffer.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbuffer/mbuffer.hash b/package/mbuffer/mbuffer.hash
index 7c200d543e..bab568d1d8 100644
--- a/package/mbuffer/mbuffer.hash
+++ b/package/mbuffer/mbuffer.hash
@@ -1,8 +1,8 @@
 # From http://www.maier-komor.de/mbuffer.html
-md5  4e4712db5fbd4e71bfbfa2c145c6c646  mbuffer-20210328.tgz
+md5  b6787260112e3ac416c0febdb097caa8  mbuffer-20211018.tgz
 
 # Locally computed after checking signature upstream
-sha256  51b5b8d8488991a55fe1dfce90130f9e47bc1ce286ba03b4f628c04b784fdc5d  mbuffer-20210328.tgz
+sha256  e240c1e4e4ac14c28be8c660ec47d44ce16b1e8ec92aa907ad13004ffd5db6e3  mbuffer-20211018.tgz
 
 # Hash for license file
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/mbuffer/mbuffer.mk b/package/mbuffer/mbuffer.mk
index c7c4456651..bbf27579f1 100644
--- a/package/mbuffer/mbuffer.mk
+++ b/package/mbuffer/mbuffer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBUFFER_VERSION = 20210328
+MBUFFER_VERSION = 20211018
 MBUFFER_SOURCE = mbuffer-$(MBUFFER_VERSION).tgz
 MBUFFER_SITE = http://www.maier-komor.de/software/mbuffer
 MBUFFER_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
