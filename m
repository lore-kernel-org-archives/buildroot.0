Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170F4C432BE
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:15:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D721860EBC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D721860EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7A8B405FC;
	Wed,  4 Aug 2021 00:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08ohoSJLGR-B; Wed,  4 Aug 2021 00:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5531404E3;
	Wed,  4 Aug 2021 00:15:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2A441BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 451CB40F04
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4PjjflYwUBVE for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA49E40F02
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3AF8D81469; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:41:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4cf1efb04add60e5dcb3eb4edd9156a84d3e11ec
X-Git-Newrev: 3d036d059bba931f55b982c1eeb11f364ef1dce4
X-Patchwork-Hint: ignore
Message-Id: <20210803211012.3AF8D81469@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-testmore: bump to
 version 0.3.6
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=3d036d059bba931f55b982c1eeb11f364ef1dce4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

diff COPYRIGHT:
- Copyright (C) 2009-2018 Francois Perrad.
+ Copyright (C) 2009-2021 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-testmore/lua-testmore.hash | 4 ++--
 package/lua-testmore/lua-testmore.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-testmore/lua-testmore.hash b/package/lua-testmore/lua-testmore.hash
index 752fc17f73..4ff577e528 100644
--- a/package/lua-testmore/lua-testmore.hash
+++ b/package/lua-testmore/lua-testmore.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 4875103611683b13fdd0bc3658c0cbe302b4db491043a03ea002726810d371c5  lua-testmore-0.3.5-2.src.rock
-sha256 0fa63370a149eda33e25987dd63bd096a616a3e47d2cfc45ca2fd66e8d2bfb35  lua-TestMore-0.3.5/COPYRIGHT
+sha256 b3e57955888aba3974d6f5a21219214e2803a38e4623671f7d9d9e0f1851e608  lua-testmore-0.3.6-1.src.rock
+sha256 37a3afb014325b98f0ad919cb40bc9d5a948120e5260e75b9d00c198d350da6d  lua-TestMore-0.3.6/COPYRIGHT
diff --git a/package/lua-testmore/lua-testmore.mk b/package/lua-testmore/lua-testmore.mk
index 5d6dc053a8..e3cc7b7bdb 100644
--- a/package/lua-testmore/lua-testmore.mk
+++ b/package/lua-testmore/lua-testmore.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_TESTMORE_VERSION = 0.3.5-2
+LUA_TESTMORE_VERSION = 0.3.6-1
 LUA_TESTMORE_NAME_UPSTREAM = lua-TestMore
 LUA_TESTMORE_LICENSE = MIT
 LUA_TESTMORE_LICENSE_FILES = $(LUA_TESTMORE_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
