Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B44EEB566
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35C14414CE;
	Fri,  8 Sep 2023 20:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35C14414CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AuG26oU-LakW; Fri,  8 Sep 2023 20:02:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FA8441D77;
	Fri,  8 Sep 2023 20:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FA8441D77
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14DCE1BF99A
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFE63410D7
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFE63410D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YiB1f35qHprn for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:01:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D65B7410B7
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D65B7410B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C280B86B2B; Fri,  8 Sep 2023 20:01:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 Sep 2023 21:46:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c0ec66203ca841f0d4af383403300f7024990f9
X-Git-Newrev: c024ab1732b5fdf131ac8cfad5530225b976f610
X-Patchwork-Hint: ignore
Message-Id: <20230908200147.C280B86B2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-apcu: bump version to 5.1.22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c024ab1732b5fdf131ac8cfad5530225b976f610
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.comm>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-apcu/php-apcu.hash | 2 +-
 package/php-apcu/php-apcu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-apcu/php-apcu.hash b/package/php-apcu/php-apcu.hash
index 3aae4120d2..4a5eadf803 100644
--- a/package/php-apcu/php-apcu.hash
+++ b/package/php-apcu/php-apcu.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b99d40fafec06f4d132fcee53e7526ddbfc1d041ea6e04e17389dfad28f9c390  apcu-5.1.20.tgz
+sha256  010a0d8fd112e1ed7a52a356191da3696a6b76319423f7b0dfdeaeeafcb41a1e  apcu-5.1.22.tgz
 sha256  ecc8b74820c32fb82ddee80446205408585d75d1632ac959fb3cdf8eaf3877b5  LICENSE
diff --git a/package/php-apcu/php-apcu.mk b/package/php-apcu/php-apcu.mk
index d381c9054f..b8eeb9de7c 100644
--- a/package/php-apcu/php-apcu.mk
+++ b/package/php-apcu/php-apcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_APCU_VERSION = 5.1.20
+PHP_APCU_VERSION = 5.1.22
 PHP_APCU_SITE = http://pecl.php.net/get
 PHP_APCU_SOURCE = apcu-$(PHP_APCU_VERSION).tgz
 PHP_APCU_LICENSE = PHP-3.01
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
