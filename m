Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA77C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:12:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7587D60EFD
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7587D60EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EBB083544;
	Wed, 28 Jul 2021 19:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xAw-yYQItF2M; Wed, 28 Jul 2021 19:12:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F46383022;
	Wed, 28 Jul 2021 19:12:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAEC81C1135
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6AD340188
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:12:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPmtw_J5b83Z for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 19:12:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01E4140022
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 19:12:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A19D489098; Wed, 28 Jul 2021 18:37:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:05:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4aa04121d107cad84a4bd2f018a4803e521d9b2
X-Git-Newrev: 90bf922347d2870291c67df8774286b901551abb
X-Patchwork-Hint: ignore
Message-Id: <20210728183720.A19D489098@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/whois: bump to version 5.5.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=90bf922347d2870291c67df8774286b901551abb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/rfc1036/whois/blob/v5.5.10/debian/changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 699616ef1d..1478d60697 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20210328T030002Z/pool/main/w/whois/whois_5.5.9.dsc
-sha256  69088241ed33d2204f153c8005b312a69b60a1429075ff49f42f9f1f73a19c19  whois_5.5.9.tar.xz
+# From http://snapshot.debian.org/archive/debian/20210606T204545Z/pool/main/w/whois/whois_5.5.10.dsc
+sha256  2391037b079695d0e9fd3c85ab021809a539cf093d25b6c51ca65019a54158dd  whois_5.5.10.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 53bbe85f08..c5d0a6f2ad 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.9
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20210328T030002Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.10
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20210606T204545Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
