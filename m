Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AC8C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:45:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3420260720
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3420260720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0F714064F;
	Wed,  4 Aug 2021 00:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3hUr24-1dvD; Wed,  4 Aug 2021 00:45:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E219940691;
	Wed,  4 Aug 2021 00:45:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F7661BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8723F40F73
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNxJrhsAJOzd for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5C5E40E94
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0742C87884; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 23:48:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e9a37dd1c423808bfaecc5efb8dedaccb454ee7b
X-Git-Newrev: d625a1e21412f1a788bff548c94abcdf7ec25442
X-Patchwork-Hint: ignore
Message-Id: <20210803211021.0742C87884@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/vnstat: bump to
 version 2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=d625a1e21412f1a788bff548c94abcdf7ec25442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update indentation in hash file (two spaces)

https://github.com/vergoh/vnstat/releases/tag/v2.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vnstat/vnstat.hash | 4 ++--
 package/vnstat/vnstat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vnstat/vnstat.hash b/package/vnstat/vnstat.hash
index 6934c569b2..0f269039b1 100644
--- a/package/vnstat/vnstat.hash
+++ b/package/vnstat/vnstat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 89276e0a7281943edb554b874078278ad947dc312938a2451e03eb80679f7ff7  vnstat-2.6.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  4c28a1d8bc03c2b6e7ab96c876e07dd8ea174b7cad73b7190ecb2b9501e83e9e  vnstat-2.7.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index be1b75a6b3..c5836cf037 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VNSTAT_VERSION = 2.6
+VNSTAT_VERSION = 2.7
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPL-2.0
 VNSTAT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
