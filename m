Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBAEC54795
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92D2470C89;
	Mon, 19 May 2025 10:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdCu6epoRWf6; Mon, 19 May 2025 10:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 970FC70C83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 970FC70C83;
	Mon, 19 May 2025 10:59:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E597FE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87717414C2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gqoKUHeRwuZ for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B25F7414C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B25F7414C5
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE71882A2E; Mon, 19 May 2025 10:40:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 21:55:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: df685627a202342de2dd69c6ba00f56b30f1ee71
X-Git-Newrev: 5d8d39fc4c4891adee2587ff1dd6627bacbbe75c
X-Patchwork-Hint: ignore
Message-Id: <20250519104001.AE71882A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-aniso8601: bump
 version to 10.0.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d8d39fc4c4891adee2587ff1dd6627bacbbe75c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://codeberg.org/nielsenb-jf/aniso8601/src/tag/v10.0.1/CHANGELOG.rst#aniso8601-10.0.1

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aniso8601/Config.in             | 2 +-
 package/python-aniso8601/python-aniso8601.hash | 4 ++--
 package/python-aniso8601/python-aniso8601.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aniso8601/Config.in b/package/python-aniso8601/Config.in
index cea76eeff5..234c36d0a3 100644
--- a/package/python-aniso8601/Config.in
+++ b/package/python-aniso8601/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_ANISO8601
 	help
 	  A library for parsing ISO 8601 strings.
 
-	  https://bitbucket.org/nielsenb/aniso8601
+	  https://codeberg.org/nielsenb-jf/aniso8601
diff --git a/package/python-aniso8601/python-aniso8601.hash b/package/python-aniso8601/python-aniso8601.hash
index c0e8f95f3b..9a33f9f9d4 100644
--- a/package/python-aniso8601/python-aniso8601.hash
+++ b/package/python-aniso8601/python-aniso8601.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aniso8601/json
-md5  29acca96d02d182b7ff09f02047b84a8  aniso8601-10.0.0.tar.gz
-sha256  ff1d0fc2346688c62c0151547136ac30e322896ed8af316ef7602c47da9426cf  aniso8601-10.0.0.tar.gz
+md5  ea9bb2b816aa448078d91aea3ce43d55  aniso8601-10.0.1.tar.gz
+sha256  25488f8663dd1528ae1f54f94ac1ea51ae25b4d531539b8bc707fed184d16845  aniso8601-10.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c3cca0b9a74fd29668bd99b5dcf0274d53be904de6778916dc852708f407b0f0  LICENSE
diff --git a/package/python-aniso8601/python-aniso8601.mk b/package/python-aniso8601/python-aniso8601.mk
index 1bb6628953..ed0230a0c3 100644
--- a/package/python-aniso8601/python-aniso8601.mk
+++ b/package/python-aniso8601/python-aniso8601.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANISO8601_VERSION = 10.0.0
+PYTHON_ANISO8601_VERSION = 10.0.1
 PYTHON_ANISO8601_SOURCE = aniso8601-$(PYTHON_ANISO8601_VERSION).tar.gz
-PYTHON_ANISO8601_SITE = https://files.pythonhosted.org/packages/f3/3f/dc8a28fa6dc72c13d8c158b01f8975f240e9e72c336cc1ae00f424e2d7ce
+PYTHON_ANISO8601_SITE = https://files.pythonhosted.org/packages/8b/8d/52179c4e3f1978d3d9a285f98c706642522750ef343e9738286130423730
 PYTHON_ANISO8601_SETUP_TYPE = setuptools
 PYTHON_ANISO8601_LICENSE = BSD-3-Clause
 PYTHON_ANISO8601_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
