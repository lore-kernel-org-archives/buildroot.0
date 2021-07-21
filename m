Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1BBC432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:11:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93DB460187
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93DB460187
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6919482AF5;
	Tue,  3 Aug 2021 22:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kEUZUfSs7oC1; Tue,  3 Aug 2021 22:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF04982A17;
	Tue,  3 Aug 2021 22:11:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7E41BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C60183AD2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UE0YiOQghwxf for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62905835B1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id ABF8D81484; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 21:07:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2016df2ed258f1d88cc9dfdb97fcc67ea3dc119a
X-Git-Newrev: 35953d1e61aa8581be09c9dca39365955b10590e
X-Patchwork-Hint: ignore
Message-Id: <20210803211013.ABF8D81484@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/proxychains-ng: bump
 to version 4.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=35953d1e61aa8581be09c9dca39365955b10590e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/rofl0r/proxychains-ng/blob/v4.14/README

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proxychains-ng/proxychains-ng.hash | 6 ++----
 package/proxychains-ng/proxychains-ng.mk   | 4 ++--
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/proxychains-ng/proxychains-ng.hash b/package/proxychains-ng/proxychains-ng.hash
index 9781b77af1..779f6b626d 100644
--- a/package/proxychains-ng/proxychains-ng.hash
+++ b/package/proxychains-ng/proxychains-ng.hash
@@ -1,6 +1,4 @@
-# From https://sourceforge.net/projects/proxychains-ng/files/
-md5 34d840eb184e96bff418201c28a935c5  proxychains-ng-4.11.tar.bz2
-sha1 00bc3dc18f2b638c79112c99f082a7a2878beaad  proxychains-ng-4.11.tar.bz2
+# From https://github.com/rofl0r/proxychains-ng/releases/tag/v4.14
+sha512  75a1a4629d2b7ebac9b909a694b395339cf669fa4e23bfcc57938e46377b5619f31c9651d2bc457d1ad10ec1be7747981106392bf8bf65999cb7bb9c748d7e95  proxychains-ng-4.14.tar.xz
 # Locally computed:
-sha256  dcc4149808cd1fb5d9663cc09791f478805816b1f017381f424414c47f6376b6  proxychains-ng-4.11.tar.bz2
 sha256  86728623caeff60e9bcc37e03b432fd191de927eed48a72a3bb4ac4e53fe20df  COPYING
diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index 0437f7d911..bb7c9ff687 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROXYCHAINS_NG_VERSION = 4.11
-PROXYCHAINS_NG_SOURCE = proxychains-ng-$(PROXYCHAINS_NG_VERSION).tar.bz2
+PROXYCHAINS_NG_VERSION = 4.14
+PROXYCHAINS_NG_SOURCE = proxychains-ng-$(PROXYCHAINS_NG_VERSION).tar.xz
 PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
 PROXYCHAINS_NG_LICENSE = GPL-2.0+
 PROXYCHAINS_NG_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
