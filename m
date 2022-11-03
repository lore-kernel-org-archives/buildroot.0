Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14C0C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE186105C;
	Thu,  3 Nov 2022 20:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DE186105C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gpBc37A5DpxH; Thu,  3 Nov 2022 20:59:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F9ED6105E;
	Thu,  3 Nov 2022 20:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F9ED6105E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 140081BF968
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1DFB40BFC
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1DFB40BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zxyTiYVEVyg3 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E532140BD6
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E532140BD6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0E6A87BCD; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3b8c9bd4588a717e4977debca8d51c1fcd58e4b5
X-Git-Newrev: 6263acc00de3ed3187d6c3ba0bf06267d6128646
X-Patchwork-Hint: ignore
Message-Id: <20221103205510.D0E6A87BCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-cherrypy: bump
 to version 18.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6263acc00de3ed3187d6c3ba0bf06267d6128646
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to url update:
https://github.com/cherrypy/cherrypy/commit/07aec3c90326e537613e5a77584df201ac5fdb1a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cherrypy/python-cherrypy.hash | 9 +++++----
 package/python-cherrypy/python-cherrypy.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-cherrypy/python-cherrypy.hash b/package/python-cherrypy/python-cherrypy.hash
index 2e7a92d6f3..cd8f8756d8 100644
--- a/package/python-cherrypy/python-cherrypy.hash
+++ b/package/python-cherrypy/python-cherrypy.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/CherryPy/json, sha256 locally computed
-md5  e21fd0c5706504a8f26c46d808a14255  CherryPy-12.0.1.tar.gz
-sha256  6a3a90a43b1e05bd4634c60acfdcf34efe74f9f8746aca14dbe95a9b69db30ea  CherryPy-12.0.1.tar.gz
-sha256  02f4efe6e7dcd218c33cfa065c0552de983b5ad563b053e97697c5abd2ef14f9  LICENSE.md
+# md5, sha256 from https://pypi.org/pypi/cherrypy/json
+md5  033c58bf3da497f283b039911d1c882b  CherryPy-18.8.0.tar.gz
+sha256  9b48cfba8a2f16d5b6419cc657e6d51db005ba35c5e3824e4728bb03bbc7ef9b  CherryPy-18.8.0.tar.gz
+# Locally computed sha256 checksums
+sha256  45ade933c280ece37e3e01d3a91afeed9505746a456f72ad10b0897c49e65104  LICENSE.md
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index 72b17bc876..9b6ad0e99a 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHERRYPY_VERSION = 12.0.1
+PYTHON_CHERRYPY_VERSION = 18.8.0
 PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
-PYTHON_CHERRYPY_SITE = https://pypi.python.org/packages/be/d8/a8ef56bfe1c39d466b8d55b496b64459cc43dec71361d88edf904901637f
+PYTHON_CHERRYPY_SITE = https://files.pythonhosted.org/packages/60/ea/6c4d16b0cd1f4f64a478bac8a37d75a585e854afb5693ce80a9711efdc4a
 PYTHON_CHERRYPY_LICENSE = BSD-3-Clause
 PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.md
 PYTHON_CHERRYPY_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
