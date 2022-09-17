Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A361C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 14:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE12241C64;
	Sat, 17 Sep 2022 14:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE12241C64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GANehW9wQtwv; Sat, 17 Sep 2022 14:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85B24418BC;
	Sat, 17 Sep 2022 14:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85B24418BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6CC1BF575
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D1EA40153
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D1EA40153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DH71XmrXU5v0 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 14:40:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 661F44049C
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 661F44049C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 507588444E; Sat, 17 Sep 2022 14:40:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 16:27:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f95c7a9b5c4a3c9f90ce2af683621ace524200c
X-Git-Newrev: 2bf567f66fc04ae8d9a70de3a9dd40d039a5e9b4
X-Patchwork-Hint: ignore
Message-Id: <20220917144059.507588444E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-chardet: bump to version
 5.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bf567f66fc04ae8d9a70de3a9dd40d039a5e9b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to reformatting:
https://github.com/chardet/chardet/commit/c5e5d5a8f1b6e135a8bffd8d60b2f726bb168339

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-chardet/python-chardet.hash | 6 +++---
 package/python-chardet/python-chardet.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
index fb4260a227..7721814279 100644
--- a/package/python-chardet/python-chardet.hash
+++ b/package/python-chardet/python-chardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/chardet/json
-md5  bc9a5603d8d0994b2d4cbf255f99e654  chardet-4.0.0.tar.gz
-sha256  0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa  chardet-4.0.0.tar.gz
+md5  8013c248c098e165ac53d900e1a1278a  chardet-5.0.0.tar.gz
+sha256  0368df2bfd78b5fc20572bb4e9bb7fb53e2c094f60ae9993339e8671d0afb8aa  chardet-5.0.0.tar.gz
 # Locally computed
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
index 448877d056..1d737891a0 100644
--- a/package/python-chardet/python-chardet.mk
+++ b/package/python-chardet/python-chardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARDET_VERSION = 4.0.0
+PYTHON_CHARDET_VERSION = 5.0.0
 PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
-PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/ee/2d/9cdc2b527e127b4c9db64b86647d567985940ac3698eeabc7ffaccb4ea61
+PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/31/a2/12c090713b3d0e141f367236d3a8bdc3e5fca0d83ff3647af4892c16c205
 PYTHON_CHARDET_SETUP_TYPE = setuptools
 PYTHON_CHARDET_LICENSE = LGPL-2.1+
 PYTHON_CHARDET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
