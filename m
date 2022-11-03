Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B27BC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE8AD60A47;
	Mon,  5 Dec 2022 11:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE8AD60A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KSRN4up-1J1q; Mon,  5 Dec 2022 11:46:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F1F60C28;
	Mon,  5 Dec 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1F1F60C28
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3711D1BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 225744157B
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 225744157B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-2zaFwrSuvy for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 313AB4156C
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 313AB4156C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29F2485BA2; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84ceba764166a8533194d0c91a91a6b4d25b7c41
X-Git-Newrev: a8a4d299d3ab097788d2c2fdcabe8bfc4b46bfde
X-Patchwork-Hint: ignore
Message-Id: <20221205112605.29F2485BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-requests-toolbelt: bump to
 version 0.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8a4d299d3ab097788d2c2fdcabe8bfc4b46bfde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to url changing to https:
https://github.com/requests/toolbelt/commit/e9875f91861c81e437deb3d76a641e4cf0146ea4

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-requests-toolbelt/python-requests-toolbelt.hash | 6 +++---
 package/python-requests-toolbelt/python-requests-toolbelt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.hash b/package/python-requests-toolbelt/python-requests-toolbelt.hash
index 833570b113..28abf2c628 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.hash
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests-toolbelt/json
-md5  b1509735c4b4cf95df2619facbc3672e  requests-toolbelt-0.9.1.tar.gz
-sha256  968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0  requests-toolbelt-0.9.1.tar.gz
+md5  636d226d03632d013269aebbc85f4f4b  requests-toolbelt-0.10.1.tar.gz
+sha256  62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b1337626b2abb628a63d  requests-toolbelt-0.10.1.tar.gz
 # Locally computed sha256 checksums
-sha256  3a1a3cffa7abc000cbd726a664f56c33c532a55480f9e056dfe941cf93b7c37f  LICENSE
+sha256  1f8cf8bdacd98ed6d36d0fec0c07f7765acebd6e81205962ab5146023b3c858d  LICENSE
diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.mk b/package/python-requests-toolbelt/python-requests-toolbelt.mk
index 119c402785..8c141e3aa9 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.mk
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_TOOLBELT_VERSION = 0.9.1
+PYTHON_REQUESTS_TOOLBELT_VERSION = 0.10.1
 PYTHON_REQUESTS_TOOLBELT_SOURCE = requests-toolbelt-$(PYTHON_REQUESTS_TOOLBELT_VERSION).tar.gz
-PYTHON_REQUESTS_TOOLBELT_SITE = https://files.pythonhosted.org/packages/28/30/7bf7e5071081f761766d46820e52f4b16c8a08fef02d2eb4682ca7534310
+PYTHON_REQUESTS_TOOLBELT_SITE = https://files.pythonhosted.org/packages/0c/4c/07f01c6ac44f7784fa399137fbc8d0cdc1b5d35304e8c0f278ad82105b58
 PYTHON_REQUESTS_TOOLBELT_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_TOOLBELT_LICENSE = Apache-2.0
 PYTHON_REQUESTS_TOOLBELT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
