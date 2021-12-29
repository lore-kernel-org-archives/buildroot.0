Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B7BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 23:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99B7481471;
	Wed, 29 Dec 2021 23:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WUBq-qS2NVc7; Wed, 29 Dec 2021 23:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED4468143C;
	Wed, 29 Dec 2021 23:14:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAD4A1BF280
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 23:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA6724091E
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 23:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kfmp4cd27Tah for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 23:14:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30EAE408E2
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 23:14:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9B30782C83; Wed, 29 Dec 2021 23:08:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 00:14:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b59c4c1658c5d864ea0e77f62141980a3eab6a87
X-Git-Newrev: bcb85b2e59902c1f570fb0545b38a677d088841f
X-Patchwork-Hint: ignore
Message-Id: <20211229230817.9B30782C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django-enumfields: bump to
 version
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcb85b2e59902c1f570fb0545b38a677d088841f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-django-enumfields/python-django-enumfields.hash | 6 +++---
 package/python-django-enumfields/python-django-enumfields.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-django-enumfields/python-django-enumfields.hash b/package/python-django-enumfields/python-django-enumfields.hash
index 84eb028e65..352fa8d907 100644
--- a/package/python-django-enumfields/python-django-enumfields.hash
+++ b/package/python-django-enumfields/python-django-enumfields.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django-enumfields/json
-md5	c9725a2c31ca2949d111815742335279  django-enumfields-1.0.0.tar.gz
-sha256	5b0e2dd5973337717ca6bd5a7d9e167e6ae01203c160d4761b88837c4678f219  django-enumfields-1.0.0.tar.gz
+md5	 e06bcaecd583ee40e30d556bfcbf0d66  django-enumfields-2.1.1.tar.gz
+sha256  f64841732a9c343f5071220e0abcf5f51c9472c06e3c33d7c6a7ec27b6087561  django-enumfields-2.1.1.tar.gz
 # Locally computed sha256 checksums
-sha256	5548de8c163dc57bd0a4f5772f1509f2c04f1390251c98ebf060c9d52a223f57  LICENSE
+sha256  75b9c8c2514f22d66070ffc975c4d3132de01e0cc7b3a9662731bcb46cd2a042  LICENSE
diff --git a/package/python-django-enumfields/python-django-enumfields.mk b/package/python-django-enumfields/python-django-enumfields.mk
index 0121bd1173..20abb5bf6a 100644
--- a/package/python-django-enumfields/python-django-enumfields.mk
+++ b/package/python-django-enumfields/python-django-enumfields.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_ENUMFIELDS_VERSION = 1.0.0
+PYTHON_DJANGO_ENUMFIELDS_VERSION = 2.1.1
 PYTHON_DJANGO_ENUMFIELDS_SOURCE = django-enumfields-$(PYTHON_DJANGO_ENUMFIELDS_VERSION).tar.gz
-PYTHON_DJANGO_ENUMFIELDS_SITE = https://files.pythonhosted.org/packages/b7/56/3f4e8d8ef6d5577a1b75b3cfae6dff819afd030e3a519a326ec7a7a0b74f
+PYTHON_DJANGO_ENUMFIELDS_SITE = https://files.pythonhosted.org/packages/24/a8/aaf2b5ddb697c9bcab53c32cfebe11e536502e07c30646b4756e7214b685
 PYTHON_DJANGO_ENUMFIELDS_SETUP_TYPE = setuptools
 PYTHON_DJANGO_ENUMFIELDS_LICENSE = MIT
 PYTHON_DJANGO_ENUMFIELDS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
