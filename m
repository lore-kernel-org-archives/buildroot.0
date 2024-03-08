Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12329C54E4A
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 14:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9197E40569;
	Fri,  8 Mar 2024 14:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kC51eTm5vjid; Fri,  8 Mar 2024 14:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBC5640AE0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBC5640AE0;
	Fri,  8 Mar 2024 14:40:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9C1E1BF279
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 14:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6B9F6089F
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 14:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yb9IGi3foapu for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 14:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFDEF60737
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFDEF60737
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 14:40:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6FBB87EE1; Fri,  8 Mar 2024 14:40:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Mar 2024 15:38:45 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d947e87a91f962eb3f5f4432f30454823185cb23
X-Git-Newrev: bc3b3b46ca8c0740693bcade9b267d069d351aa0
X-Patchwork-Hint: ignore
Message-Id: <20240308144039.D6FBB87EE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-django:
 bump version to 4.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc3b3b46ca8c0740693bcade9b267d069d351aa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Tested with tests.package.test_python_django.TestPythonPy3Django.test_run in
Fedora 38 and Debian 11

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bc8d214e988b95b125ad2b9409286cbf820370b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index c2d41f977b..b68f4231fa 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  a16208af2aa54cbe97ff79ec4426da84  Django-4.1.13.tar.gz
-sha256  94a3f471e833c8f124ee7a2de11e92f633991d975e3fa5bdd91e8abd66426318  Django-4.1.13.tar.gz
+md5  ad84c2b9bbebaa26427a2a656fe5ceea  Django-4.2.6.tar.gz
+sha256  08f41f468b63335aea0d904c5729e0250300f6a1907bf293a65499496cdbc68f  Django-4.2.6.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index e094974078..79065ab60a 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.1.13
+PYTHON_DJANGO_VERSION = 4.2.6
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/34/09/300498ca0a5f37e0621b90a94c71fc8a4227be5488a3bd5550869c6e0049
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/23/7b/f47d10d870fabfcaa1fba403460a4e482ab7dbba4d715d43981d1f8c8d85
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
