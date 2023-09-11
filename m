Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F0AC71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DDC341528;
	Mon, 11 Sep 2023 19:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DDC341528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rexRuVsij01c; Mon, 11 Sep 2023 19:20:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D40841521;
	Mon, 11 Sep 2023 19:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D40841521
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BAB41BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5511481916
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5511481916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CqC2wVuQ6VMc for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:20:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87BFC81846
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87BFC81846
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 762A686CC7; Mon, 11 Sep 2023 19:20:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 21:18:04 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: c8d3d288358c06eb076d4cce735e807c6a5e0ee8
X-Git-Newrev: 0a63c5d31dc2620100dda2c04206bfdfaf776855
X-Patchwork-Hint: ignore
Message-Id: <20230911192022.762A686CC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/diffutils: add
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
Content-Type: multipart/mixed; boundary="===============6815378608012650532=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6815378608012650532==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0a63c5d31dc2620100dda2c04206bfdfaf776855
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
index 1004437026..b8e8d877ae 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -10,6 +10,7 @@ DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 DIFFUTILS_LICENSE = GPL-3.0+
 DIFFUTILS_LICENSE_FILES = COPYING
+DIFFUTILS_CPE_ID_VENDOR = gnu
 
 # Since glibc >= 2.26, don't try to use getopt_long replacement bundled
 # with diffutils. It will conflict with the one from glibc.

--===============6815378608012650532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6815378608012650532==--
