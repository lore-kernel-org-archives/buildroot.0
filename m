Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A39C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 22:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D32041551;
	Thu,  8 Jun 2023 22:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D32041551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SQacb2Wof7pY; Thu,  8 Jun 2023 22:11:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEDEB404AB;
	Thu,  8 Jun 2023 22:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEDEB404AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 155A61BF392
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 22:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E04CA404AB
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 22:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E04CA404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OvmdJhBDvCFw for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 22:11:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1333E4154A
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 22:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1333E4154A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3585821FE; Thu,  8 Jun 2023 22:11:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Jun 2023 23:10:46 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: bff0536e4c642ff87c8a3f45a6d42d34a096b5fd
X-Git-Newrev: 6bff385173bcd6628bd34a2c09c3253a6d057f8d
X-Patchwork-Hint: ignore
Message-Id: <20230608221116.F3585821FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mdio-tools: fix
 Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bff385173bcd6628bd34a2c09c3253a6d057f8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Add project's site and add a full stop at the end of the description.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6ea396aef272fa107775ea8e4903506d2ffc99e0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mdio-tools/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
index 237f4454cc..790c9c534a 100644
--- a/package/mdio-tools/Config.in
+++ b/package/mdio-tools/Config.in
@@ -14,4 +14,6 @@ config BR2_PACKAGE_MDIO_TOOLS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	select BR2_PACKAGE_LIBMNL
 	help
-	  Low-level debug tools for MDIO devices
+	  Low-level debug tools for MDIO devices.
+
+	  https://github.com/wkz/mdio-tools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
