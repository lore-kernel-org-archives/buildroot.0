Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC5AC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0766060C18;
	Mon,  5 Dec 2022 12:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0766060C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 786Ilg92qzWr; Mon,  5 Dec 2022 12:03:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2422960BDA;
	Mon,  5 Dec 2022 12:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2422960BDA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E9F41BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93BC1405FA
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93BC1405FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1UhtNPcLM9r for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56B91405BA
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56B91405BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A66D85B9E; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:08:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fb03b795c1c08912f470b49c0aac41975c7ce8d
X-Git-Newrev: f30a4a75afd1c2701ea9b59d085ca9d718397ebb
X-Patchwork-Hint: ignore
Message-Id: <20221205112607.4A66D85B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wtforms: bump to version
 3.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f30a4a75afd1c2701ea9b59d085ca9d718397ebb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new host-python-babel build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-wtforms/python-wtforms.hash | 4 ++--
 package/python-wtforms/python-wtforms.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index ed9bfd1a23..12b980de02 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  2b6ea167a71c6becf20f0934417fd06c  WTForms-2.3.3.tar.gz
-sha256  81195de0ac94fbc8368abbaf9197b88c4f3ffd6c2719b5bf5fc9da744f3d829c  WTForms-2.3.3.tar.gz
+md5  509a985769df13938c8307b55a614773  WTForms-3.0.1.tar.gz
+sha256  6b351bbb12dd58af57ffef05bc78425d08d1914e0fd68ee14143b7ade023c5bc  WTForms-3.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 23280a6fe5..65b5748b6b 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 2.3.3
+PYTHON_WTFORMS_VERSION = 3.0.1
 PYTHON_WTFORMS_SOURCE = WTForms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/dd/3f/f25d26b1c66896e2876124a12cd8be8f606abf4e1890a20f3ca04e4a1555
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/9a/7d/d4aa68f5bfcb91dd61a7faf0e862512ae7b3d531c41f24c217910aec0559
 PYTHON_WTFORMS_SETUP_TYPE = setuptools
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
+PYTHON_WTFORMS_DEPENDENCIES = host-python-babel
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
