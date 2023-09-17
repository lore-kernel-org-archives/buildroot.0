Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155B5CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 06:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C16304117C;
	Sun, 17 Sep 2023 06:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C16304117C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZZKpPlN7ySN; Sun, 17 Sep 2023 06:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0898E41190;
	Sun, 17 Sep 2023 06:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0898E41190
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 222AB1BF424
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 06:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFD584159C
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 06:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFD584159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvmS1rGFLpyZ for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 06:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCF64416BC
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 06:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCF64416BC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8BFE87109; Sun, 17 Sep 2023 06:50:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 08:38:16 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 44919c0a6efe04d5f278edbde713e18a31805185
X-Git-Newrev: afdd2760e65c77b5063c76dc8f158c558de57c35
X-Patchwork-Hint: ignore
Message-Id: <20230917065039.C8BFE87109@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libde265: add
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=afdd2760e65c77b5063c76dc8f158c558de57c35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

cpe:2.3:a:struktur:libde265 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Astruktur%3Alibde265

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fd94f49566fc420913a3cabda9a87b44a822ea53)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
