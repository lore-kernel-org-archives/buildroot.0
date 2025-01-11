Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9DFC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ED914F602;
	Fri, 28 Feb 2025 16:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnobF2eyb5aE; Fri, 28 Feb 2025 16:56:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB27A4F4E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB27A4F4E8;
	Fri, 28 Feb 2025 16:56:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BC4568
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7217460C3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6EXlJyQNbyt for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 810F842D5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 810F842D5B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CF4987C2C; Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 19:05:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b5ea2d56b1cd7184bfa8701f168399e97635b5bf
X-Git-Newrev: 23e65b03a7bddb50bf7d1928557388ca4ce571e8
X-Patchwork-Hint: ignore
Message-Id: <20250228163006.7CF4987C2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-s3transfer:
 bump to version 0.10.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=23e65b03a7bddb50bf7d1928557388ca4ce571e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index 9b2c7d6282..030a7c0962 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  3c81bf7128a462187e9a88d9f400b5b4  s3transfer-0.10.3.tar.gz
-sha256  4f50ed74ab84d474ce614475e0b8d5047ff080810aac5d01ea25231cfc944b0c  s3transfer-0.10.3.tar.gz
+md5  cc2ee5c0de564fe24f26490597a9a8a5  s3transfer-0.10.4.tar.gz
+sha256  29edc09801743c21eb5ecbc617a152df41d3c287f67b615f73e5f750583666a7  s3transfer-0.10.4.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index dad4033c02..1f7b38a35a 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.10.3
+PYTHON_S3TRANSFER_VERSION = 0.10.4
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/a0/a8/e0a98fd7bd874914f0608ef7c90ffde17e116aefad765021de0f012690a2
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/c0/0a/1cdbabf9edd0ea7747efdf6c9ab4e7061b085aa7f9bfc36bb1601563b069
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
