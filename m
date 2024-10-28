Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026A4D33993
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F97660596;
	Mon, 28 Oct 2024 14:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEvNueNCINjU; Mon, 28 Oct 2024 14:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA306605A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA306605A8;
	Mon, 28 Oct 2024 14:40:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4882CAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35B8560632
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UM66eaFQktNE for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7595260596
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7595260596
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6258E8430D; Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 14:47:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 135b4408ebced679f05ef8f79d93475406b6285a
X-Git-Newrev: c39971d316155a76ad1495ecc4c19bee7b3f6b21
X-Patchwork-Hint: ignore
Message-Id: <20241028144052.6258E8430D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-redis: bump to version 5.2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c39971d316155a76ad1495ecc4c19bee7b3f6b21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 989cfd39f2..57d8557156 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  54db97ec8f7445c107d61829095ed915  redis-5.1.1.tar.gz
-sha256  f6c997521fedbae53387307c5d0bf784d9acc28d9f1d058abeac566ec4dbed72  redis-5.1.1.tar.gz
+md5  a3210ca8428bd0ac9691789c08b14478  redis-5.2.0.tar.gz
+sha256  0b1087665a771b1ff2e003aa5bdd354f15a70c9e25d5a7dbf9c722c16528a7b0  redis-5.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index a8123f225a..2c1734151d 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 5.1.1
+PYTHON_REDIS_VERSION = 5.2.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/e0/58/dcf97c3c09d429c3bb830d6075322256da3dba42df25359bd1c82b442d20
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/53/17/2f4a87ffa4cd93714cf52edfa3ea94589e9de65f71e9f99cbcfa84347a53
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
