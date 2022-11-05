Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34B2C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80BC060DFE;
	Mon,  5 Dec 2022 12:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80BC060DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3sRiER5fH0gu; Mon,  5 Dec 2022 12:03:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F5B660D73;
	Mon,  5 Dec 2022 12:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F5B660D73
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0FFC1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD69840641
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD69840641
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cICVg4hwTDYa for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EDB1405FD
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EDB1405FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5657F85BA2; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:08:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f30a4a75afd1c2701ea9b59d085ca9d718397ebb
X-Git-Newrev: eec577b143830d554ca65b9c2e5b2c1209567ff3
X-Patchwork-Hint: ignore
Message-Id: <20221205112607.5657F85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xlib: bump to version 0.32
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

commit: https://git.buildroot.net/buildroot/commit/?id=eec577b143830d554ca65b9c2e5b2c1209567ff3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-xlib/python-xlib.hash | 4 ++--
 package/python-xlib/python-xlib.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlib/python-xlib.hash b/package/python-xlib/python-xlib.hash
index 120541f998..066f450416 100644
--- a/package/python-xlib/python-xlib.hash
+++ b/package/python-xlib/python-xlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-xlib/json
-md5  3a87f81bff4cb4f8a52881097ba51a49  python-xlib-0.27.tar.bz2
-sha256  a90667c70905c6ef0754c8a09fa61acbc1e1b7ddb946d527831800d7cbfe9348  python-xlib-0.27.tar.bz2
+md5  ba31623fb64a1e5a0b1ae1f6495c3bf6  python-xlib-0.32.tar.gz
+sha256  20e1382f8a98d8ed0facfa45415c46fd0c8eeb6f9996e58c22d3382a4ed6e37b  python-xlib-0.32.tar.gz
 # Locally computed sha256 checksums
 sha256  06eb1c441443cf15ac84f309003f4c43c62246939d37c75fc3e056c2d34cd300  LICENSE
diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
index ae8ca1653b..3ce1c5fdb0 100644
--- a/package/python-xlib/python-xlib.mk
+++ b/package/python-xlib/python-xlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLIB_VERSION = 0.27
-PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.bz2
-PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/e8/fa/a61ef33df117de4c57d11b4ba0b624f5352f21aa2e1eda404860155e8855
+PYTHON_XLIB_VERSION = 0.32
+PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.gz
+PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/4d/cf/a29ecb43a5c84a65ffd726e3b28806f56b3bc5e796ddb533ff52af107dcf
 PYTHON_XLIB_SETUP_TYPE = setuptools
 PYTHON_XLIB_LICENSE = LGPL-2.1+
 PYTHON_XLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
