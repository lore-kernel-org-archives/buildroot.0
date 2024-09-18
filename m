Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063A4CDD548
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 16:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C2D040096;
	Wed, 18 Sep 2024 16:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtdBDUjw1Ob2; Wed, 18 Sep 2024 16:50:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5411F401EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5411F401EB;
	Wed, 18 Sep 2024 16:50:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5D71BF2C9
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF29F606A3
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nn8QIAZHVrKm for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3635C60634
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3635C60634
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 16:50:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E569B83B50; Wed, 18 Sep 2024 16:50:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 18:42:09 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 36328f64d90a81329c68deb5ba90c515e811855c
X-Git-Newrev: 0717afbd5ffdb5eda106bb1561d39071b994ee80
X-Patchwork-Hint: ignore
Message-Id: <20240918165042.E569B83B50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libglob: update
 download URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=0717afbd5ffdb5eda106bb1561d39071b994ee80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes:

 http://autobuild.buildroot.org/results/92c/92c697697c07f63f0e03ceb655b5d558e85c392e

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b331217a50e975e89e28741a05d1f7b60c62496a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
