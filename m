Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91624C001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C3494180F;
	Thu, 27 Jul 2023 10:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C3494180F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9oJNb3IadJAd; Thu, 27 Jul 2023 10:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DC46417F8;
	Thu, 27 Jul 2023 10:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DC46417F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 502651BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C766D60881
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C766D60881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GwCZgKsNuGYN for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:29:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02E5960BF9
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02E5960BF9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF9C4836B9; Thu, 27 Jul 2023 10:29:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 12:29:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c9de3681022c426f016f6cdf9d336095277e829
X-Git-Newrev: 791ead7cf7ef824dcbecda8f9409add0926e486a
X-Patchwork-Hint: ignore
Message-Id: <20230727102952.DF9C4836B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis-plus-plus: bump version to
 1.3.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=791ead7cf7ef824dcbecda8f9409add0926e486a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/sewenew/redis-plus-plus/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/redis-plus-plus/redis-plus-plus.hash | 2 +-
 package/redis-plus-plus/redis-plus-plus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis-plus-plus/redis-plus-plus.hash b/package/redis-plus-plus/redis-plus-plus.hash
index 93e58e2535..1d88365bc0 100644
--- a/package/redis-plus-plus/redis-plus-plus.hash
+++ b/package/redis-plus-plus/redis-plus-plus.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  a49a72fef26ed39d36a278fcc4e4d92822e111697b5992d8f26f70d16edc6c1f  redis-plus-plus-1.3.5.tar.gz
+sha256  85d9d9ff84c873c4a14bd28bee569a1f311285fad8d4f2fb0e472f65d4bb842a  redis-plus-plus-1.3.10.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/redis-plus-plus/redis-plus-plus.mk b/package/redis-plus-plus/redis-plus-plus.mk
index 4d1eb9361b..a286e2de33 100644
--- a/package/redis-plus-plus/redis-plus-plus.mk
+++ b/package/redis-plus-plus/redis-plus-plus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_PLUS_PLUS_VERSION = 1.3.5
+REDIS_PLUS_PLUS_VERSION = 1.3.10
 REDIS_PLUS_PLUS_SITE = $(call github,sewenew,redis-plus-plus,$(REDIS_PLUS_PLUS_VERSION))
 REDIS_PLUS_PLUS_LICENSE = Apache-2.0
 REDIS_PLUS_PLUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
