Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3137C71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79DFA4154A;
	Mon, 11 Sep 2023 19:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79DFA4154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eOZmucbB81Ip; Mon, 11 Sep 2023 19:20:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A669541503;
	Mon, 11 Sep 2023 19:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A669541503
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D83B1BF3AA
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 844F260FF3
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 844F260FF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id siTaUKC59zPZ for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:20:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9296C60BDC
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9296C60BDC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 810D686CC8; Mon, 11 Sep 2023 19:20:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 21:18:12 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 0a63c5d31dc2620100dda2c04206bfdfaf776855
X-Git-Newrev: 24acc5978d8d0e72c949781b8af34a95610074da
X-Patchwork-Hint: ignore
Message-Id: <20230911192022.810D686CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/dav1d: add
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3090394112229444387=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3090394112229444387==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=24acc5978d8d0e72c949781b8af34a95610074da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

cpe:2.3:a:videolan:dav1d is a valid identifier for
this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=dav1d

Signed-off-by: Clément Ramirez <clement.ramirez@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fd5a01eee30404d95fc442eaf6a017b2754b4a37)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============3090394112229444387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3090394112229444387==--
