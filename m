Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B8FEE49A8
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6E7B40B6B;
	Mon, 21 Aug 2023 20:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6E7B40B6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cKHo2AnFnoAI; Mon, 21 Aug 2023 20:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD2E640C03;
	Mon, 21 Aug 2023 20:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD2E640C03
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCC621BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37AE461129
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37AE461129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFYJ94kVqxHT for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3713C61124
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3713C61124
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 352A786026; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 19:21:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e763128b6b16becdb476f52af106302e18c26233
X-Git-Newrev: fd5a01eee30404d95fc442eaf6a017b2754b4a37
X-Patchwork-Hint: ignore
Message-Id: <20230821200125.352A786026@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dav1d: add
 DAV1D_CPE_ID_VENDOR
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
Content-Type: multipart/mixed; boundary="===============1680830854735281112=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1680830854735281112==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fd5a01eee30404d95fc442eaf6a017b2754b4a37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:videolan:dav1d is a valid identifier for
this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=dav1d

Signed-off-by: Clément Ramirez <clement.ramirez@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dav1d/dav1d.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 670a81d1c8..e90f53dc1a 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -9,6 +9,7 @@ DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
 DAV1D_LICENSE_FILES = COPYING
+DAV1D_CPE_ID_VENDOR = videolan
 DAV1D_INSTALL_STAGING = YES
 DAV1D_CONF_OPTS = \
 	-Denable_tests=false \

--===============1680830854735281112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1680830854735281112==--
