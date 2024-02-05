Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66CCC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DA6F417DA;
	Mon,  5 Feb 2024 10:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DA6F417DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tmci50DGHYaJ; Mon,  5 Feb 2024 10:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF1CD41568;
	Mon,  5 Feb 2024 10:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1CD41568
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E319F1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC23D60F51
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC23D60F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQ38ilyOBJWU for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:20:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0421460F31
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0421460F31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5E8286A22; Mon,  5 Feb 2024 10:20:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:19:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 524f3536029dace3ce9aa154d3ca4685582e1955
X-Git-Newrev: 66310c8ccb3b2022bcb2a938147040bf589b8636
X-Patchwork-Hint: ignore
Message-Id: <20240205102047.E5E8286A22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyspnego: bump to version
 0.10.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=66310c8ccb3b2022bcb2a938147040bf589b8636
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pyspnego/python-pyspnego.hash | 7 +++----
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index 0ae6cf1d4e..dc808d4204 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,6 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  93ab1a088d65e6a7c97efdb567ba37b0  pyspnego-0.7.0.tar.gz
-sha256  da78096fd7c9f40e716f6fbe3e30d913103d75fd676f839f98fc3a6fee92fbe3  pyspnego-0.7.0.tar.gz
-
-# Locally computed
+md5  b633cab73a1481c5dbc2d6f6857569d0  pyspnego-0.10.2.tar.gz
+sha256  9a22c23aeae7b4424fdb2482450d3f8302ac012e2644e1cfe735cf468fcd12ed  pyspnego-0.10.2.tar.gz
+# Locally computed sha256 checksums
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index 2fbb779d98..740e6eec15 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.7.0
+PYTHON_PYSPNEGO_VERSION = 0.10.2
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/97/f3/bdf3cd5f4c5a1bf9e1d4bb771c133850ee08241c18cafd90a6d872937a9f
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/3a/c3/401a5ae889b51f80e91474b6acda7dae8d704c6fe8424fd40e0ff0702812
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
