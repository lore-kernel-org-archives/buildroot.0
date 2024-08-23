Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BFEC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E88F810FC;
	Fri, 23 Aug 2024 17:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Upg9W9btC8jB; Fri, 23 Aug 2024 17:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D7481882
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41D7481882;
	Fri, 23 Aug 2024 17:43:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F32FC1BF34F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDA9140179
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QUVDJA4wUVA7 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:43:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBDB84015E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBDB84015E
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:43:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9A4D864B1; Fri, 23 Aug 2024 17:43:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:41:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e8eca5e65f906207da77db8c972693f0ea92749
X-Git-Newrev: b331217a50e975e89e28741a05d1f7b60c62496a
X-Patchwork-Hint: ignore
Message-Id: <20240823174322.D9A4D864B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglob: update download URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=b331217a50e975e89e28741a05d1f7b60c62496a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

 http://autobuild.buildroot.org/results/92c/92c697697c07f63f0e03ceb655b5d558e85c392e

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglob/libglob.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglob/libglob.mk b/package/libglob/libglob.mk
index 90356b3973..52da399658 100644
--- a/package/libglob/libglob.mk
+++ b/package/libglob/libglob.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLOB_VERSION = 1.0
-LIBGLOB_SITE = $(call github,voidlinux,libglob,$(LIBGLOB_VERSION))
+LIBGLOB_SITE = $(call github,void-linux,libglob,$(LIBGLOB_VERSION))
 LIBGLOB_LICENSE = BSD-3-Clause
 LIBGLOB_LICENSE_FILES = LICENSE
 LIBGLOB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
