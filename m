Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38391C77B72
	for <buildroot@archiver.kernel.org>; Fri, 14 Apr 2023 19:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B35B740518;
	Fri, 14 Apr 2023 19:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B35B740518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TyhdiNDsKjpY; Fri, 14 Apr 2023 19:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF71A42C2A;
	Fri, 14 Apr 2023 19:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF71A42C2A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1E141BF408
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 19:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C73D042923
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 19:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C73D042923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Clj4XdAXJJ49 for <buildroot@lists.busybox.net>;
 Fri, 14 Apr 2023 19:38:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B73FA42922
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 19:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B73FA42922
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A306E84112; Fri, 14 Apr 2023 19:38:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Apr 2023 21:38:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a4e8355e3751f620ef91239a1c61a9c1c41d5ca
X-Git-Newrev: 9e90591b22caedfe72c87a8e3315ce8da6d1a4a9
X-Patchwork-Hint: ignore
Message-Id: <20230414193847.A306E84112@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-esptool: Bump version to
 4.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e90591b22caedfe72c87a8e3315ce8da6d1a4a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
Acked-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index b7246f9788..e1d3188658 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  92c38551bc33bd5271bdea033aa51610  esptool-4.4.tar.gz
-sha256  8acd4dfe70819b1302861ae92894380fb4700b377f5a4739479a4ec276e0b256  esptool-4.4.tar.gz
+md5  fbad6fb6024580fd2645331f92a74555  esptool-4.5.1.tar.gz
+sha256  e3eb59836123e5ebf793ef639311f7d85645526487d8b1c2b51159b455106b9a  esptool-4.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index 0a71e1a78b..34bdf6cc96 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.4
+PYTHON_ESPTOOL_VERSION = 4.5.1
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/8b/4c/82d7fe5fa0643415bbb90bebff1f861816903c481ee5156fabd6d76dc684
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/04/80/8eb97d1793cfaf830a4c0a7ea1d8f0674ccba8c23b7d02dcce074b5f44ea
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
