Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F10ACD37BC
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0992840B5C;
	Sat, 16 Sep 2023 12:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0992840B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ap_RsWZzWEsU; Sat, 16 Sep 2023 12:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E81B40AF5;
	Sat, 16 Sep 2023 12:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E81B40AF5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2BF01BF860
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A32860E53
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A32860E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oS9F5obBim9P for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:10:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB56660BFB
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB56660BFB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C91E686B40; Sat, 16 Sep 2023 12:10:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 14:10:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42f25180233df459cd2bfbc5b9ebf8b95c6b60cb
X-Git-Newrev: 971f8adc96b44de9490599168d69b44e726c6480
X-Patchwork-Hint: ignore
Message-Id: <20230916121047.C91E686B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pluggy: bump to version
 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=971f8adc96b44de9490599168d69b44e726c6480
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pluggy/python-pluggy.hash | 4 ++--
 package/python-pluggy/python-pluggy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pluggy/python-pluggy.hash b/package/python-pluggy/python-pluggy.hash
index 39f172a82b..74790a51a0 100644
--- a/package/python-pluggy/python-pluggy.hash
+++ b/package/python-pluggy/python-pluggy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pluggy/json
-md5  daa6fddfb6cd364f3c82e52098911e4b  pluggy-1.0.0.tar.gz
-sha256  4224373bacce55f955a878bf9cfa763c1e360858e330072059e10bad68531159  pluggy-1.0.0.tar.gz
+md5  f31aad77be2f5af8ed3864159b7fd743  pluggy-1.3.0.tar.gz
+sha256  cf61ae8f126ac6f7c451172cf30e3e43d3ca77615509771b3a984a0730651e12  pluggy-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d6b65e6c213a5d0b577911d34d6e5949b9f59d76c238c5071a2f3fc16cfb2606  LICENSE
diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
index 6dc6f970ea..2b7ac04f02 100644
--- a/package/python-pluggy/python-pluggy.mk
+++ b/package/python-pluggy/python-pluggy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLUGGY_VERSION = 1.0.0
+PYTHON_PLUGGY_VERSION = 1.3.0
 PYTHON_PLUGGY_SOURCE = pluggy-$(PYTHON_PLUGGY_VERSION).tar.gz
-PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/a1/16/db2d7de3474b6e37cbb9c008965ee63835bba517e22cdb8c35b5116b5ce1
+PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/36/51/04defc761583568cae5fd533abda3d40164cbdcf22dee5b7126ffef68a40
 PYTHON_PLUGGY_SETUP_TYPE = setuptools
 PYTHON_PLUGGY_LICENSE = MIT
 PYTHON_PLUGGY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
