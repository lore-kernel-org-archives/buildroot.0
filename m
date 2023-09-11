Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91963EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B6FF4150C;
	Mon, 11 Sep 2023 19:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B6FF4150C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KSfAecs7h36F; Mon, 11 Sep 2023 19:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 847C341532;
	Mon, 11 Sep 2023 19:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 847C341532
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC6A81BF860
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A327860ABD
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A327860ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WCB_ompKs6fu for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:08:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD65260A65
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD65260A65
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD79186CB0; Mon, 11 Sep 2023 19:08:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 18:17:34 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: bc19b0ca3361063265b60a08a53d5b03d673dfc7
X-Git-Newrev: c9d9135fde1e79e5cb1926ec32c2733903f8f62f
X-Patchwork-Hint: ignore
Message-Id: <20230911190853.AD79186CB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/chocolate-doom:
 add VENDOR and PRODUCT CPE IDs
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
Content-Type: multipart/mixed; boundary="===============0415763535880134335=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0415763535880134335==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c9d9135fde1e79e5cb1926ec32c2733903f8f62f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:chocolate-doom:chocolate_doom is a valid identifier for
this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=chocolate-doom

Signed-off-by: Clément Ramirez <clement.ramirez@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 606beef3527b0dacc7a3d8b870330b10f6dc566a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chocolate-doom/chocolate-doom.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/chocolate-doom/chocolate-doom.mk b/package/chocolate-doom/chocolate-doom.mk
index 8318c123bd..581b2c51c2 100644
--- a/package/chocolate-doom/chocolate-doom.mk
+++ b/package/chocolate-doom/chocolate-doom.mk
@@ -8,6 +8,8 @@ CHOCOLATE_DOOM_VERSION = 3.0.1
 CHOCOLATE_DOOM_SITE = http://www.chocolate-doom.org/downloads/$(CHOCOLATE_DOOM_VERSION)
 CHOCOLATE_DOOM_LICENSE = GPL-2.0+
 CHOCOLATE_DOOM_LICENSE_FILES = COPYING
+CHOCOLATE_DOOM_CPE_ID_VENDOR = chocolate-doom
+CHOCOLATE_DOOM_CPE_ID_PRODUCT = chocolate_doom
 CHOCOLATE_DOOM_DEPENDENCIES = host-pkgconf sdl2 sdl2_mixer sdl2_net
 
 # Avoid installing desktop entries, icons, etc.

--===============0415763535880134335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0415763535880134335==--
