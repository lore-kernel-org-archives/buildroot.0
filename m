Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA89CDD0CB
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD467401CF;
	Tue, 22 Oct 2024 19:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Czwlz0ai33qd; Tue, 22 Oct 2024 19:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78FC3401FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78FC3401FE;
	Tue, 22 Oct 2024 19:17:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27443963
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C798C80D2F
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDWUyuiVcG4g for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0033D80D30
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0033D80D30
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDEE2861A1; Tue, 22 Oct 2024 19:16:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 21:11:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acd21ab5cc3d8c53fd2cca74ab1836cce58e8629
X-Git-Newrev: d0b258df1196bc7cd967bee0360d2d93cc29c143
X-Patchwork-Hint: ignore
Message-Id: <20241022191653.DDEE2861A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-s3transfer: bump to verison
 0.10.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0b258df1196bc7cd967bee0360d2d93cc29c143
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index c8b8f65d0c..9b2c7d6282 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  891737ce35aeb23b02a47a72c7f9b639  s3transfer-0.10.2.tar.gz
-sha256  0711534e9356d3cc692fdde846b4a1e4b0cb6519971860796e6bc4c7aea00ef6  s3transfer-0.10.2.tar.gz
+md5  3c81bf7128a462187e9a88d9f400b5b4  s3transfer-0.10.3.tar.gz
+sha256  4f50ed74ab84d474ce614475e0b8d5047ff080810aac5d01ea25231cfc944b0c  s3transfer-0.10.3.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index 1851bb8426..dad4033c02 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.10.2
+PYTHON_S3TRANSFER_VERSION = 0.10.3
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/cb/67/94c6730ee4c34505b14d94040e2f31edf144c230b6b49e971b4f25ff8fab
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/a0/a8/e0a98fd7bd874914f0608ef7c90ffde17e116aefad765021de0f012690a2
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
