Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879DEC4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:14:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 467EB60EFD
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 467EB60EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CB73400EE;
	Wed, 28 Jul 2021 19:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1v_qv0_vDXEO; Wed, 28 Jul 2021 19:14:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 704A4402D7;
	Wed, 28 Jul 2021 19:14:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3D11C1135
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03A38608B6
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:12:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pFjING5BcugZ for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 19:12:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0DC4608AD
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 19:12:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8D192890A7; Wed, 28 Jul 2021 18:37:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:05:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f982f7043419dea2d21ebe20c1b383633a517674
X-Git-Newrev: 1c84624be36a356ad9f8ff4e061aad7d132d6f81
X-Patchwork-Hint: ignore
Message-Id: <20210728183720.8D192890A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libidn: bump to version 1.38
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c84624be36a356ad9f8ff4e061aad7d132d6f81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.com/libidn/libidn/-/blob/v1.38/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libidn/libidn.hash | 2 +-
 package/libidn/libidn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index 6269465e1c..c6cd668bbc 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  3c8e970d5cd80a8cb56f59c61611535336343942e3f1c81b0190c69993a692c2  libidn-1.37.tar.gz
+sha256  de00b840f757cd3bb14dd9a20d5936473235ddcba06d4bc2da804654b8bbf0f6  libidn-1.38.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 2180607a89..4a400d195d 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.37
+LIBIDN_VERSION = 1.38
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
