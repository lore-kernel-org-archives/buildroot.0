Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0218C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6820A6106F;
	Thu,  6 Oct 2022 18:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6820A6106F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZu52dn4gHP7; Thu,  6 Oct 2022 18:02:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E96960F49;
	Thu,  6 Oct 2022 18:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E96960F49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 873DC1BF23C
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9437183FB9
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9437183FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTSwH-296aHz for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DD7383FBB
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DD7383FBB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C5A786938; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 19:58:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cced5b68acba02abfd72f66264faed60f4bfd65a
X-Git-Newrev: 30d6b73271de85ba50a7f59fb2cb6c0c0d9f0057
X-Patchwork-Hint: ignore
Message-Id: <20221006175949.7C5A786938@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htpdate: bump to version 1.3.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=30d6b73271de85ba50a7f59fb2cb6c0c0d9f0057
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/htpdate/htpdate.hash | 2 +-
 package/htpdate/htpdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index d5426c6d08..f572fb1e84 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  a8734d4f1d84d0608d045508608f2d29d8b968da269f83120aaac67709b1bd03  htpdate-1.3.5.tar.gz
+sha256  3cdc558ec8e53ef374a42490b2f28c0b23981fa8754a6d7182044707828ad1e9  htpdate-1.3.6.tar.gz
 sha256  7989949df09a0489434723c571541604cd3f2e0418c6a6aa9179bfaf8ec807cc  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index cf47ee5451..2d4a11dd9d 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.3.5
+HTPDATE_VERSION = 1.3.6
 HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
