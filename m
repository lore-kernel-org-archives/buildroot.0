Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3544DC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E239B607CA;
	Mon,  5 Dec 2022 11:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E239B607CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VK0ge-p_n_zc; Mon,  5 Dec 2022 11:36:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F91B60D64;
	Mon,  5 Dec 2022 11:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F91B60D64
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 079821BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82DFE415FB
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82DFE415FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3AmI4cHyS1y for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8838341602
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8838341602
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8626F85BA2; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e6c204f51f5696aa056324a5a30ac5d23648e8f
X-Git-Newrev: f0b9199cc4210fa5a5b51b84181c49d055a034b1
X-Patchwork-Hint: ignore
Message-Id: <20221205112602.8626F85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iso8601: bump to version
 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0b9199cc4210fa5a5b51b84181c49d055a034b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date update:
https://github.com/micktwomey/pyiso8601/commit/406db6f23ffbf6815a320c30be070b89d28e2974

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-iso8601/python-iso8601.hash | 6 +++---
 package/python-iso8601/python-iso8601.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-iso8601/python-iso8601.hash b/package/python-iso8601/python-iso8601.hash
index 76dd5ec452..7c6d3f3ded 100644
--- a/package/python-iso8601/python-iso8601.hash
+++ b/package/python-iso8601/python-iso8601.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iso8601/json
-md5  d6fe8ccc847aaf8ac965da3b6023e697  iso8601-0.1.14.tar.gz
-sha256  8aafd56fa0290496c5edbb13c311f78fa3a241f0853540da09d9363eae3ebd79  iso8601-0.1.14.tar.gz
+md5  29dd454d638bd684bd3466583f6724dc  iso8601-1.1.0.tar.gz
+sha256  32811e7b81deee2063ea6d2e94f8819a86d1f3811e49d23623a41fa832bef03f  iso8601-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  116d368d14a8cf0061027c944c60ee20b476ce42814818a7d627396906761f16  LICENSE
+sha256  516b02cd11e78c37a04f9effadd85af0483dda7ab1e715eef1cc94f97dc49e13  LICENSE
diff --git a/package/python-iso8601/python-iso8601.mk b/package/python-iso8601/python-iso8601.mk
index 3f128d15e4..68bf69933a 100644
--- a/package/python-iso8601/python-iso8601.mk
+++ b/package/python-iso8601/python-iso8601.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ISO8601_VERSION = 0.1.14
+PYTHON_ISO8601_VERSION = 1.1.0
 PYTHON_ISO8601_SOURCE = iso8601-$(PYTHON_ISO8601_VERSION).tar.gz
-PYTHON_ISO8601_SITE = https://files.pythonhosted.org/packages/f9/ed/b97abc7877e5b253eef96a469f47d617b0ebcccc735405fa1a620c7ee833
+PYTHON_ISO8601_SITE = https://files.pythonhosted.org/packages/31/8c/1c342fdd2f4af0857684d16af766201393ef53318c15fa785fcb6c3b7c32
 PYTHON_ISO8601_SETUP_TYPE = setuptools
 PYTHON_ISO8601_LICENSE = MIT
 PYTHON_ISO8601_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
