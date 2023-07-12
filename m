Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08F7EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F45541F8C;
	Wed, 12 Jul 2023 21:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F45541F8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuVUdaz4jPxE; Wed, 12 Jul 2023 21:02:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4082441F94;
	Wed, 12 Jul 2023 21:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4082441F94
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 035D21BF400
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D141561282
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D141561282
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n17iS5jGK6EP for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:02:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 016FB60F0B
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 016FB60F0B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E53EB86F34; Wed, 12 Jul 2023 21:02:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 23:00:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53ab50bb39ba9a6b1f287a2e6ee8aa98b5aa32be
X-Git-Newrev: 7aa9c8f8c0f99d29581d1e3f691afe0471de858e
X-Patchwork-Hint: ignore
Message-Id: <20230712210230.E53EB86F34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-redis: bump to version 4.5.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=7aa9c8f8c0f99d29581d1e3f691afe0471de858e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 209ff35b78..e27f87bd50 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  4ab691af57ac346c2e630ce2787a424f  redis-4.4.0.tar.gz
-sha256  7b8c87d19c45d3f1271b124858d2a5c13160c4e74d4835e28273400fa34d5228  redis-4.4.0.tar.gz
+md5  ad365234df634680d15294ddc87c42de  redis-4.5.5.tar.gz
+sha256  dc87a0bdef6c8bfe1ef1e1c40be7034390c2ae02d92dcd0c7ca1729443899880  redis-4.5.5.tar.gz
 # Locally computed sha256 checksums
 sha256  7801a39e3a1aec58a7ea7c9f4dc1238cf0922c36a1fc8eff0bb7d684ff6dd354  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index bbbd6f1df2..186702dc83 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 4.4.0
+PYTHON_REDIS_VERSION = 4.5.5
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/7a/05/671367bb466b3301bc4543fdad6ac107214ca327c8d97165b30246d87e88
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/53/30/128c5599bc3fa61488866be0228326b3e486be34480126f70e572043adf8
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
