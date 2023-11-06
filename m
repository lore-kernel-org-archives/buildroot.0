Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32636C4167B
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCCD142095;
	Mon,  6 Nov 2023 22:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCCD142095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vCpCmW_a5MW9; Mon,  6 Nov 2023 22:26:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF9884215E;
	Mon,  6 Nov 2023 22:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF9884215E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CAD81BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0739B415ED
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0739B415ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6h0ptDUKL9qr for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DD9C41686
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DD9C41686
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BDAF86B77; Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:15:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c10243bcca6a520708a8d298a00bf343aebfcde
X-Git-Newrev: 38abfd376ee23d879d20db3dc1953df0a1d8ef30
X-Patchwork-Hint: ignore
Message-Id: <20231106222018.1BDAF86B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-functools: bump to
 version 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=38abfd376ee23d879d20db3dc1953df0a1d8ef30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to copyright notice removal:
https://github.com/jaraco/jaraco.functools/commit/5957d58266e479f124b31f30e4322e798fdf386b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jaraco-functools/python-jaraco-functools.hash | 6 +++---
 package/python-jaraco-functools/python-jaraco-functools.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jaraco-functools/python-jaraco-functools.hash b/package/python-jaraco-functools/python-jaraco-functools.hash
index a7cbb3daf1..97db6b75fb 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.hash
+++ b/package/python-jaraco-functools/python-jaraco-functools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.functools/json
-md5  f25708d7f38b9264459046fcc0afc8c1  jaraco.functools-3.5.2.tar.gz
-sha256  45b05c158f3ad28731075556ffd4749bd254ec67f91e1eb367dcfebff1151db4  jaraco.functools-3.5.2.tar.gz
+md5  6683d6f56930d4f0b34157b083813cf3  jaraco.functools-4.0.0.tar.gz
+sha256  c279cb24c93d694ef7270f970d499cab4d3813f4e08273f95398651a634f0925  jaraco.functools-4.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index 8f64c4687e..5637b75629 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_FUNCTOOLS_VERSION = 3.5.2
+PYTHON_JARACO_FUNCTOOLS_VERSION = 4.0.0
 PYTHON_JARACO_FUNCTOOLS_SOURCE = jaraco.functools-$(PYTHON_JARACO_FUNCTOOLS_VERSION).tar.gz
-PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/b4/ea/9abca360081de9157668fcc52765989158aaf29b4826f26fcb17852d08e6
+PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/57/7c/fe770e264913f9a49ddb9387cca2757b8d7d26f06735c1bfbb018912afce
 PYTHON_JARACO_FUNCTOOLS_LICENSE = MIT
 PYTHON_JARACO_FUNCTOOLS_LICENSE_FILES = LICENSE
 PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
