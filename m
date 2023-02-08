Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12C8C636D4
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61DBD82065;
	Wed,  8 Feb 2023 16:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61DBD82065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ydhcr0NSxGkZ; Wed,  8 Feb 2023 16:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8B4782063;
	Wed,  8 Feb 2023 16:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8B4782063
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83E6B1BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B5116113C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B5116113C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pAq1WlitxM9W for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:44:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9FFE60AFF
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9FFE60AFF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 962B584777; Wed,  8 Feb 2023 16:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 17:43:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 040896bd4338f7ca419766578db49af154b762c7
X-Git-Newrev: 41671deec7b00de10dcc372cdeee4400df1d76ee
X-Patchwork-Hint: ignore
Message-Id: <20230208164447.962B584777@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx-modsecurity: bump to version
 1.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=41671deec7b00de10dcc372cdeee4400df1d76ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx-modsecurity/nginx-modsecurity.hash | 4 ++--
 package/nginx-modsecurity/nginx-modsecurity.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nginx-modsecurity/nginx-modsecurity.hash b/package/nginx-modsecurity/nginx-modsecurity.hash
index fbaf1ca239..0cd2ee07cd 100644
--- a/package/nginx-modsecurity/nginx-modsecurity.hash
+++ b/package/nginx-modsecurity/nginx-modsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v1.0.2/modsecurity-nginx-v1.0.2.tar.gz.sha256
-sha256  41a6660c50508c60df59f8f09c444d18ef8112a4c118cdc791a3992390b78c32  modsecurity-nginx-v1.0.2.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v1.0.3/modsecurity-nginx-v1.0.3.tar.gz.sha256
+sha256  ae811c7208ac029cb7a99d6f63e03d3971797607517187f47620df39c1f78add  modsecurity-nginx-v1.0.3.tar.gz
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/nginx-modsecurity/nginx-modsecurity.mk b/package/nginx-modsecurity/nginx-modsecurity.mk
index 90ef8ecd51..a00c200469 100644
--- a/package/nginx-modsecurity/nginx-modsecurity.mk
+++ b/package/nginx-modsecurity/nginx-modsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_MODSECURITY_VERSION = 1.0.2
+NGINX_MODSECURITY_VERSION = 1.0.3
 NGINX_MODSECURITY_SOURCE = modsecurity-nginx-v$(NGINX_MODSECURITY_VERSION).tar.gz
 NGINX_MODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v$(NGINX_MODSECURITY_VERSION)
 NGINX_MODSECURITY_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
