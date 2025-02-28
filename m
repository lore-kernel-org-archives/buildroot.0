Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8681C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 23:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8507B6065A;
	Fri, 28 Feb 2025 23:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiF9mWjoe1pG; Fri, 28 Feb 2025 23:05:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 784B760BFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 784B760BFD;
	Fri, 28 Feb 2025 23:05:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B00901CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90252847A1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAzuBnlVkt8m for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 23:04:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8A0B84935
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8A0B84935
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:04:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4C5387D64; Fri, 28 Feb 2025 23:04:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 23:11:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0df577df87d61090a2bf4228e35a4b44a1fe1ded
X-Git-Newrev: 50aeed6b2323aed3f76f8a7dee6215955a3c45fd
X-Patchwork-Hint: ignore
Message-Id: <20250228230456.B4C5387D64@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-sentry-sdk:
 bump to version 2.21.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=50aeed6b2323aed3f76f8a7dee6215955a3c45fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to date range removal:
https://github.com/getsentry/sentry-python/commit/7473afb77d7f0ba534bf5fdcd22622b06a5f7e62

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 6 +++---
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 0bf0392c77..b1b816fa51 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  1ee9b58ddcc2227b8534c7ab9c5b8da7  sentry_sdk-2.20.0.tar.gz
-sha256  afa82713a92facf847df3c6f63cec71eb488d826a50965def3d7722aa6f0fdab  sentry_sdk-2.20.0.tar.gz
+md5  a24d71a651889b89c12983c6bd3d1abf  sentry_sdk-2.21.0.tar.gz
+sha256  a6d38e0fb35edda191acf80b188ec713c863aaa5ad8d5798decb8671d02077b6  sentry_sdk-2.21.0.tar.gz
 # Locally computed sha256 checksums
-sha256  6d7ec62dc20e8b92cb88b89fb3b55ee8576505f3e1afa57952548f6eea5d008e  LICENSE
+sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index a404bcda15..25b419f1e2 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.20.0
+PYTHON_SENTRY_SDK_VERSION = 2.21.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/68/e8/6a366c0cd5e129dda6ecb20ff097f70b18182c248d4c27e813c21f98992a
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/08/63/3f0e88709cf4af992e2813c27d8ba628a891db0805e3fcc6dc834e142c5b
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
