Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7D2C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFF1C61048;
	Thu,  3 Nov 2022 21:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFF1C61048
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrQNLqHCH3VP; Thu,  3 Nov 2022 21:05:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D000560AAC;
	Thu,  3 Nov 2022 21:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D000560AAC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 111D31BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6999240BEF
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6999240BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id atjxRWdac9jy for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D70440520
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D70440520
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2871B87BCA; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 29c99ba046fa64db3fe990649745baf056e3ea7f
X-Git-Newrev: 24565bfe7941c9869b3398d315bf318ad03efa27
X-Patchwork-Hint: ignore
Message-Id: <20221103205512.2871B87BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-keyring: bump
 to version 23.9.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=24565bfe7941c9869b3398d315bf318ad03efa27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to line wrap:
https://github.com/jaraco/keyring/commit/7558cfe2eb2f1ffe3676905e9871466cbc9da24f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-keyring/python-keyring.hash | 6 +++---
 package/python-keyring/python-keyring.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index 692217f437..45f5bf7c84 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  1eb6d586ee5794de4bf39c1f513a3139  keyring-19.2.0.tar.gz
-sha256  91037ccaf0c9a112a76f7740e4a416b9457a69b66c2799421581bee710a974b3  keyring-19.2.0.tar.gz
+md5  60219a9a22467e15fcd09515b5b2ef39  keyring-23.9.3.tar.gz
+sha256  69b01dd83c42f590250fe7a1f503fc229b14de83857314b1933a3ddbf595c4a5  keyring-23.9.3.tar.gz
 # Locally computed sha256 checksums
-sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index 0e05738605..8d7833e14f 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 19.2.0
+PYTHON_KEYRING_VERSION = 23.9.3
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/ee/46/77fdb7cd2b0f1f684afbc35a59b3d7ebb6961fe528f97b86900002968914
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/2a/ef/28d3d5428108111dae4304a2ebec80d113aea9e78c939e25255425d486ff
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
