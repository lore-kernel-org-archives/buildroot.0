Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9032DCD37B3
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 06:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4734E4117E;
	Sun, 17 Sep 2023 06:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4734E4117E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iq33ddFybrCm; Sun, 17 Sep 2023 06:50:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D31D4117C;
	Sun, 17 Sep 2023 06:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D31D4117C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D82DE1BF424
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 06:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BED3C813F4
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 06:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BED3C813F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ninm6sgr8wwr for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 06:50:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1F00813F3
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 06:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1F00813F3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0BD187107; Sun, 17 Sep 2023 06:50:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 08:36:53 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: a256ff6080d4a93e33417ca4913e30be566fb8f5
X-Git-Newrev: 44919c0a6efe04d5f278edbde713e18a31805185
X-Patchwork-Hint: ignore
Message-Id: <20230917065039.C0BD187107@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libheif: add
 LIBHEIF_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=44919c0a6efe04d5f278edbde713e18a31805185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

cpe:2.3:a:struktur:libheif is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Astruktur%3Alibheif

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 270b7c017def05a4b66a892f5a49e3e40dcbef8c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libheif/libheif.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 9c6c2829cf..65e64a02f7 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -8,6 +8,7 @@ LIBHEIF_VERSION = 1.16.2
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
+LIBHEIF_CPE_ID_VENDOR = struktur
 LIBHEIF_INSTALL_STAGING = YES
 LIBHEIF_CONF_OPTS = \
 	-DCMAKE_CXX_FLAGS="-std=c++11" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
