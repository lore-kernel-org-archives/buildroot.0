Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36417C6FA82
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 07:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B22A54056B;
	Sun,  4 Sep 2022 07:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B22A54056B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IiKFCvTtHluJ; Sun,  4 Sep 2022 07:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C440440527;
	Sun,  4 Sep 2022 07:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C440440527
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C9F31BF2CC
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6426940509
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6426940509
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v5K8qgoB_0mi for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 07:24:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E04C404F9
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 07:24:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E04C404F9
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 26EFC88122; Sun,  4 Sep 2022 07:08:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Sep 2022 09:23:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3056de15f2786ed7322009328b91ccb32bab1971
X-Git-Newrev: e3dbb6aada02c434e2bfa646d5bf4c7323084b26
X-Patchwork-Hint: ignore
Message-Id: <20220904070851.26EFC88122@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: bump to version 1.4.243
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3dbb6aada02c434e2bfa646d5bf4c7323084b26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of README.md has changed because the link to the zstd license
has been added:

- ``
+ `- zstd (Dual BSD\GPLv2 Licenses) is from https://github.com/facebook/zstd`

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uuu/uuu.hash | 4 ++--
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 7291f93c52..de00c649b1 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  b8b7fcd0e8eca64a255bf2b964bfb39a97599670e5258858421b27ff86aac80f  uuu_source-1.4.224.tar.gz
+sha256  9fcfe317c379be1e274aae34c19e1fd57188107f8fd0cdd379fe4473aacc92b1  uuu_source-1.4.243.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
-sha256  52b1828ddb508a180cf9ad159b61e655c72dfb25ffce67eb0aef761d38a4398f  README.md
+sha256  584bfbb18b4c08b872d48b80419dd453307212a144134fb516bd6ddc0700c2e8  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 647254446f..7ed2599598 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.4.224
+UUU_VERSION = 1.4.243
 UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
