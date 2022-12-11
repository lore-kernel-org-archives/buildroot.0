Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13A3C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DBF3817B1;
	Sun, 11 Dec 2022 09:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DBF3817B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6TDkc5iGiae; Sun, 11 Dec 2022 09:01:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6496D813EC;
	Sun, 11 Dec 2022 09:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6496D813EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE9961BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 594CD600CD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 594CD600CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4c9NKN5jx8Z7 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F657605DB
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F657605DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D7AE85FAC; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24d1bfa38d9f10785e8cd366c9680e9ca8905de6
X-Git-Newrev: b7fa52b837cc3a39534ba675e913c9bae583988d
X-Patchwork-Hint: ignore
Message-Id: <20221211085516.8D7AE85FAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydal: bump to version
 20221110.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7fa52b837cc3a39534ba675e913c9bae583988d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pydal/python-pydal.hash | 6 ++++--
 package/python-pydal/python-pydal.mk   | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 852e568ac5..c55a17a545 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,5 @@
-# sha256 locally computed
-sha256  0a2dbc5d61d37d2b59d441ed0aab48c1ec906ce66088eb5cee021b009601de02  python-pydal-20220916.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pydal/json
+md5  eeaf44cdcdb6bd2040713c710a4a04be  pydal-20221110.1.tar.gz
+sha256  7c3e891c70f8d8918e36276f210a1959bb7badf3b276f47191986ffcf5b6a390  pydal-20221110.1.tar.gz
+# Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index a3df1ccff1..f55c7fc2c5 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20220916.1
-PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
+PYTHON_PYDAL_VERSION = 20221110.1
+PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/73/83/b904c464b6ab060e12b3f406f1fab7deb97bcd9d2021d8c87325e6225c2d
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
