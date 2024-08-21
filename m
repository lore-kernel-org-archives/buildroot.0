Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB9DC52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 07:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA2740209;
	Wed, 21 Aug 2024 07:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGdki9hj4yWC; Wed, 21 Aug 2024 07:29:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D5674039D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D5674039D;
	Wed, 21 Aug 2024 07:29:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 551451BF38B
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 07:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 406B44039D
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 07:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id up50mjKo41Kb for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 07:29:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43B6340209
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43B6340209
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 07:29:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CFFF8621E; Wed, 21 Aug 2024 07:29:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 21 Aug 2024 09:28:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 064e4c09fa788ccf0927fcaf3987e0f0fdc08eb7
X-Git-Newrev: d4d8881731ed745aff676b860a05abdff9ff1a0c
X-Patchwork-Hint: ignore
Message-Id: <20240821072920.2CFFF8621E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkcapi: update site path
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4d8881731ed745aff676b860a05abdff9ff1a0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the site path to reflect the recent organizational changes on the
chronox.de website.

Fixes:
- http://autobuild.buildroot.org/results/77243633783ac2d037d15d7e9c01384781fe700e

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libkcapi/libkcapi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 11462d6e2a..7a79dd55ae 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -6,7 +6,7 @@
 
 LIBKCAPI_VERSION = 1.5.0
 LIBKCAPI_SOURCE = libkcapi-$(LIBKCAPI_VERSION).tar.xz
-LIBKCAPI_SITE = http://www.chronox.de/libkcapi
+LIBKCAPI_SITE = http://www.chronox.de/libkcapi/releases/$(LIBKCAPI_VERSION)
 LIBKCAPI_AUTORECONF = YES
 LIBKCAPI_INSTALL_STAGING = YES
 LIBKCAPI_LICENSE = BSD-3-Clause (library), BSD-3-Clause or GPL-2.0 (programs)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
