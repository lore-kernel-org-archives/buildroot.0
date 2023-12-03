Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8098C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 18:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 714CE41506;
	Sun,  3 Dec 2023 18:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 714CE41506
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rvyiYmI9MJl1; Sun,  3 Dec 2023 18:10:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC1C34149F;
	Sun,  3 Dec 2023 18:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC1C34149F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8C81BF408
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33E074149F
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E074149F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7J2eztQwrUNB for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 18:10:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 583544148F
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 18:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 583544148F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3026E8781F; Sun,  3 Dec 2023 18:10:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 19:07:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 302199957705ae9b63741ce8a571b706bcc577e2
X-Git-Newrev: c8a5a97e6740e31ef62e1be9f7c640dde79db6d4
X-Patchwork-Hint: ignore
Message-Id: <20231203181053.3026E8781F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tbb: bump to version
 2021.11.0.
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8a5a97e6740e31ef62e1be9f7c640dde79db6d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tbb/tbb.hash | 2 +-
 package/tbb/tbb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
index 085d54109a..4d2cb10da8 100644
--- a/package/tbb/tbb.hash
+++ b/package/tbb/tbb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  487023a955e5a3cc6d3a0d5f89179f9b6c0ae7222613a7185b0227ba0c83700b  tbb-2021.10.0.tar.gz
+sha256  782ce0cab62df9ea125cdea253a50534862b563f1d85d4cda7ad4e77550ac363  tbb-2021.11.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
index 75cca5e99d..1b0afbb889 100644
--- a/package/tbb/tbb.mk
+++ b/package/tbb/tbb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBB_VERSION = 2021.10.0
+TBB_VERSION = 2021.11.0
 TBB_SITE = $(call github,01org,tbb,v$(TBB_VERSION))
 TBB_INSTALL_STAGING = YES
 TBB_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
