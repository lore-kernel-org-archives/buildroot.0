Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DD2C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C1E981FB0;
	Thu,  3 Nov 2022 20:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C1E981FB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Cxq-DgqLhbs; Thu,  3 Nov 2022 20:58:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE7BB81FAD;
	Thu,  3 Nov 2022 20:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE7BB81FAD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1090A1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 557C540BF3
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 557C540BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1fxVWykSAyx for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C027940BD3
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C027940BD3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBCAD87BCA; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4046164fd70fde0b265875a91c96daef01e29205
X-Git-Newrev: 3e9322e0ad4c29fde3eb4e816ce84182bfba593a
X-Patchwork-Hint: ignore
Message-Id: <20221103205510.BBCAD87BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-channels-redis:
 bump to version 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e9322e0ad4c29fde3eb4e816ce84182bfba593a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-channels-redis/python-channels-redis.hash | 4 ++--
 package/python-channels-redis/python-channels-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-channels-redis/python-channels-redis.hash b/package/python-channels-redis/python-channels-redis.hash
index 5c98953fa1..eaab5814a6 100644
--- a/package/python-channels-redis/python-channels-redis.hash
+++ b/package/python-channels-redis/python-channels-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels-redis/json
-md5  9ec9ffd467e181906f257d6c0dbabf45  channels_redis-2.4.1.tar.gz
-sha256  ddfa0c067085fdce24fb80d9c0b848638cbdbf0e1167f14eb2e99d635ad216e6  channels_redis-2.4.1.tar.gz
+md5  82898cb3b50bb19e8484b80b4d940910  channels_redis-4.0.0.tar.gz
+sha256  122414f29f525f7b9e0c9d59cdcfc4dc1b0eecba16fbb6a1c23f1d9b58f49dcb  channels_redis-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels-redis/python-channels-redis.mk b/package/python-channels-redis/python-channels-redis.mk
index c2c6f59c3c..727f403aaf 100644
--- a/package/python-channels-redis/python-channels-redis.mk
+++ b/package/python-channels-redis/python-channels-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_REDIS_VERSION = 2.4.1
+PYTHON_CHANNELS_REDIS_VERSION = 4.0.0
 PYTHON_CHANNELS_REDIS_SOURCE = channels_redis-$(PYTHON_CHANNELS_REDIS_VERSION).tar.gz
-PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/87/a9/8d11c32ae6bf3a2cc893185f7d1e03b80bda680131a08473c07ed1fe591d
+PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/8a/8d/bf96c62e3ca6c5ae59eb3482804afbe026c1c98b05b3ab65a0d46663644a
 PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
