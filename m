Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BA7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 898D9812AF;
	Mon, 27 Dec 2021 21:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rI4r7yFfeTo4; Mon, 27 Dec 2021 21:21:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4FCF8129B;
	Mon, 27 Dec 2021 21:21:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09BE21BF983
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED5A881656
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NN7IAzV1Xvi7 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:21:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49BF781491
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6715582BAE; Mon, 27 Dec 2021 21:15:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 22:20:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d790dcace2003d07e450fe5b7b93857fef82f0cb
X-Git-Newrev: 6bcbaf130de9c84dc8f68d70027e684a4c214e70
X-Patchwork-Hint: ignore
Message-Id: <20211227211533.6715582BAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dahdi-tools: bump to version 3.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bcbaf130de9c84dc8f68d70027e684a4c214e70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dahdi-tools/dahdi-tools.hash | 4 ++--
 package/dahdi-tools/dahdi-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dahdi-tools/dahdi-tools.hash b/package/dahdi-tools/dahdi-tools.hash
index 5538ed6b8a..72fa995c84 100644
--- a/package/dahdi-tools/dahdi-tools.hash
+++ b/package/dahdi-tools/dahdi-tools.hash
@@ -1,7 +1,7 @@
 # sha1 from http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
 # sha256 locally computed
-sha1    3e988256aae4b6a6ed8efb3ecc07753779f54823                          dahdi-tools-3.0.0.tar.gz
-sha256  5bebb20d5ae13fa13f0e2075603013954b962be477db02271eef44b3e41557c5  dahdi-tools-3.0.0.tar.gz
+sha1  fff6c8fdc72a66f81768e4f50bf55156f7cebbc4  dahdi-tools-3.1.0.tar.gz
+sha256  ea852ebd274ee1cc90ff5e4ac84261b0b787b1a74e8b76ad659bc9ec4f77e67e  dahdi-tools-3.1.0.tar.gz
 
 # License files, locally computed
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
diff --git a/package/dahdi-tools/dahdi-tools.mk b/package/dahdi-tools/dahdi-tools.mk
index 392dc09140..fc0c591ca8 100644
--- a/package/dahdi-tools/dahdi-tools.mk
+++ b/package/dahdi-tools/dahdi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAHDI_TOOLS_VERSION = 3.0.0
+DAHDI_TOOLS_VERSION = 3.1.0
 DAHDI_TOOLS_SITE = http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
 
 DAHDI_TOOLS_LICENSE = GPLv2, LGPLv2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
