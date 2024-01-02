Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7F9C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90CEC409E3;
	Tue,  2 Jan 2024 21:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90CEC409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXF5b5o7dugC; Tue,  2 Jan 2024 21:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94B6A40A5D;
	Tue,  2 Jan 2024 21:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94B6A40A5D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25B6C1BF311
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F335381E71
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F335381E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kQWHCO7CWt6 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:16:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 299B3818CD
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 299B3818CD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1644B83CEC; Tue,  2 Jan 2024 21:16:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 22:15:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46fcdf07be310a49d9731031e2c3676c12e2d7f6
X-Git-Newrev: 951c9a8ebce22f5ff00003fea5ee1ed5d9856fef
X-Patchwork-Hint: ignore
Message-Id: <20240102211610.1644B83CEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove aduskett@gmail.com
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

commit: https://git.buildroot.net/buildroot/commit/?id=951c9a8ebce22f5ff00003fea5ee1ed5d9856fef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I will only be supporting Buildroot in a professional capacity from now on.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index cc089e8ff6..42a8ed2993 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -26,11 +26,6 @@
 #   infrastructure, and will be CC'ed on all patches that add or
 #   modify packages that use this infrastructure.
 
-N:	Adam Duskett <aduskett@gmail.com>
-F:	package/firewalld/
-F:	package/vulkan-loader/
-F:	package/vulkan-tools/
-
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/dmenu-wayland/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
