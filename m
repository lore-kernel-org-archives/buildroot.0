Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA08C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 23:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D652480BFD;
	Sat,  8 Jan 2022 23:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFP4h4MP6zAv; Sat,  8 Jan 2022 23:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F99980BD8;
	Sat,  8 Jan 2022 23:16:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBF9B1BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB0AA4042F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zaNpNu8sn9iq for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 23:16:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28BB04040B
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 23:16:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DD70E813F5; Sat,  8 Jan 2022 23:10:01 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 00:15:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea077d89ec4af31d5203a50b451f0fba28c5e1fe
X-Git-Newrev: 12e3527fd97df9ae1b60b892c61d10ce291b7a00
X-Patchwork-Hint: ignore
Message-Id: <20220108231001.DD70E813F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-scm: bump to
 version 6.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=12e3527fd97df9ae1b60b892c61d10ce291b7a00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new host-python-packaging and host-python-tomli dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 79999fca0d..22b9afd2c2 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  c11bf23d80224691a46ee5deb84c42db  setuptools_scm-5.0.1.tar.gz
-sha256  c85b6b46d0edd40d2301038cdea96bb6adc14d62ef943e75afb08b3e7bcf142a  setuptools_scm-5.0.1.tar.gz
+md5  32918d8ac566360c21411e0b3556c695  setuptools_scm-6.3.2.tar.gz
+sha256  a49aa8081eeb3514eb9728fa5040f2eaa962d6c6f4ec9c32f6c1fba88f88a0f2  setuptools_scm-6.3.2.tar.gz
 # sha256 locally computed
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index caca6d4314..f7f4e3ef27 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 5.0.1
+PYTHON_SETUPTOOLS_SCM_VERSION = 6.3.2
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/af/df/f8aa8a78d4d29e0cffa4512e9bc223ed02f24893fe1837c6cee2749ebd67
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/4b/0d/ecb9595fae02467edba5023eb8a23c688d2b438a6a8d1a9e2b8649faf23d
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
+HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = host-python-packaging host-python-tomli
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
