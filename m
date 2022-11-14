Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FCEC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 15:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 045228149E;
	Mon, 14 Nov 2022 15:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 045228149E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odORc3PJMILc; Mon, 14 Nov 2022 15:52:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44A4381467;
	Mon, 14 Nov 2022 15:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44A4381467
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2454B1BF2C5
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0083681306
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0083681306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1HDhkVe7dWp for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 15:51:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AA068145B
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 15:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AA068145B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC72E83958; Mon, 14 Nov 2022 15:51:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 16:44:34 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 9bcf96f48d995af76ac25f681844777b5c22d7ba
X-Git-Newrev: 97eae21f340660b58946e3ce0f6f9dee92509394
X-Patchwork-Hint: ignore
Message-Id: <20221114155133.EC72E83958@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/multipath-tools:
 add MULTIPATH_TOOLS_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=97eae21f340660b58946e3ce0f6f9dee92509394
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

cpe:2.3:a:opensvc:multipath-tools is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopensvc%3Amultipath-tools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit adf4d6f7295b08b177a01d177a3f0a54e1f20f4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/multipath-tools/multipath-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index ec5d853644..df3d5138e8 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -18,6 +18,7 @@ MULTIPATH_TOOLS_LICENSE_FILES = \
 	LICENSES/LGPL-2.0 \
 	LICENSES/LGPL-2.1 \
 	README.md
+MULTIPATH_TOOLS_CPE_ID_VENDOR = opensvc
 
 MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf
 MULTIPATH_TOOLS_MAKE_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
