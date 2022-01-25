Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F25AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6CE1403CA;
	Tue, 25 Jan 2022 18:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iGHp19eiZO0g; Tue, 25 Jan 2022 18:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E27240495;
	Tue, 25 Jan 2022 18:34:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D26B1BF301
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A33740882
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ko2tIeLRYRX1 for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:34:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCD24403CA
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:34:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CDAB7827E3; Tue, 25 Jan 2022 18:27:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:20:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b603f2a1e8f2875e1f1c4cec385a73b3e88901b5
X-Git-Newrev: 4211a933a3f9762b2816c372f7aa2ca5e92db32d
X-Patchwork-Hint: ignore
Message-Id: <20220125182726.CDAB7827E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyftpdlib: bump to version
 1.5.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=4211a933a3f9762b2816c372f7aa2ca5e92db32d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of LICENSE file (license updated to make it recognizable
  by github:
  https://github.com/giampaolo/pyftpdlib/commit/a3016e7d694c226cae6a2b7672c6c5196124cd7a)
- Update indentation in hash file (two spaces)

https://github.com/giampaolo/pyftpdlib/blob/release-1.5.6/HISTORY.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pyftpdlib/python-pyftpdlib.hash | 6 +++---
 package/python-pyftpdlib/python-pyftpdlib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
index 7f8da95550..abbb1261b2 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.hash
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyftpdlib/json
-md5	7f8089520d60171bee5dab2b721e8d00  pyftpdlib-1.5.5.tar.gz
-sha256	1adf1c03d1508749e7c2f26dc9850ec0ef834318d725b7ae5ac91698f5c86752  pyftpdlib-1.5.5.tar.gz
+md5  459dd3e685c4b7dfcf574ca05e5586eb  pyftpdlib-1.5.6.tar.gz
+sha256  fda655d81f29af52885ca2f8a2704134baed540f16d66a0b26e8fdfafd12db5e  pyftpdlib-1.5.6.tar.gz
 # Locally computed sha256 checksums
-sha256	18a4ff1ddf890838e36504b307581e3eb42c890a7272ce28b18b3ce1205b7ea8  LICENSE
+sha256  67a832551570a5ac5f7901eaa5ece4b9491fda7f2d8c93957c3bbc68a5a76d88  LICENSE
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index dbbb9e2842..931e2dad06 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYFTPDLIB_VERSION = 1.5.5
+PYTHON_PYFTPDLIB_VERSION = 1.5.6
 PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
-PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/27/64/06a574350c79873e908fa9f48b617e7961de50fc468acc0a05d76771bce9
+PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/31/61/63ef60aca6de07eba1639d9d47f3f8e29462e8bb49d6a8dce9aeff240646
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
