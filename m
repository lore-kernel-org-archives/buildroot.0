Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8E5EEAA77
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A09460709;
	Thu, 14 Sep 2023 21:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A09460709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8myW-GDqh-nk; Thu, 14 Sep 2023 21:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDF02612C5;
	Thu, 14 Sep 2023 21:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDF02612C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DC7E1BF3E3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17BB441902
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17BB441902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 29eOHYOLPKKL for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A12A409DE
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A12A409DE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 353B586FF6; Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 22:56:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 270b7c017def05a4b66a892f5a49e3e40dcbef8c
X-Git-Newrev: fd94f49566fc420913a3cabda9a87b44a822ea53
X-Patchwork-Hint: ignore
Message-Id: <20230914210236.353B586FF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libde265: add
 LIBDE265_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd94f49566fc420913a3cabda9a87b44a822ea53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:struktur:libde265 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Astruktur%3Alibde265

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libde265/libde265.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 60424c0de6..208fa24e27 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -8,6 +8,7 @@ LIBDE265_VERSION = 1.0.12
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
+LIBDE265_CPE_ID_VENDOR = struktur
 LIBDE265_INSTALL_STAGING = YES
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
