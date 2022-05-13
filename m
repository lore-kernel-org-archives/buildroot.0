Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD92C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CDC741550;
	Fri, 13 May 2022 22:15:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ENI5g6hFr26X; Fri, 13 May 2022 22:15:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D066A41499;
	Fri, 13 May 2022 22:15:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6EA81BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A815A415E5
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2K8EtFRJ9JKX for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C22C24099B
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 85F4F85E29; Fri, 13 May 2022 22:00:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4686fb32a053753f502e24c5cd980db5b71f6a2c
X-Git-Newrev: 0d21f845af4e986c4640fb416a0cfff601bbfa31
X-Patchwork-Hint: ignore
Message-Id: <20220513220045.85F4F85E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cssutils: bump to version
 2.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d21f845af4e986c4640fb416a0cfff601bbfa31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-cssutils/python-cssutils.hash | 4 ++--
 package/python-cssutils/python-cssutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
index e22dde6e56..13459f7270 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssutils/json
-md5  71955999f595e4b0eb5a218d614652ca  cssutils-2.3.0.tar.gz
-sha256  b2d3b16047caae82e5c590036935bafa1b621cf45c2f38885af4be4838f0fd00  cssutils-2.3.0.tar.gz
+md5  4ae0e6c670483043260363f593e96a69  cssutils-2.4.0.tar.gz
+sha256  2d97210a83b0a3fe1e4469f5ff9a6420b078572035188b1bab7103c3a36dc89b  cssutils-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index 09c2ca44d6..fc65c893ac 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 2.3.0
+PYTHON_CSSUTILS_VERSION = 2.4.0
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/f5/c6/878abb7df855938a067b762a688da3fcdfea4e41c2399feaf80369b61ed7
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/f4/ea/d09b04b5cf6ad84f45ca4c523d3e153dd9be1f12650c825d1c92ca0618a2
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
