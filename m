Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C875EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 15:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B810B6113C;
	Sat, 24 Jun 2023 15:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B810B6113C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cWXRDo0IacoU; Sat, 24 Jun 2023 15:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBFDD6112D;
	Sat, 24 Jun 2023 15:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBFDD6112D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 710691BF420
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 15:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AF74405D3
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 15:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AF74405D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DgXEOu4hQyk2 for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 15:05:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29113405D0
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 15:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29113405D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1021C84564; Sat, 24 Jun 2023 15:05:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 17:05:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 770f097ee6f22e48ee4ceba517bd8bb75bc419fa
X-Git-Newrev: adabd0b8b03c36c660784b685a49ac7d41c9b472
X-Patchwork-Hint: ignore
Message-Id: <20230624150547.1021C84564@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: bump to
 version 39.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=adabd0b8b03c36c660784b685a49ac7d41c9b472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index a23944a06f..e083014750 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  531348679f144d118156be5b17ddac750974cdcd9f44bb0a7cfd7ddcfee79c80  cryptography-39.0.1.tar.gz
+sha256  405c9a6271e1a088ea0b432bc2094e2e8baadb2241e192ce9c73a7cc9793b127  cryptography-39.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index a130b2d10d..67aa20742d 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 39.0.1
+PYTHON_CRYPTOGRAPHY_VERSION = 39.0.2
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/6a/f5/a729774d087e50fffd1438b3877a91e9281294f985bda0fd15bf99016c78
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/fa/f3/f4b8c175ea9a1de650b0085858059050b7953a93d66c97ed89b93b232996
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
