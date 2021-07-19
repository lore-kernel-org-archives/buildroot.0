Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3325DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:56:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00CE860F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00CE860F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C813540634;
	Tue,  3 Aug 2021 23:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kINgVKIxzma; Tue,  3 Aug 2021 23:56:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D32F540628;
	Tue,  3 Aug 2021 23:56:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49EE61BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F4B740F76
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1E38rcGQp_xD for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F5FD40EDE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E850A87059; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 19 Jul 2021 23:08:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9332ab86f8953a8710b9377d3fba46c986610254
X-Git-Newrev: 0d97fe503d0902e0a6aae1014dc760f4496b7dce
X-Patchwork-Hint: ignore
Message-Id: <20210803211009.E850A87059@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openal: bump to
 version 1.21.1
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
Content-Type: multipart/mixed; boundary="===============4384635673920127952=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============4384635673920127952==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0d97fe503d0902e0a6aae1014dc760f4496b7dce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: André Zwing <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openal/openal.hash | 2 +-
 package/openal/openal.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index 1592dd56b5..3f1a574e3e 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c32d10473457a8b545aab50070fe84be2b5b041e1f2099012777ee6be0057c13  openal-1.20.1.tar.gz
+sha256  8ac17e4e3b32c1af3d5508acfffb838640669b4274606b7892aa796ca9d7467f  openal-1.21.1.tar.gz
 sha256  d808ce217e5b611854da622b57ec29fe545584c48bc5352fae72a4b6e5074a15  COPYING
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index ed63abfb3f..a878e4847f 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.20.1
-OPENAL_SITE = $(call github,kcat,openal-soft,openal-soft-$(OPENAL_VERSION))
+OPENAL_VERSION = 1.21.1
+OPENAL_SITE = $(call github,kcat,openal-soft,$(OPENAL_VERSION))
 OPENAL_LICENSE = LGPL-2.0+
 OPENAL_LICENSE_FILES = COPYING
 OPENAL_INSTALL_STAGING = YES

--===============4384635673920127952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============4384635673920127952==--
