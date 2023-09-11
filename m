Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD97C71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B87D241524;
	Mon, 11 Sep 2023 19:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B87D241524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TMvdJUd6wfsg; Mon, 11 Sep 2023 19:21:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 127E741516;
	Mon, 11 Sep 2023 19:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 127E741516
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87D131BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F0B041519
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F0B041519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdbmjxurXhQB for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:21:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABB7241516
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABB7241516
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B28186CE4; Mon, 11 Sep 2023 19:21:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 21:19:13 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c3b45736316e828e6cc7937caf113e7b3d15b364
X-Git-Newrev: 95351051a61a0afd61e39b275eede5e07fcccee0
X-Patchwork-Hint: ignore
Message-Id: <20230911192132.9B28186CE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/diffutils: add
 DIFFUTILS_CPE_ID_VENDOR
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
Content-Type: multipart/mixed; boundary="===============3658213402163946368=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3658213402163946368==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=95351051a61a0afd61e39b275eede5e07fcccee0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:gnu:diffutils is a valid identifier for
this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=diffutils

Signed-off-by: Clément Ramirez <clement.ramirez@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e763128b6b16becdb476f52af106302e18c26233)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/diffutils/diffutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 6db68af7ec..510f3725bf 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -10,6 +10,7 @@ DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 DIFFUTILS_LICENSE = GPL-3.0+
 DIFFUTILS_LICENSE_FILES = COPYING
+DIFFUTILS_CPE_ID_VENDOR = gnu
 # We're patching m4/stack-direction.m4
 DIFFUTILS_AUTORECONF = YES
 

--===============3658213402163946368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3658213402163946368==--
