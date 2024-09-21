Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04808CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 206B460716;
	Sat, 21 Sep 2024 21:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eamGqJGI2J3d; Sat, 21 Sep 2024 21:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AF9960850
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AF9960850;
	Sat, 21 Sep 2024 21:07:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B11AA1BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FB7A4022F
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmY8w7hKQTMH for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 715D8400DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 715D8400DD
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D4E284171; Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:52:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11559c71b3da6f2eebda6e56e4c92d98c6764861
X-Git-Newrev: 3bff4c7a999b8c42a0e7bb9d34c169283f53963a
X-Patchwork-Hint: ignore
Message-Id: <20240921210741.5D4E284171@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-networkx: bump to version
 3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=3bff4c7a999b8c42a0e7bb9d34c169283f53963a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/networkx/networkx/commit/7fc4fa51875d9e326416f998c51f208442d55dad

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-networkx/python-networkx.hash | 6 +++---
 package/python-networkx/python-networkx.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index b9fe50fd9c..3b6f4c6fba 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  e81583dcb3d929b60660721912f3faed  networkx-3.2.1.tar.gz
-sha256  9f1bb5cf3409bf324e0a722c20bdb4c20ee39bf1c30ce8ae499c8502b0b5e0c6  networkx-3.2.1.tar.gz
+md5  c307f8c790cf3f18954ae7458b16c843  networkx-3.3.tar.gz
+sha256  0c127d8b2f4865f59ae9cb8aafcd60b5c70f3241ebd66f7defad7c4ab90126c9  networkx-3.3.tar.gz
 # Locally computed sha256 checksums
-sha256  50b5a27cb43f7a20cede7aa7b9ab2033552e0412c9a1fde51d38885c1417e95f  LICENSE.txt
+sha256  5b433b90f755eb9bbd06feff1d1a4f5f232c5208a185694199e45fa95d762792  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index e463dca40a..ef51003047 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 3.2.1
+PYTHON_NETWORKX_VERSION = 3.3
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/c4/80/a84676339aaae2f1cfdf9f418701dd634aef9cc76f708ef55c36ff39c3ca
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/04/e6/b164f94c869d6b2c605b5128b7b0cfe912795a87fc90e78533920001f3ec
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
