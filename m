Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D7FC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7142042AF6;
	Mon, 20 Feb 2023 22:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7142042AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CXPpZvlOVPtl; Mon, 20 Feb 2023 22:04:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29AF94EDCF;
	Mon, 20 Feb 2023 22:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29AF94EDCF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CD431BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 402F640C30
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 402F640C30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RcGWXQ-Ti66U for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79E47416AF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79E47416AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A52E86494; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:30:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e8a8ed95901a663fff43217b7c73530eff25d757
X-Git-Newrev: c75ac80eeaa30b3888f20e0c32df7a3e5c9172b5
X-Patchwork-Hint: ignore
Message-Id: <20230220205203.6A52E86494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-redis: bump to
 version 4.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c75ac80eeaa30b3888f20e0c32df7a3e5c9172b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to syntax update:
https://github.com/redis/redis-py/commit/2a0405d07e20ac7f695ff67415ad6c8368fd6066

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-redis/python-redis.hash | 6 +++---
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 9465e251f8..209ff35b78 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  15f05dbef3d166c6244f7afa6c3cacf8  redis-4.3.4.tar.gz
-sha256  ddf27071df4adf3821c4f2ca59d67525c3a82e5f268bed97b813cb4fabf87880  redis-4.3.4.tar.gz
+md5  4ab691af57ac346c2e630ce2787a424f  redis-4.4.0.tar.gz
+sha256  7b8c87d19c45d3f1271b124858d2a5c13160c4e74d4835e28273400fa34d5228  redis-4.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256  790148d8c12f8a38b2707a74be2343316bad126995ff54801a181b8b231ba124  LICENSE
+sha256  7801a39e3a1aec58a7ea7c9f4dc1238cf0922c36a1fc8eff0bb7d684ff6dd354  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 7c18f31507..bbbd6f1df2 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 4.3.4
+PYTHON_REDIS_VERSION = 4.4.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/8f/d4/78ef2d3f316041fa6c92daa7ac2c8056c39858c3775fad35fd84b9b3a6fb
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/7a/05/671367bb466b3301bc4543fdad6ac107214ca327c8d97165b30246d87e88
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
