Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3314FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2C9C4030F;
	Tue, 28 Dec 2021 21:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5PHOGy3dyQG; Tue, 28 Dec 2021 21:03:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E32240193;
	Tue, 28 Dec 2021 21:03:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82AC01BF344
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2995A400BA
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h9r73FKBLLQd for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:02:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB74640253
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:02:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D369082977; Tue, 28 Dec 2021 20:56:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 21:47:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f040ffd1ae901ba86879090ea100038aa4c3403
X-Git-Newrev: 72de4a84fb53f708330f98eb84c1c7e07d8cea71
X-Patchwork-Hint: ignore
Message-Id: <20211228205626.D369082977@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yatl: bump to version
 20211217.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=72de4a84fb53f708330f98eb84c1c7e07d8cea71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-yatl/python-yatl.hash | 4 ++--
 package/python-yatl/python-yatl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yatl/python-yatl.hash b/package/python-yatl/python-yatl.hash
index 6f4623c516..8ce192bf95 100644
--- a/package/python-yatl/python-yatl.hash
+++ b/package/python-yatl/python-yatl.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/yatl/json
-md5  2954413784ced7e52513ae12b2183c88  yatl-20210326.1.tar.gz
-sha256  add729efdc2c9c06e0fcf640d97d4c500de611a38d5fdcc2ec12545d5ab14ca1  yatl-20210326.1.tar.gz
+md5  551136eba4c5551c01b051341b190641  yatl-20211217.1.tar.gz
+sha256  d22bf7abe40d9bdd16bd15824d2df65e65e405df6ecb8601fdc7c233bf6b3004  yatl-20211217.1.tar.gz
diff --git a/package/python-yatl/python-yatl.mk b/package/python-yatl/python-yatl.mk
index 3a9e2748a5..12a8039891 100644
--- a/package/python-yatl/python-yatl.mk
+++ b/package/python-yatl/python-yatl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YATL_VERSION = 20210326.1
+PYTHON_YATL_VERSION = 20211217.1
 PYTHON_YATL_SOURCE = yatl-$(PYTHON_YATL_VERSION).tar.gz
-PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/9d/76/5906d641f452dc2ee56795e2152dafc1d212cd411d1cb893af29a7d06e33
+PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/03/05/0be8164e8151fd8c96caeb2560f955dc2dc1a969f0868f48c046cd863fe6
 PYTHON_YATL_SETUP_TYPE = setuptools
 PYTHON_YATL_LICENSE = BSD-3-Clause
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
