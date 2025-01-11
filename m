Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B450C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E3DF5021B;
	Fri, 28 Feb 2025 16:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkaRaBfWTJy7; Fri, 28 Feb 2025 16:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D806350214
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D806350214;
	Fri, 28 Feb 2025 16:56:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E7A3711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6B2342D9C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbEwvTuMCRQ7 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D9B042D57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D9B042D57
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4804886A52; Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 19:03:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 01292f2cbe81d08f970f57881b7344959d6e5f22
X-Git-Newrev: ee15cc7c9774c1174a5631845f6e011bb2452944
X-Patchwork-Hint: ignore
Message-Id: <20250228163006.4804886A52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-redis: bump to
 version 5.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee15cc7c9774c1174a5631845f6e011bb2452944
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 57d8557156..b6bee68ca2 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  a3210ca8428bd0ac9691789c08b14478  redis-5.2.0.tar.gz
-sha256  0b1087665a771b1ff2e003aa5bdd354f15a70c9e25d5a7dbf9c722c16528a7b0  redis-5.2.0.tar.gz
+md5  6e57c67eab7537b789c7a0f4a3068510  redis-5.2.1.tar.gz
+sha256  16f2e22dff21d5125e8481515e386711a34cbec50f0e44413dd7d9c060a54e0f  redis-5.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 2c1734151d..d02d4bd44b 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 5.2.0
+PYTHON_REDIS_VERSION = 5.2.1
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/53/17/2f4a87ffa4cd93714cf52edfa3ea94589e9de65f71e9f99cbcfa84347a53
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/47/da/d283a37303a995cd36f8b92db85135153dc4f7a8e4441aa827721b442cfb
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
