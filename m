Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1905CC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:17:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CED0E60EBC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CED0E60EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA892842C1;
	Wed,  4 Aug 2021 00:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WIE89kAlQE8; Wed,  4 Aug 2021 00:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E04D842B8;
	Wed,  4 Aug 2021 00:17:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55E581BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 070BB40FA4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2HAdxdnZlUg for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2DCB40F10
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2418081484; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:56:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3335c8d8685119ebb5b2a9a6e575f3a5337c4d90
X-Git-Newrev: 45524f10cd84855868c9be3901c2bd6ea1c9f079
X-Patchwork-Hint: ignore
Message-Id: <20210803211013.2418081484@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nginx-dav-ext: bump
 version to 3.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=45524f10cd84855868c9be3901c2bd6ea1c9f079
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx-dav-ext/nginx-dav-ext.hash | 4 ++--
 package/nginx-dav-ext/nginx-dav-ext.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nginx-dav-ext/nginx-dav-ext.hash b/package/nginx-dav-ext/nginx-dav-ext.hash
index fbed87f0c0..07deab08db 100644
--- a/package/nginx-dav-ext/nginx-dav-ext.hash
+++ b/package/nginx-dav-ext/nginx-dav-ext.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6b004eed8ea16ad8de4d304027bf0413cc323a95914e58625a7dc066481aae3a  nginx-dav-ext-0.1.0.tar.gz
-sha256 40581cf424621965adaf1461e97129520ff4fcfb62ed9965ec6fd50b7f4ddfca  LICENSE
+sha256 d2499d94d82d4e4eac8425d799e52883131ae86a956524040ff2fd230ef9f859  nginx-dav-ext-3.0.0.tar.gz
+sha256 e377bb81e5024682a66438306e8ff9541d843d3831e480aec2f58eb8d83e48de  LICENSE
diff --git a/package/nginx-dav-ext/nginx-dav-ext.mk b/package/nginx-dav-ext/nginx-dav-ext.mk
index 695287ee2c..1b3071851a 100644
--- a/package/nginx-dav-ext/nginx-dav-ext.mk
+++ b/package/nginx-dav-ext/nginx-dav-ext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_DAV_EXT_VERSION = 0.1.0
+NGINX_DAV_EXT_VERSION = 3.0.0
 NGINX_DAV_EXT_SITE = $(call github,arut,nginx-dav-ext-module,v$(NGINX_DAV_EXT_VERSION))
 NGINX_DAV_EXT_LICENSE = BSD-2-Clause
 NGINX_DAV_EXT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
