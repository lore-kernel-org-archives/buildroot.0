Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9E3CD5BB8
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 377B140361;
	Thu,  5 Sep 2024 19:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4O8qyRIy7s3S; Thu,  5 Sep 2024 19:46:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F37AF40391
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F37AF40391;
	Thu,  5 Sep 2024 19:46:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B0F31BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18D34406F7
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HA7MwamLRBew for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05BA1406E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05BA1406E4
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:46:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E308086E0E; Thu,  5 Sep 2024 19:46:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 21:46:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c5f342af1e0e9fbad71a7a45cc17dfcdbc6eb16b
X-Git-Newrev: c4a0df9ad2d1ec0a27bdfcf3cdb3e093ba5b7b70
X-Patchwork-Hint: ignore
Message-Id: <20240905194634.E308086E0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-sentry-sdk:
 bump to version 2.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4a0df9ad2d1ec0a27bdfcf3cdb3e093ba5b7b70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 6060b6cab7..2c1bb6c698 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  98621433d1f8565f1f00576d47be30ce  sentry_sdk-2.7.1.tar.gz
-sha256  25006c7e68b75aaa5e6b9c6a420ece22e8d7daec4b7a906ffd3a8607b67c037b  sentry_sdk-2.7.1.tar.gz
+md5  d56d6bf0acd0bd0663b420199c9afc29  sentry_sdk-2.13.0.tar.gz
+sha256  8d4a576f7a98eb2fdb40e13106e41f330e5c79d72a68be1316e7852cf4995260  sentry_sdk-2.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6d7ec62dc20e8b92cb88b89fb3b55ee8576505f3e1afa57952548f6eea5d008e  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 50ca854330..dcf2b2c420 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.7.1
+PYTHON_SENTRY_SDK_VERSION = 2.13.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/b8/63/310d89868a0dab17f6d7c1f35eba9c304dd06c2a17d0d26905738763b614
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/bb/41/97f673384dae5ed81cc2a568cc5c28e76deee85f8ba50def862e86150a5a
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
