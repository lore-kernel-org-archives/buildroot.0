Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE7DEEB566
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87174410B7;
	Fri,  8 Sep 2023 20:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87174410B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfX3j3JpOQeu; Fri,  8 Sep 2023 20:01:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83E95410D7;
	Fri,  8 Sep 2023 20:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83E95410D7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F26201BF303
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8EDE416CC
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8EDE416CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7gl_tAMF6Ds for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:01:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0089D40220
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0089D40220
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E409386B2A; Fri,  8 Sep 2023 20:01:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 Sep 2023 21:47:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25e18c30636b5d3156dee860a0a0ab0e2b5fdb32
X-Git-Newrev: 0d68ad6afec153ad1268dafa8b98fb2197c2ef61
X-Patchwork-Hint: ignore
Message-Id: <20230908200147.E409386B2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-pam: bump version to 2.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d68ad6afec153ad1268dafa8b98fb2197c2ef61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.comm>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-pam/php-pam.hash | 2 +-
 package/php-pam/php-pam.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-pam/php-pam.hash b/package/php-pam/php-pam.hash
index c3eb49fbe7..be15237f7d 100644
--- a/package/php-pam/php-pam.hash
+++ b/package/php-pam/php-pam.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  fda3b5f719d51cb278351eedd3d7a96db75661324d81fdcf8072a4309121bc92  pam-2.2.3.tgz
+sha256  d5c818c73c9cde4d2118bb08322dec0b532f3be48c3ef7d3f23a05af5080eb24  pam-2.2.4.tgz
 sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php-pam/php-pam.mk b/package/php-pam/php-pam.mk
index c35ad4f5d0..a348fb9d44 100644
--- a/package/php-pam/php-pam.mk
+++ b/package/php-pam/php-pam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_PAM_VERSION = 2.2.3
+PHP_PAM_VERSION = 2.2.4
 PHP_PAM_SITE = http://pecl.php.net/get
 PHP_PAM_SOURCE = pam-$(PHP_PAM_VERSION).tgz
 PHP_PAM_LICENSE = PHP-3.01
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
