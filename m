Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDABDC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EE6440569;
	Mon,  5 Dec 2022 11:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EE6440569
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBU8CnoYQr-Y; Mon,  5 Dec 2022 11:34:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4EF940578;
	Mon,  5 Dec 2022 11:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4EF940578
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BCFC1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E063C40576
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E063C40576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hEJwAfYxkQF8 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83AA040545
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83AA040545
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80E3E85B9B; Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5021429999c957e2683ad4d11ca43ba411d8b45
X-Git-Newrev: 57117dd41a76cff06a44f1568d90e59cd2494753
X-Patchwork-Hint: ignore
Message-Id: <20221205112601.80E3E85B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: bump to version
 4.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=57117dd41a76cff06a44f1568d90e59cd2494753
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 72adc30bb1..b9ae8a1da1 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  75ec07b3e00c79fd6e67fbee53786b7a  Django-4.0.8.tar.gz
-sha256  07e6433f263c3839939cfabeb6d7557841e0419e47759a7b7d37f6d44d40adcb  Django-4.0.8.tar.gz
+md5  60c54c37ecf9e5e635ee6bb07a13a9fa  Django-4.1.3.tar.gz
+sha256  678bbfc8604eb246ed54e2063f0765f13b321a50526bdc8cb1f943eda7fa31f1  Django-4.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 567d590f77..c90caa9635 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.0.8
+PYTHON_DJANGO_VERSION = 4.1.3
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/1a/de/08d8a349ed0e3e1999eb86ae0347cc9eaf634cd65f1eb80b9387ac1dbe3c
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d0/ab/33f9c2bd4cf7ff2d319131eca7231247f962f781ebc8a012ebe02582244a
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
