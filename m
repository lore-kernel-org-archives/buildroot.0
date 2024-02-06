Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CF4C4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C776741E67;
	Tue,  6 Feb 2024 10:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C776741E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xiartmqqaqrR; Tue,  6 Feb 2024 10:22:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A9B141E6A;
	Tue,  6 Feb 2024 10:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A9B141E6A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3FF1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC67D41E56
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC67D41E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgtJgaDGkqbG for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:20:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9D0A41E59
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9D0A41E59
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7C9286F41; Tue,  6 Feb 2024 10:20:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 11:18:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c83d1e930c23d0e62de4eedb99716bc5c0f6a29
X-Git-Newrev: dba7e8abaadae87a2e96de92f9f4f59dc590a77c
X-Patchwork-Hint: ignore
Message-Id: <20240206102053.D7C9286F41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: bump to version
 5.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=dba7e8abaadae87a2e96de92f9f4f59dc590a77c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 98c338f9d4..39fd9afdae 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  d7afe6a68b631725a1dac116a7832b10  Django-4.2.7.tar.gz
-sha256  8e0f1c2c2786b5c0e39fe1afce24c926040fad47c8ea8ad30aaf1188df29fc41  Django-4.2.7.tar.gz
+md5  5ff3c69d7e6b4f5ed378ec5713af8df7  Django-5.0.1.tar.gz
+sha256  8c8659665bc6e3a44fefe1ab0a291e5a3fb3979f9a8230be29de975e57e8f854  Django-5.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 9b710412fa..ed4f4bcdf1 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.2.7
+PYTHON_DJANGO_VERSION = 5.0.1
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/5c/62/0c6ab2f3ac9a242b4562b6be1c418685fa7d1ccb8ca302cdb97e0b23cf4b
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/53/82/c8e8ed137da1c72fa110e3be9ab0f26bcfcf6f3d2994601d164dfac86269
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
