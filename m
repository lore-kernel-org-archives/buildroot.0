Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B60C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:20:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BE9E60F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BE9E60F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8E30842F3;
	Wed,  4 Aug 2021 00:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMgzGmDP-ULR; Wed,  4 Aug 2021 00:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D3C8842FE;
	Wed,  4 Aug 2021 00:20:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 407B71BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2757240FB7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gW428x4CTB9o for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBED140F12
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2EFA381469; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:56:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 45524f10cd84855868c9be3901c2bd6ea1c9f079
X-Git-Newrev: e80a7523735edb02d5c2885ecb553bcaa9a59c42
X-Patchwork-Hint: ignore
Message-Id: <20210803211013.2EFA381469@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nginx-modsecurity:
 bump to version 1.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e80a7523735edb02d5c2885ecb553bcaa9a59c42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx-modsecurity/nginx-modsecurity.hash | 6 +++---
 package/nginx-modsecurity/nginx-modsecurity.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nginx-modsecurity/nginx-modsecurity.hash b/package/nginx-modsecurity/nginx-modsecurity.hash
index d2dd266ac1..fbaf1ca239 100644
--- a/package/nginx-modsecurity/nginx-modsecurity.hash
+++ b/package/nginx-modsecurity/nginx-modsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v1.0.1/modsecurity-nginx-v1.0.1.tar.gz.sha256
-sha256 def45a8db5bc9da14765eda75363457209a86c89538ccf5bfbd3aa02fa10833c modsecurity-nginx-v1.0.1.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v1.0.2/modsecurity-nginx-v1.0.2.tar.gz.sha256
+sha256  41a6660c50508c60df59f8f09c444d18ef8112a4c118cdc791a3992390b78c32  modsecurity-nginx-v1.0.2.tar.gz
 # Localy calculated
-sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4 LICENSE
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/nginx-modsecurity/nginx-modsecurity.mk b/package/nginx-modsecurity/nginx-modsecurity.mk
index 6d33403d66..90ef8ecd51 100644
--- a/package/nginx-modsecurity/nginx-modsecurity.mk
+++ b/package/nginx-modsecurity/nginx-modsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_MODSECURITY_VERSION = 1.0.1
+NGINX_MODSECURITY_VERSION = 1.0.2
 NGINX_MODSECURITY_SOURCE = modsecurity-nginx-v$(NGINX_MODSECURITY_VERSION).tar.gz
 NGINX_MODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v$(NGINX_MODSECURITY_VERSION)
 NGINX_MODSECURITY_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
