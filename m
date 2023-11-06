Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FA9C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEE3D42093;
	Mon,  6 Nov 2023 22:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEE3D42093
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vZQiIHiGE_2x; Mon,  6 Nov 2023 22:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A8944209D;
	Mon,  6 Nov 2023 22:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A8944209D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D5911BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6CC6612C6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6CC6612C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VFqoz4kS_NVS for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E295861286
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E295861286
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCD6C86B74; Mon,  6 Nov 2023 22:20:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:12:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: deb8d71c9285eb60bc3d28e8abcf7208f78980a7
X-Git-Newrev: b9cbe43f38185ef074472cee603b68942fe983d2
X-Patchwork-Hint: ignore
Message-Id: <20231106222016.BCD6C86B74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-construct: bump to version
 2.10.69
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9cbe43f38185ef074472cee603b68942fe983d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-construct/python-construct.hash | 6 +++---
 package/python-construct/python-construct.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-construct/python-construct.hash b/package/python-construct/python-construct.hash
index f406d6739b..a72a79a5b3 100644
--- a/package/python-construct/python-construct.hash
+++ b/package/python-construct/python-construct.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/project/construct
-md5  e426d3dd1566066e4ef1a03fe474dec0  construct-2.10.68.tar.gz
-sha256  7b2a3fd8e5f597a5aa1d614c3bd516fa065db01704c72a1efaaeec6ef23d8b45  construct-2.10.68.tar.gz
+# md5, sha256 from https://pypi.org/pypi/construct/json
+md5  d881ab2198ec6597e603a2d985307353  construct-2.10.69.tar.gz
+sha256  08573d1573827a6fe6b846756d54270650e221a6cec6a72e06b582cde775599e  construct-2.10.69.tar.gz
 # Locally computed sha256 checksums
 sha256  1552d70acfd0d3fe464ce13d30113ddc6fe4bac21e52212acc98509e3cc1a8f4  LICENSE
diff --git a/package/python-construct/python-construct.mk b/package/python-construct/python-construct.mk
index 3b0bb56106..1e30651129 100644
--- a/package/python-construct/python-construct.mk
+++ b/package/python-construct/python-construct.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONSTRUCT_VERSION = 2.10.68
+PYTHON_CONSTRUCT_VERSION = 2.10.69
 PYTHON_CONSTRUCT_SOURCE = construct-$(PYTHON_CONSTRUCT_VERSION).tar.gz
-PYTHON_CONSTRUCT_SITE = https://files.pythonhosted.org/packages/e0/b7/a4a032e94bcfdff481f2e6fecd472794d9da09f474a2185ed33b2c7cad64
+PYTHON_CONSTRUCT_SITE = https://files.pythonhosted.org/packages/02/88/e34d7265863f3c96077aea24041b067d4646d77d596d979110eb94758b03
 PYTHON_CONSTRUCT_SETUP_TYPE = setuptools
 PYTHON_CONSTRUCT_LICENSE = MIT
 PYTHON_CONSTRUCT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
