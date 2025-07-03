Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8618C83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 21:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDF7683C75;
	Thu,  3 Jul 2025 21:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lz1gX2B2saza; Thu,  3 Jul 2025 21:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9518A83B91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9518A83B91;
	Thu,  3 Jul 2025 21:06:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7BB115F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE6BB606FD
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJ_sKC6cIUVC for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 21:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F158F60638
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F158F60638
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:06:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC7748255A; Thu,  3 Jul 2025 21:06:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 22:58:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96899dd6920c451e6cba412da4cb8959f62b10bf
X-Git-Newrev: 8fe02bc114363d231c99b2cd864658d346faee8d
X-Patchwork-Hint: ignore
Message-Id: <20250703210620.DC7748255A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: bump to 5.2.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8fe02bc114363d231c99b2cd864658d346faee8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release Notes:
  https://www.djangoproject.com/weblog/2025/jul/02/bugfix-releases/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 0dd687164e..25200ef783 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  0b2266b4a1aaed942e0a94ce8a18913d  django-5.2.3.tar.gz
-sha256  335213277666ab2c5cac44a792a6d2f3d58eb79a80c14b6b160cd4afc3b75684  django-5.2.3.tar.gz
+md5  6ecc4875e8cdc08706faea1cc4740fdf  django-5.2.4.tar.gz
+sha256  a1228c384f8fa13eebc015196db7b3e08722c5058d4758d20cb287503a540d8f  django-5.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 77e9a11839..ca258bbea5 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.3
+PYTHON_DJANGO_VERSION = 5.2.4
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/c6/af/77b403926025dc6f7fd7b31256394d643469418965eb528eab45d0505358
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/9c/7e/034f0f9fb10c029a02daaf44d364d6bf2eced8c73f0d38c69da359d26b01
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
