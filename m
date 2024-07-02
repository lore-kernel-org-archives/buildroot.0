Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE9CC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0C0881FC7;
	Tue,  2 Jul 2024 07:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpTdr7DyrTfv; Tue,  2 Jul 2024 07:05:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA94281FF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA94281FF3;
	Tue,  2 Jul 2024 07:05:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A00A1BF980
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3620E40CF7
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGUCrF7PG5HY for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2918440D03
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2918440D03
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11F858397A; Tue,  2 Jul 2024 07:05:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 08:59:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c2dd4443c480f2338d1f8da63b39acfcbfb2cc8
X-Git-Newrev: 24e2d5f435118e3f37b4d3f5fa22f5fd90c720f6
X-Patchwork-Hint: ignore
Message-Id: <20240702070531.11F858397A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sentry-sdk: bump to version
 2.7.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=24e2d5f435118e3f37b4d3f5fa22f5fd90c720f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/getsentry/sentry-python/commit/f98f77f0a4078cc4f87e82d3a899b8a54d55a535

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 6 +++---
 package/python-sentry-sdk/python-sentry-sdk.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 2534a48221..6060b6cab7 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  94ba9002bbfaf8c443c496b05bbc32eb  sentry-sdk-1.39.2.tar.gz
-sha256  24c83b0b41c887d33328a9166f5950dc37ad58f01c9f2fbff6b87a6f1094170c  sentry-sdk-1.39.2.tar.gz
+md5  98621433d1f8565f1f00576d47be30ce  sentry_sdk-2.7.1.tar.gz
+sha256  25006c7e68b75aaa5e6b9c6a420ece22e8d7daec4b7a906ffd3a8607b67c037b  sentry_sdk-2.7.1.tar.gz
 # Locally computed sha256 checksums
-sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
+sha256  6d7ec62dc20e8b92cb88b89fb3b55ee8576505f3e1afa57952548f6eea5d008e  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index f1c5648f07..50ca854330 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 1.39.2
-PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/66/90/9deac5c137e9f0ede908757d886af77938ef28f94b24decedbdf98f1ca4d
+PYTHON_SENTRY_SDK_VERSION = 2.7.1
+PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/b8/63/310d89868a0dab17f6d7c1f35eba9c304dd06c2a17d0d26905738763b614
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
