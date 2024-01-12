Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D3DC4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 17:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA27783F15;
	Fri, 12 Jan 2024 17:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA27783F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnkBe_ZGCvUi; Fri, 12 Jan 2024 17:44:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41A8883E66;
	Fri, 12 Jan 2024 17:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41A8883E66
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 302D01BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06FCF43CDA
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06FCF43CDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CsQ-Zwi5mOof for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 17:44:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 328A5436ED
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 17:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 328A5436ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B34485FA1; Fri, 12 Jan 2024 17:44:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 18:09:56 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 29bac1a29b65b1361988d0341931733c58252ac3
X-Git-Newrev: f3170667f07391ffe2f87e658fb06dbc525a4f7e
X-Patchwork-Hint: ignore
Message-Id: <20240112174407.1B34485FA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] DEVELOPERS: remove
 aduskett@gmail.com
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3170667f07391ffe2f87e658fb06dbc525a4f7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

I will only be supporting Buildroot in a professional capacity from now on.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 951c9a8ebce22f5ff00003fea5ee1ed5d9856fef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 706321dc13..380dfb82c2 100644
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
 F:	package/flutter-engine/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
