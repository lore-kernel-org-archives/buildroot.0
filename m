Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2FDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:27:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B926660F46
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B926660F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83B314024A;
	Sat, 13 Nov 2021 14:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gYgh0HJngE4T; Sat, 13 Nov 2021 14:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FCDE40277;
	Sat, 13 Nov 2021 14:27:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 76DC61BF349
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BF9540264
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F9MlxEPwkFx3 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 14:27:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46E9B40255
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 14:27:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2DDB38C9BE; Sat, 13 Nov 2021 14:23:06 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 15:26:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 377c3e5f4c7580a5bf81586e1f41ddc0bdb83cff
X-Git-Newrev: 420c988045ccd1b82392f995e3d5cd9f79a73b3f
X-Patchwork-Hint: ignore
Message-Id: <20211113142306.2DDB38C9BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcurl: bump to
 version 7.80.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=420c988045ccd1b82392f995e3d5cd9f79a73b3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index b13f01c874..c488df57b1 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-7.79.1.tar.xz.asc
+# https://curl.se/download/curl-7.80.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  0606f74b1182ab732a17c11613cbbaf7084f2e6cca432642d0e3ad7c224c3689  curl-7.79.1.tar.xz
+sha256  a132bd93188b938771135ac7c1f3ac1d3ce507c1fcbef8c471397639214ae2ab  curl-7.80.0.tar.xz
 sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index a70ebe4113..24591f2e0a 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.79.1
+LIBCURL_VERSION = 7.80.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
