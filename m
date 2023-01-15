Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE0EC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC2882521;
	Mon, 20 Feb 2023 23:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC2882521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJ2Yn768H2-x; Mon, 20 Feb 2023 23:17:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6493383336;
	Mon, 20 Feb 2023 23:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6493383336
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E182E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EE7241740
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EE7241740
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OdS2GtrW5Pdb for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65B2D41592
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65B2D41592
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 613E28648F; Mon, 20 Feb 2023 20:52:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:00:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fc457e3d320bea68eac1bab8bd759c1ba0f7b40b
X-Git-Newrev: 203cf2d8b7e9668ba51dc8a72636896e656e7e1b
X-Patchwork-Hint: ignore
Message-Id: <20230220205234.613E28648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-django: bump to
 version 4.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=203cf2d8b7e9668ba51dc8a72636896e656e7e1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 40526bc0ff..1d3035bb98 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  02e2222d064d800f37c6a0ba78ce87f3  Django-4.1.4.tar.gz
-sha256  d38a4e108d2386cb9637da66a82dc8d0733caede4c83c4afdbda78af4214211b  Django-4.1.4.tar.gz
+md5  6b6a47d7478ead15b0a0835841c433dc  Django-4.1.5.tar.gz
+sha256  ff56ebd7ead0fd5dbe06fe157b0024a7aaea2e0593bb3785fb594cf94dad58ef  Django-4.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 96ec53f82c..e08de68954 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.1.4
+PYTHON_DJANGO_VERSION = 4.1.5
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/de/7d/ca5d224f7d345b0defd0a57c6deb0c6115fbe5304e4d9571f728b617f1a3
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/41/c8/b3c469353f9d1b7f0e99b45520582b891da02cd87408bc867affa6e039a3
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
