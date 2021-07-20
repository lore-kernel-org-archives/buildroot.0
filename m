Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE37C07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:56:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F52060FF2
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F52060FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C56A4037A;
	Tue, 20 Jul 2021 21:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VY6v77m-kBxv; Tue, 20 Jul 2021 21:56:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 529AA402BD;
	Tue, 20 Jul 2021 21:56:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3AB61BF9BA
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF744402BC
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lhZe-rEWqVPl for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:56:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A7BB401C8
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:56:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BF1CD838D3; Tue, 20 Jul 2021 21:22:30 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:56:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3335c8d8685119ebb5b2a9a6e575f3a5337c4d90
X-Git-Newrev: 45524f10cd84855868c9be3901c2bd6ea1c9f079
X-Patchwork-Hint: ignore
Message-ID: <20210720212230.BF1CD838D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx-dav-ext: bump version to
 3.0.0
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
Message-ID: <20210720215625.rVcywHhtj5vgBaM-xSWyi6PhAaP14E8mi1HZHdvtS0w@z>

commit: https://git.buildroot.net/buildroot/commit/?id=45524f10cd84855868c9be3901c2bd6ea1c9f079
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
