Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0203AC001DF
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 18:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9AFA4169B;
	Sun, 22 Oct 2023 18:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9AFA4169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqpvAfB7QYg5; Sun, 22 Oct 2023 18:38:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E64544168B;
	Sun, 22 Oct 2023 18:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E64544168B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39AAF1BF41F
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 18:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C73A40135
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 18:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C73A40135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d3hcrYZYxPwt for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 18:38:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E3B040012
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 18:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E3B040012
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03EE185E0F; Sun, 22 Oct 2023 18:38:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Oct 2023 20:37:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ef8369d987062247e8ba4f6e8b68ebf5b698af5
X-Git-Newrev: bc8d214e988b95b125ad2b9409286cbf820370b0
X-Patchwork-Hint: ignore
Message-Id: <20231022183840.03EE185E0F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: bump version to
 4.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc8d214e988b95b125ad2b9409286cbf820370b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with tests.package.test_python_django.TestPythonPy3Django.test_run in
Fedora 38 and Debian 11

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index ee1776b44f..b68f4231fa 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  3720c85a8c25cacbce2f95d345d0f5ad  Django-4.1.10.tar.gz
-sha256  56343019a9fd839e2e5bf203daf45f25af79d5bffa4c71d56eae4f4404d82ade  Django-4.1.10.tar.gz
+md5  ad84c2b9bbebaa26427a2a656fe5ceea  Django-4.2.6.tar.gz
+sha256  08f41f468b63335aea0d904c5729e0250300f6a1907bf293a65499496cdbc68f  Django-4.2.6.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 61dfd54dcd..79065ab60a 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.1.10
+PYTHON_DJANGO_VERSION = 4.2.6
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/70/d4/eded564fa5928f68771d082ec0eef4d023f9d19dfa1d2923305bc3e62afe
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/23/7b/f47d10d870fabfcaa1fba403460a4e482ab7dbba4d715d43981d1f8c8d85
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
