Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596B9C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 14:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F3082C99;
	Mon,  8 Aug 2022 14:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F3082C99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kX4I-p1Cv2Z1; Mon,  8 Aug 2022 14:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22DC782C04;
	Mon,  8 Aug 2022 14:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22DC782C04
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB2111BF2A5
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B535681A5C
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B535681A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJsOSWNWEu6f for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 14:28:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5BC9817A3
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 14:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5BC9817A3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 23FE586FBA; Mon,  8 Aug 2022 14:14:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 16:28:36 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: bb30a034b1e4add4d6bb10f2a678ba60583c8cf6
X-Git-Newrev: 2fb84046c3a1381431105a3fe6c5a57d0bc53fec
X-Patchwork-Hint: ignore
Message-Id: <20220808141431.23FE586FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/assimp: add
 ASSIMP_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fb84046c3a1381431105a3fe6c5a57d0bc53fec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

cpe:2.3:a:assimp:assimp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aassimp%3Aassimp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6f9283d696820dab746a97a0411bf6d83bd424c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/assimp/assimp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 766b2c9b5a..3a187a9102 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -8,6 +8,7 @@ ASSIMP_VERSION = 5.1.6
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
+ASSIMP_CPE_ID_VENDOR = assimp
 ASSIMP_DEPENDENCIES = zlib
 ASSIMP_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
