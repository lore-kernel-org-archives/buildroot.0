Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69BEC433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 09:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 735C28463C;
	Fri,  8 Jul 2022 09:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 735C28463C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2pwq5O0SeTIK; Fri,  8 Jul 2022 09:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E35D84687;
	Fri,  8 Jul 2022 09:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E35D84687
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F03071BF276
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 09:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C34FC40567
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 09:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C34FC40567
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8iWFSIX8HvTw for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 09:00:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13EE740483
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 09:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13EE740483
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CD9A67FF33; Fri,  8 Jul 2022 08:47:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Jul 2022 10:59:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72ea8185b0fd25d02bedda24a91826d9398c6d22
X-Git-Newrev: 350e866589daf43ecb19aa25f3c7dfd3b421418c
X-Patchwork-Hint: ignore
Message-Id: <20220708084725.CD9A67FF33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/4th: bump to version 3.64.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=350e866589daf43ecb19aa25f3c7dfd3b421418c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/4th/4th.hash | 2 +-
 package/4th/4th.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/4th/4th.hash b/package/4th/4th.hash
index ae08a6bf5e..8a31263479 100644
--- a/package/4th/4th.hash
+++ b/package/4th/4th.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c0905e92316c151224858fcfff21c143c85efa4f9f1b2ade3c64cfd988e0a6a8  4th-3.64.0-unix.tar.gz
+sha256  f96ea74cdb2aadfdc3bebf8d6d2cf7b8976b5d56c1237387479bffaecede9fe3  4th-3.64.1-unix.tar.gz
 sha256  8c6111b645a02219579ea66e84aa8e78a0ed4f4dd80857ffb91bcda5528717d4  COPYING
diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index d031c0e4b4..276423b255 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-4TH_VERSION = 3.64.0
+4TH_VERSION = 3.64.1
 4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
 4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
 4TH_LICENSE = GPL-3.0+, LGPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
