Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC85C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AF95417DE;
	Mon,  5 Feb 2024 10:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AF95417DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30wUoPMBjzT4; Mon,  5 Feb 2024 10:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA521417C9;
	Mon,  5 Feb 2024 10:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA521417C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B1F81BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 747C08264A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 747C08264A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3H8CXRYbs5D for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:22:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A554F82605
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A554F82605
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94AEC86A3F; Mon,  5 Feb 2024 10:22:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:22:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66310c8ccb3b2022bcb2a938147040bf589b8636
X-Git-Newrev: e2aec6008e861ccaec6ce473d7b911ce41ad253e
X-Patchwork-Hint: ignore
Message-Id: <20240205102214.94AEC86A3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flannel: Bump to version 0.24.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2aec6008e861ccaec6ce473d7b911ce41ad253e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Geoff Levand <geoff@infradead.org>
[Peter: drop _SOURCE]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flannel/flannel.hash | 2 +-
 package/flannel/flannel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index bafc453097..c1ceeed9e8 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e17164db3b158d13ce5e40bb7b233790cb186762d929fa4f626baf586d4d63ca  flannel-0.14.0.tar.gz
+sha256  f9e68bc9c5b41ee7f721a754c9fa4eddf3da775faa9e638581a564e33b3fabcf  flannel-0.24.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index b4e2b2f777..02e62256cf 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = 0.14.0
+FLANNEL_VERSION = 0.24.2
 FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
 
 FLANNEL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
