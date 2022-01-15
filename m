Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9872EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 14:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E44C60AC5;
	Sat, 15 Jan 2022 14:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5dXUQ484Ru2j; Sat, 15 Jan 2022 14:21:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7441F60A87;
	Sat, 15 Jan 2022 14:21:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB1501BF293
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4AF9404ED
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Dsm6cQoO7l2 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 14:21:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF2C140004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 14:21:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7807682AE2; Sat, 15 Jan 2022 14:14:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 15:20:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 959f3826e827544a15b7f8ef168b1146d5be81d3
X-Git-Newrev: a4830cf9e4ec8b6d0146d373ff2f4a8196c59c89
X-Patchwork-Hint: ignore
Message-Id: <20220115141444.7807682AE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bento4: add BENTO4_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4830cf9e4ec8b6d0146d373ff2f4a8196c59c89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:axiosys:bento4 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aaxiosys%3Abento4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bento4/bento4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bento4/bento4.mk b/package/bento4/bento4.mk
index 6e17d1d53b..89ff2e4b85 100644
--- a/package/bento4/bento4.mk
+++ b/package/bento4/bento4.mk
@@ -9,6 +9,7 @@ BENTO4_SITE = $(call github,axiomatic-systems,Bento4,v$(BENTO4_VERSION))
 BENTO4_INSTALL_STAGING = YES
 BENTO4_LICENSE = GPL-2.0+
 BENTO4_LICENSE_FILES = Documents/LICENSE.txt
+BENTO4_CPE_ID_VENDOR = axiosys
 
 # Source/C++/Core/Ap4Config.h
 ifeq ($(BR2_ENDIAN),"BIG")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
