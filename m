Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65122CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FDD6412F8;
	Wed, 17 Sep 2025 16:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GI4KDDGnT1wA; Wed, 17 Sep 2025 16:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6478F41313
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6478F41313;
	Wed, 17 Sep 2025 16:45:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16B95199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBBBF61242
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOD1VaE4oHA2 for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:45:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3300E6153B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3300E6153B
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E06585212; Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 18:42:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f2f93df4e3c4a2d9c0d33d6267b50d82d9ac3b6
X-Git-Newrev: 234b38ffdd1bb6f79228568780b96169eb426c65
X-Patchwork-Hint: ignore
Message-Id: <20250917164534.2E06585212@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypa-build: bump to version
 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=234b38ffdd1bb6f79228568780b96169eb426c65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pypa-build/python-pypa-build.hash | 4 ++--
 package/python-pypa-build/python-pypa-build.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
index e4e6a8f181..a259fd2d5e 100644
--- a/package/python-pypa-build/python-pypa-build.hash
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/build/json
-md5  f80cc64db8e7fd8f8403a5e8a0562d4d  build-1.2.2.tar.gz
-sha256  119b2fb462adef986483438377a13b2f42064a2a3a4161f24a0cca698a07ac8c  build-1.2.2.tar.gz
+md5  48f7fbc11051430eab3c1abe216bed7a  build-1.3.0.tar.gz
+sha256  698edd0ea270bde950f53aed21f3a0135672206f3911e0176261a31e0e07b397  build-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index 9404f08302..45ae7818c4 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPA_BUILD_VERSION = 1.2.2
+PYTHON_PYPA_BUILD_VERSION = 1.3.0
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/dd/bb/4a1b7e3a7520e310cf7bfece43788071604e1ccf693a7f0c4638c59068d6
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/25/1c/23e33405a7c9eac261dff640926b8b5adaed6a6eb3e1767d441ed611d0c0
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
