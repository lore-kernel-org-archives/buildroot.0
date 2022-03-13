Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4070FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01E1581D3A;
	Sun, 13 Mar 2022 09:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4JqcUEt_wCpV; Sun, 13 Mar 2022 09:12:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E65B818D4;
	Sun, 13 Mar 2022 09:12:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C6231BF2A6
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF7044099A
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHRLABO9qIPf for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:11:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CA994099F
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:11:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CEB0A83C4C; Sun, 13 Mar 2022 09:02:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 10:10:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f74ab8d603d6782e522324019634c51247ddba5
X-Git-Newrev: 280da9f2f46c736911b156dafdfb667951788edd
X-Patchwork-Hint: ignore
Message-Id: <20220313090240.CEB0A83C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyphen: bump to version
 0.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=280da9f2f46c736911b156dafdfb667951788edd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pyphen/python-pyphen.hash | 4 ++--
 package/python-pyphen/python-pyphen.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index 75ee909351..14938de9c4 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/Pyphen/json
-md5  f8ec095e4fe30dc2b518a918788b33ed  pyphen-0.11.0.tar.gz
-sha256  e2c3ed82c3a04317df5102addafe89652b0876bc6c6265f5dd4c3efaf02315e8  pyphen-0.11.0.tar.gz
+md5  99a01a3806cc750c242cae330429a90f  pyphen-0.12.0.tar.gz
+sha256  b7d3dfc24b6f2178cdb2b1757ace0bd5d222de3e62c28d22ac578c5f22a13e9b  pyphen-0.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9f0bffde4fbbbbc61c46f6577b6f472919dba9fdffabe74e8a7e44ac5dbef7a2  LICENSE
 sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index 80f67c77c7..ac0bcf8aab 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYPHEN_VERSION = 0.11.0
+PYTHON_PYPHEN_VERSION = 0.12.0
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/9a/f8/af869a4983c1b3159945479510260985714265d48baf27d61f72b1ec8cbf
-PYTHON_PYPHEN_SETUP_TYPE = distutils
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/0e/21/9e0841aa76db69e2d74cd64ea2271151d7332fa627a5f03eb0d9ccf3da87
+PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
