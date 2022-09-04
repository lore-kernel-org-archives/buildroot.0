Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1EFECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 07:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FCAB4056D;
	Sun,  4 Sep 2022 07:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FCAB4056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dfGo5-C-jdZb; Sun,  4 Sep 2022 07:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6145240550;
	Sun,  4 Sep 2022 07:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6145240550
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2161F1BF2CC
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F06D281453
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F06D281453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgI0bP6Ksjrp for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 07:53:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EAF181450
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 07:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EAF181450
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C2D9488210; Sun,  4 Sep 2022 07:38:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Sep 2022 09:51:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3dbb6aada02c434e2bfa646d5bf4c7323084b26
X-Git-Newrev: 2bc9cac446e606c4fcb5a4c86fbe99e48a76eae5
X-Patchwork-Hint: ignore
Message-Id: <20220904073817.C2D9488210@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{4, 10, 15}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bc9cac446e606c4fcb5a4c86fbe99e48a76eae5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

5.17.x is EOL.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index c8707ac711..9c39e15332 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  4a1c922a490eeabf5b44d4fde36de9ba5b71711b7352c6258716da41160db628  linux-5.17.15.tar.xz
-sha256  f3aa717243051f3fcca90ebfe26fe5c3a596c2f6047846e8d1724ea90df77b07  linux-5.15.53.tar.xz
-sha256  aae72f052b80858f77d40009faf9ccf09c38c8b33f56346d16c05f7e6a429cfe  linux-5.10.129.tar.xz
-sha256  fdc1b10a19d85b37eb0957ddd81acec1d5484f36c496493d8cdad75278737a47  linux-5.4.204.tar.xz
+sha256  c6a1d38c6fa3798341372d5cf0088ae806ccdc827e31ecbff8988e097ba5de50  linux-5.15.64.tar.xz
+sha256  a4dfd8bddb94bd35e42002d85f04b51dcfe862228e5a975f12bd59c456ab6803  linux-5.10.140.tar.xz
+sha256  bfb43241b72cd55797af68bea1cebe630d37664c0f9a99b6e9263a63a67e2dec  linux-5.4.211.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  621978d371b8f0a64e28e3b734af74d5a8d99b81298a99f336b17883e3a4e409  linux-4.9.322.tar.xz
-sha256  78b5494c205d9839b1905b2553c22596dee57c87586a8124186415c8b8f8f616  linux-4.14.287.tar.xz
-sha256  3787c8adccea6e35928dea855af0eb2e849966553505448972d6b3cf037acaf4  linux-4.19.251.tar.xz
+sha256  2bf3c2ddc76f9754112e990b27241282a564a41615fd8cb7964b9569911a887b  linux-4.9.326.tar.xz
+sha256  ec93b115e4748e4eead83656486f11e35b515cf5fa19d6d01be3d81f10350796  linux-4.14.291.tar.xz
+sha256  67de95c6080b5730bf14227478cfc3e4db807941d8a881d9824c25059b3ff549  linux-4.19.256.tar.xz
 # Locally computed
 sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
 sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c2e872abfb..fd04f87928 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -376,12 +376,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.9.322"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.287"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.251"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.204"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.129"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.53"	if BR2_KERNEL_HEADERS_5_15
+	default "4.9.326"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.291"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.256"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.211"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.140"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.64"	if BR2_KERNEL_HEADERS_5_15
 	default "5.17.15"	if BR2_KERNEL_HEADERS_5_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
