Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5849FC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C249C40A5E;
	Tue,  2 Jan 2024 20:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C249C40A5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGN-djlCSSzO; Tue,  2 Jan 2024 20:17:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BADE140A5B;
	Tue,  2 Jan 2024 20:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BADE140A5B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92E201BF966
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7835640A5E
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7835640A5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTFxgLAqTPLe for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 580E6408C0
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 580E6408C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E43A82AD1; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:05:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e91de6428bf3dde303ed41b55b4cfe739b353f9
X-Git-Newrev: 2c81cee61a5d6d477b1081cab7dfba7157c18155
X-Patchwork-Hint: ignore
Message-Id: <20240102201716.3E43A82AD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hawktracer: bump to version 0.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c81cee61a5d6d477b1081cab7dfba7157c18155
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/amzn/hawktracer/releases/tag/v0.11.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hawktracer/hawktracer.hash | 2 +-
 package/hawktracer/hawktracer.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hawktracer/hawktracer.hash b/package/hawktracer/hawktracer.hash
index 29d00e29ec..585b612c49 100644
--- a/package/hawktracer/hawktracer.hash
+++ b/package/hawktracer/hawktracer.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  099f76d5be18ad5d714fded0c6f889f588986cdde2b31f2c0058413698a5f35c  hawktracer-3c22b3908912e2ec727fd2ddc5dbfe7464e6b4a5.tar.gz
+sha256  12a689a1cfb2ae25ad777b1b2275dbba5cd64905627b0a20d17d6e26de003cef  hawktracer-0.11.0.tar.gz
 sha256  2f377333e64ad08ad3afec8ed6c2c96ced2a6d7d67443eb2784a931bb7b3fd59  LICENSE
diff --git a/package/hawktracer/hawktracer.mk b/package/hawktracer/hawktracer.mk
index 462d073755..8e722080f5 100644
--- a/package/hawktracer/hawktracer.mk
+++ b/package/hawktracer/hawktracer.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HAWKTRACER_VERSION = 3c22b3908912e2ec727fd2ddc5dbfe7464e6b4a5
-HAWKTRACER_SITE = $(call github,amzn,hawktracer,$(HAWKTRACER_VERSION))
+HAWKTRACER_VERSION = 0.11.0
+HAWKTRACER_SITE = $(call github,amzn,hawktracer,v$(HAWKTRACER_VERSION))
 HAWKTRACER_LICENSE = MIT
 HAWKTRACER_LICENSE_FILES = LICENSE
 HAWKTRACER_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
