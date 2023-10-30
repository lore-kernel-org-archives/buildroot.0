Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493E9C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 10:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0142A8546F;
	Mon, 30 Oct 2023 10:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0142A8546F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8gWoDq2MBQM; Mon, 30 Oct 2023 10:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30E8E85545;
	Mon, 30 Oct 2023 10:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30E8E85545
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56ECC1BF955
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D6AD8546F
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D6AD8546F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVN8KjTFhV4n for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 10:19:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34B1B85104
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 10:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B1B85104
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 231CE8616C; Mon, 30 Oct 2023 10:19:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 11:18:22 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: e6e88ccf8009447b5764e9cb023ac8fb3f0eec0b
X-Git-Newrev: b2a0d00ef064600c1d9ee2544f972f26e6e3b5e8
X-Patchwork-Hint: ignore
Message-Id: <20231030101903.231CE8616C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libtommath: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2a0d00ef064600c1d9ee2544f972f26e6e3b5e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
