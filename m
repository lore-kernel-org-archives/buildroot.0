Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A191FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 14:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 519E3408C5;
	Sat,  5 Feb 2022 14:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFSEb06tYDsi; Sat,  5 Feb 2022 14:02:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DAE64088F;
	Sat,  5 Feb 2022 14:02:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4091BF39F
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E85781493
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jcZQA-6Izz3O for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 14:01:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2DD880FF8
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 14:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6B43A82810; Sat,  5 Feb 2022 13:54:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 14:59:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e26b261ab5f67fe93414f364d62a7cc8eb75934c
X-Git-Newrev: c60848387baa3da4c4635c83282995cce6aab363
X-Patchwork-Hint: ignore
Message-Id: <20220205135422.6B43A82810@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: bump to version
 4.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c60848387baa3da4c4635c83282995cce6aab363
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with:
support/testing/run-tests tests.package.test_python_django.TestPythonPy3Django

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 89bc5ffb19..f78df56c5f 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  6c4a53d2ccb464bc3dd772c6f2f07df9  Django-3.2.11.tar.gz
-sha256  69c94abe5d6b1b088bf475e09b7b74403f943e34da107e798465d2045da27e75  Django-3.2.11.tar.gz
+md5  a86339c0e87241597afa8744704d9965  Django-4.0.2.tar.gz
+sha256  110fb58fb12eca59e072ad59fc42d771cd642dd7a2f2416582aa9da7a8ef954a  Django-4.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 25a645823b..652ca477ce 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.2.11
+PYTHON_DJANGO_VERSION = 4.0.2
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/20/86/e4348aac45bc83fc8e9dda2cfd81004b007c65b68c1499a4233acabdaa3b
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/61/84/676c840e8f1188a6c836e3224b97aa8be4c2e6857c690d6c564eb23a4975
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
