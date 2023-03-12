Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF58BC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 21:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33859408FF;
	Sun, 12 Mar 2023 21:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33859408FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVj0Zk3LmYkA; Sun, 12 Mar 2023 21:57:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 335CE408D3;
	Sun, 12 Mar 2023 21:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 335CE408D3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45E931BF2CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9274960E37
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9274960E37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGlcQI9T2Qfo for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D73F760E15
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D73F760E15
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6E4B87006; Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 13:35:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69053186c9f1561855357be574c70c0b3ad0ddcb
X-Git-Newrev: af9769ad23c67f9bd4d1b038709d41230501efef
X-Patchwork-Hint: ignore
Message-Id: <20230312214624.C6E4B87006@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htpdate: bump to version 1.3.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=af9769ad23c67f9bd4d1b038709d41230501efef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/htpdate/htpdate.hash | 2 +-
 package/htpdate/htpdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index f572fb1e84..b711773af5 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  3cdc558ec8e53ef374a42490b2f28c0b23981fa8754a6d7182044707828ad1e9  htpdate-1.3.6.tar.gz
+sha256  88c52fe475308ee95f560fd7cf68c75bc6e9a6abf56be7fed203a7f762fe7ab2  htpdate-1.3.7.tar.gz
 sha256  7989949df09a0489434723c571541604cd3f2e0418c6a6aa9179bfaf8ec807cc  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 2d4a11dd9d..20be904d3d 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.3.6
+HTPDATE_VERSION = 1.3.7
 HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
