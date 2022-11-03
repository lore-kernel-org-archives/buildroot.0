Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E66C4708C
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DCC84051B;
	Mon,  5 Dec 2022 11:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DCC84051B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1SYpB44EVPKj; Mon,  5 Dec 2022 11:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BB4140546;
	Mon,  5 Dec 2022 11:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BB4140546
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 121191BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E2E040574
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E2E040574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yx2_QmhpbSCO for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BBB440528
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BBB440528
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01B1985BBF; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:02:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 935edcfc311a9b76cc1d720b29985f89e686be3c
X-Git-Newrev: 22bfd5d15915a9e913233a5ee15df2540b165079
X-Patchwork-Hint: ignore
Message-Id: <20221205112606.01B1985BBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymodbus: bump to version
 3.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=22bfd5d15915a9e913233a5ee15df2540b165079
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pymodbus/python-pymodbus.hash | 9 +++++----
 package/python-pymodbus/python-pymodbus.mk   | 6 +++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 8e60d94e62..b5243567b7 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,4 +1,5 @@
-# sha256 locally computed
-sha256  088c7ece2a11cad652939719695c457f26f9148cd7d2f4a79872167925180ad5  pymodbus-2.2.0.tar.gz
-# Hash for license file
-sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  doc/LICENSE
+# md5, sha256 from https://pypi.org/pypi/pymodbus/json
+md5  25a8724539d0eac1b09d9b41812d86f9  pymodbus-3.0.0.tar.gz
+sha256  37c9b6f3e5c82f39ee42047ca48cbc9fd0c49a6731126789500191e9deea6cbc  pymodbus-3.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index d96e21a55c..2ed7e94afe 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 2.2.0
+PYTHON_PYMODBUS_VERSION = 3.0.0
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = $(call github,riptideio,pymodbus,v$(PYTHON_PYMODBUS_VERSION))
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/0f/5a/50e9492f98ef911af18c2b603bc003fef726e84d22bac2ce6e651643b29c
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
-PYTHON_PYMODBUS_LICENSE_FILES = doc/LICENSE
+PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
