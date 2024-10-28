Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD26D33990
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5766B6066A;
	Mon, 28 Oct 2024 14:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whv5PkprZzan; Mon, 28 Oct 2024 14:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4177B605C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4177B605C2;
	Mon, 28 Oct 2024 14:41:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CD145C1E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B0D6402EB
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdOxw3HEuy37 for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60BF440207
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60BF440207
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BF1F8430B; Mon, 28 Oct 2024 14:40:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 14:47:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 153ba5f2475594aa4c655d8e793863516d22c49f
X-Git-Newrev: 37edaae849f4a3441722df17aaac328225e469e8
X-Patchwork-Hint: ignore
Message-Id: <20241028144052.4BF1F8430B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysmi: bump to version 1.5.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=37edaae849f4a3441722df17aaac328225e469e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to adding contributors.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pysmi/python-pysmi.hash | 6 +++---
 package/python-pysmi/python-pysmi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index 729b980032..39a76fc740 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5  f99b37bb4a31a9cfaedc8b7f269ad7b8  pysmi-1.5.0.tar.gz
-sha256  e42bcd3961de71d58186f7a7fa6adac133701ae74cd19e6376289d89593b0af2  pysmi-1.5.0.tar.gz
+md5  84ff7ba2166c022b194c271f43b14c56  pysmi-1.5.5.tar.gz
+sha256  ad96dc983370e2b29a37dcc3af4ca6948127522b629bece23320ca0698c1b605  pysmi-1.5.5.tar.gz
 # Locally computed sha256 checksums
-sha256  46aa9a218d0f066d2565b826b08872227480e93f561eadf4d994213b08882b8a  LICENSE.rst
+sha256  bc211b99a3eb46f3b1f64f8152dffc869d3bc4bffed82545732ef9e34628513b  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index f747864def..753105928c 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 1.5.0
+PYTHON_PYSMI_VERSION = 1.5.5
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/59/d9/136ca19b66a917377a3b40f390f525eeeb21122dba7562a726bfb2d3629e
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/dc/fb/8461c21d0893c72492100b35fce128b057c4e615e79b0ce4496412ffec0c
 PYTHON_PYSMI_SETUP_TYPE = pep517
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
