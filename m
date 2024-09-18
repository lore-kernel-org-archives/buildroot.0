Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC759CCD19F
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 11:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DF7760D5C;
	Wed, 18 Sep 2024 11:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id do_bZxVJzct6; Wed, 18 Sep 2024 11:17:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 217E961592
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 217E961592;
	Wed, 18 Sep 2024 11:17:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A90B1BF29C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 11:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 288FC4266C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 11:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ojKiaQ0faZz for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 11:17:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3792841DCE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3792841DCE
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 11:17:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1DEB83AD4; Wed, 18 Sep 2024 11:17:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 13:14:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b485e48a9873feecfcdc26265815374bb8ffddd4
X-Git-Newrev: ed80615cf48f8b78e064134914141b7c53a13b6a
X-Patchwork-Hint: ignore
Message-Id: <20240918111703.A1DEB83AD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libkcapi: update
 site path
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed80615cf48f8b78e064134914141b7c53a13b6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Update the site path to reflect the recent organizational changes on the
chronox.de website.

Fixes:
- http://autobuild.buildroot.org/results/77243633783ac2d037d15d7e9c01384781fe700e

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d4d8881731ed745aff676b860a05abdff9ff1a0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
