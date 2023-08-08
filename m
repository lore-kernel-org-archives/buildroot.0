Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527EAC001DE
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 16:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CEB040C1C;
	Tue,  8 Aug 2023 16:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CEB040C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3usybDMT3hdJ; Tue,  8 Aug 2023 16:49:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4734E40BF1;
	Tue,  8 Aug 2023 16:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4734E40BF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEFC71BF5A5
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B762A4062C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B762A4062C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMFBnGFTU4Tr for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 16:49:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEF0F40611
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 16:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEF0F40611
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE55384A65; Tue,  8 Aug 2023 16:49:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 18:49:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 969bd6e3ddf3567495bab190e828dc9135d31e87
X-Git-Newrev: 606beef3527b0dacc7a3d8b870330b10f6dc566a
X-Patchwork-Hint: ignore
Message-Id: <20230808164942.AE55384A65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chocolate-doom: add VENDOR and
 PRODUCT CPE IDs
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
Content-Type: multipart/mixed; boundary="===============6021195866175955541=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6021195866175955541==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=606beef3527b0dacc7a3d8b870330b10f6dc566a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:chocolate-doom:chocolate_doom is a valid identifier for
this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=chocolate-doom

Signed-off-by: Clément Ramirez <clement.ramirez@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

--===============6021195866175955541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6021195866175955541==--
