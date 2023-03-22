Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20EFC6FD1C
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 22:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ACD184015;
	Wed, 22 Mar 2023 22:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ACD184015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KyNB4KkHhztL; Wed, 22 Mar 2023 22:49:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2AA283FFF;
	Wed, 22 Mar 2023 22:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2AA283FFF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EFCF1BF909
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4695683FFF
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4695683FFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEBwuA5JTQ-X for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 22:49:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73A9A83FC2
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 22:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73A9A83FC2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C6A27FAAB; Wed, 22 Mar 2023 22:49:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 23:48:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bd5301db0a5f30e863ebcb146d63653848f13e1
X-Git-Newrev: 4b0346feda49237065ac4a80ed440b88b7dca315
X-Patchwork-Hint: ignore
Message-Id: <20230322224933.5C6A27FAAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/less: bump to version 608
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b0346feda49237065ac4a80ed440b88b7dca315
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://www.greenwoodsoftware.com/less/news.608.html

Note 1: the package patch is kept, as it is included in version 609.
Note 2: the license file hash changed due to the year update.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/less/less.hash | 6 +++---
 package/less/less.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index eed8340ec1..19be26cae0 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key F153A7C833235259
-# http://www.greenwoodsoftware.com/less/less-590.sig
-sha256  6aadf54be8bf57d0e2999a3c5d67b1de63808bb90deb8f77b028eafae3a08e10  less-590.tar.gz
+# https://www.greenwoodsoftware.com/less/less-608.sig
+sha256  a69abe2e0a126777e021d3b73aa3222e1b261f10e64624d41ec079685a6ac209  less-608.tar.gz
 # Locally calculated
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index f01f94d6c8..dfbd411863 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 590
+LESS_VERSION = 608
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
