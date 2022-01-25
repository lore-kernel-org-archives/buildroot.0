Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEF7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2140B6074C;
	Tue, 25 Jan 2022 18:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IiMBmrjNizW; Tue, 25 Jan 2022 18:37:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0000760BBA;
	Tue, 25 Jan 2022 18:36:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6758F1BF301
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D3D46074C
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onxyzL91kKv3 for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 706E060B38
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 84621827E7; Tue, 25 Jan 2022 18:27:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:26:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4f9982a196dccc5f2e7cd340bfc1f54bbc411cb
X-Git-Newrev: d190bc39220022b9dd2febf80a1bd970455d3a01
X-Patchwork-Hint: ignore
Message-Id: <20220125182727.84621827E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-terminaltables: bump to
 version 3.1.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=d190bc39220022b9dd2febf80a1bd970455d3a01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update repository upstream url and add license hash.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-terminaltables/Config.in                  | 2 +-
 package/python-terminaltables/python-terminaltables.hash | 6 ++++--
 package/python-terminaltables/python-terminaltables.mk   | 5 +++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-terminaltables/Config.in b/package/python-terminaltables/Config.in
index 8f3c4296ed..8a387466ec 100644
--- a/package/python-terminaltables/Config.in
+++ b/package/python-terminaltables/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_TERMINALTABLES
 	  Generate simple tables in terminals from a nested list of
 	  strings.
 
-	  https://github.com/Robpol86/terminaltables
+	  https://github.com/matthewdeanmartin/terminaltables
diff --git a/package/python-terminaltables/python-terminaltables.hash b/package/python-terminaltables/python-terminaltables.hash
index 3184f5f716..b6c95aa269 100644
--- a/package/python-terminaltables/python-terminaltables.hash
+++ b/package/python-terminaltables/python-terminaltables.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/terminaltables/json
-md5	863797674d8f75d22e16e6c1fdcbeb41  terminaltables-3.1.0.tar.gz
-sha256	f3eb0eb92e3833972ac36796293ca0906e998dc3be91fbe1f8615b331b853b81  terminaltables-3.1.0.tar.gz
+md5  5467e06a1a6e24dc44e6dd241706668e  terminaltables-3.1.10.tar.gz
+sha256  ba6eca5cb5ba02bba4c9f4f985af80c54ec3dccf94cfcd190154386255e47543  terminaltables-3.1.10.tar.gz
+# Locally computed sha256 checksums
+sha256  2e1320fd337db06a3136d0f4101bd62f13249c95c5b581304f35481e979d432a  LICENSE
diff --git a/package/python-terminaltables/python-terminaltables.mk b/package/python-terminaltables/python-terminaltables.mk
index 763f82e9a2..b31ed332b6 100644
--- a/package/python-terminaltables/python-terminaltables.mk
+++ b/package/python-terminaltables/python-terminaltables.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TERMINALTABLES_VERSION = 3.1.0
+PYTHON_TERMINALTABLES_VERSION = 3.1.10
 PYTHON_TERMINALTABLES_SOURCE = terminaltables-$(PYTHON_TERMINALTABLES_VERSION).tar.gz
-PYTHON_TERMINALTABLES_SITE = https://files.pythonhosted.org/packages/9b/c4/4a21174f32f8a7e1104798c445dacdc1d4df86f2f26722767034e4de4bff
+PYTHON_TERMINALTABLES_SITE = https://files.pythonhosted.org/packages/f5/fc/0b73d782f5ab7feba8d007573a3773c58255f223c5940a7b7085f02153c3
 PYTHON_TERMINALTABLES_SETUP_TYPE = setuptools
 PYTHON_TERMINALTABLES_LICENSE = MIT
+PYTHON_TERMINALTABLES_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
