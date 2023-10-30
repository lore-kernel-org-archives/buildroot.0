Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D8EC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 10:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6198684D8F;
	Mon, 30 Oct 2023 10:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6198684D8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-_VXl8cHGYm; Mon, 30 Oct 2023 10:20:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9580A82213;
	Mon, 30 Oct 2023 10:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9580A82213
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3E91BF955
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCDBA705C9
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCDBA705C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TloL50vTyEzI for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 10:20:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05FB970A82
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 10:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05FB970A82
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E72228617D; Mon, 30 Oct 2023 10:20:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 11:18:16 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c2770f7cc3953aac1484af8895f2febd9d074cf7
X-Git-Newrev: b4989f431c5dc3b01cc6937d5b7f5952c00e16de
X-Patchwork-Hint: ignore
Message-Id: <20231030102016.E72228617D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libtommath: add
 LIBTOMMATH_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4989f431c5dc3b01cc6937d5b7f5952c00e16de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:libtom:libtommath is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/F0D99614-AA27-4713-ADD2-103647C8838B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 17ffb91551cc7c76427fd9675bc5e5a01d683afe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtommath/libtommath.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index 25d4e836bb..7b5305faf6 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -9,6 +9,7 @@ LIBTOMMATH_SITE = https://github.com/libtom/libtommath/releases/download/v$(LIBT
 LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz
 LIBTOMMATH_LICENSE = Unlicense
 LIBTOMMATH_LICENSE_FILES = LICENSE
+LIBTOMMATH_CPE_ID_VENDOR = libtom
 LIBTOMMATH_INSTALL_STAGING = YES
 LIBTOMMATH_INSTALL_TARGET = NO  # only static library
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
