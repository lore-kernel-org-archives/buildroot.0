Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF1AC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 16:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8A8D40906;
	Mon, 21 Apr 2025 16:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1LUVlqc2IbQ; Mon, 21 Apr 2025 16:08:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C970408DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C970408DB;
	Mon, 21 Apr 2025 16:08:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DE0E1C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6296F80E24
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQNZveq6Pl4V for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 16:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA8D280EFC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA8D280EFC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:08:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 999B785FE1; Mon, 21 Apr 2025 16:08:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 17:38:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27a9837b50937d0ce8700760a3f75150a974770e
X-Git-Newrev: 140d2f5ab9e2df1899d3f2d6d0498c5e9e679da3
X-Patchwork-Hint: ignore
Message-Id: <20250421160802.999B785FE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-s3transfer: bump to version
 0.11.4
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
Content-Type: multipart/mixed; boundary="===============8709719591928868105=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8709719591928868105==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=140d2f5ab9e2df1899d3f2d6d0498c5e9e679da3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index bb17d0f18a..98b0ddc506 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  b0d1e6875220ce4b1b3db6d6c15b9ebd  s3transfer-0.11.2.tar.gz
-sha256  3b39185cb72f5acc77db1a58b6e25b977f28d20496b6e58d6813d75f464d632f  s3transfer-0.11.2.tar.gz
+md5  0e7bbc17a255568c93aea9dd52cb9d4b  s3transfer-0.11.4.tar.gz
+sha256  559f161658e1cf0a911f45940552c696735f5c74e64362e515f333ebed87d679  s3transfer-0.11.4.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index c61553b1c2..44a64e859a 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.11.2
+PYTHON_S3TRANSFER_VERSION = 0.11.4
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/62/45/2323b5928f86fd29f9afdcef4659f68fa73eaa5356912b774227f5cf46b5
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/0f/ec/aa1a215e5c126fe5decbee2e107468f51d9ce190b9763cb649f76bb45938
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt

--===============8709719591928868105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8709719591928868105==--
