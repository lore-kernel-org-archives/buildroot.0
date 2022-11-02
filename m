Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC2EC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 23:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 903A34174C;
	Wed,  2 Nov 2022 23:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 903A34174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nFIKxtWvoIfB; Wed,  2 Nov 2022 23:01:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FCAC41741;
	Wed,  2 Nov 2022 23:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FCAC41741
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 511A71BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BDDF41729
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BDDF41729
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uxlqasVKcYqc for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 23:01:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EED441728
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 23:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EED441728
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2993087B4D; Wed,  2 Nov 2022 23:01:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 23:59:13 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2c03d4ea2a1c2be88b6ad4bc932a13bac0ed1223
X-Git-Newrev: 16fdaac29da7c57f940ab6a8b2e663fbd5b1b9c9
X-Patchwork-Hint: ignore
Message-Id: <20221102230148.2993087B4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl_433: add
 RTL_433_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=16fdaac29da7c57f940ab6a8b2e663fbd5b1b9c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

cpe:2.3:a:rtl_433_project:rtl_433 is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Artl_433_project%3Artl_433

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 69a2a96b53f7d7552e9dd021ddd748bad74768c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl_433/rtl_433.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index 8326caedb2..74a0b54a3d 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -8,6 +8,7 @@ RTL_433_VERSION = 21.12
 RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
+RTL_433_CPE_ID_VENDOR = rtl_433_project
 
 # Force Release build to remove ASAN.
 RTL_433_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
