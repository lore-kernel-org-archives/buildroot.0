Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D53C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D39142CEC;
	Mon, 20 Feb 2023 22:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D39142CEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9JT3eIQexhm; Mon, 20 Feb 2023 22:28:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BC664EED0;
	Mon, 20 Feb 2023 22:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BC664EED0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4B5D1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 641D4416E7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 641D4416E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3RN8gpMWlykn for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADAA9416E1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADAA9416E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E28886494; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 15:33:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d7c99eaa307d1417c8c8e222290df6512ee872ec
X-Git-Newrev: b9612601b037e6deb79af300e64e0557dda1be5c
X-Patchwork-Hint: ignore
Message-Id: <20230220205212.9E28886494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ply: bump to version
 2.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9612601b037e6deb79af300e64e0557dda1be5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ply/ply.hash | 2 +-
 package/ply/ply.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ply/ply.hash b/package/ply/ply.hash
index df01ae08e0..b6a56aa909 100644
--- a/package/ply/ply.hash
+++ b/package/ply/ply.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8cd92fc8784873fb0507bc11f3f62a31d0345c64914ddaadb958d8b2d6de0100  ply-2.2.0.tar.gz
+sha256  99be1ed3942370699cbfc7f493bc3ffd4601312a81471215ac7ccb2e04a0a8b2  ply-2.3.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ply/ply.mk b/package/ply/ply.mk
index b3c56bd9a5..dc02fc5472 100644
--- a/package/ply/ply.mk
+++ b/package/ply/ply.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PLY_VERSION = 2.2.0
+PLY_VERSION = 2.3.0
 PLY_SITE = $(call github,wkz,ply,$(PLY_VERSION))
 PLY_AUTORECONF = YES
 PLY_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
