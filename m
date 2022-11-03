Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426C3C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD80140545;
	Mon,  5 Dec 2022 11:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD80140545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xifMSAyx3MvV; Mon,  5 Dec 2022 11:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1604340522;
	Mon,  5 Dec 2022 11:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1604340522
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FAC41BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE65C405B0
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE65C405B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3_24fd54ekO for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6C1B40528
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6C1B40528
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C387885B9B; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59d2890c1e0bab8e9076d7a8759135da164511e8
X-Git-Newrev: 17475031193133ce70527b70a5530e853069a8f6
X-Patchwork-Hint: ignore
Message-Id: <20221205112603.C387885B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pip: bump to version 22.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=17475031193133ce70527b70a5530e853069a8f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date change:
https://github.com/pypa/pip/commit/874a2f8c39e531baaaebb47109a9a50f12a247a9

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pip/python-pip.hash | 6 +++---
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 69214110f8..d1442ca39d 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  efbdb4201a5e6383fb4d12e26f78f355  pip-21.2.4.tar.gz
-sha256  0eb8a1516c3d138ae8689c0c1a60fde7143310832f9dc77e11d8a4bc62de193b  pip-21.2.4.tar.gz
+md5  f0dd02265e7ccd2f8758c840fba64810  pip-22.3.tar.gz
+sha256  8182aec21dad6c0a49a2a3d121a87cd524b950e0b6092b181625f07ebdde7530  pip-22.3.tar.gz
 # Locally computed sha256 checksums
-sha256  23a7361c2b1581028bc623b9da2bd24997abcaa4781ace6ad444a37944f8dae1  LICENSE.txt
+sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 81fc87d5f0..0f2c5d8e02 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 21.2.4
+PYTHON_PIP_VERSION = 22.3
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/f8/08/7f92782ff571c7c7cb6c5eeb8ebbb1f68cb02bdb24e55c5de4dd9ce98bc3
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
