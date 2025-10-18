Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F79CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 10:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7ACA60BB1;
	Sat, 18 Oct 2025 10:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpZPmJXJt_Gc; Sat, 18 Oct 2025 10:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE24160BBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE24160BBC;
	Sat, 18 Oct 2025 10:52:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DE621CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FE9F83C0B
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWqqpIkwCblY for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 10:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DE3883C03
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DE3883C03
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:52:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4986087301; Sat, 18 Oct 2025 10:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 12:48:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c41f5e2edde466ef79885f3a88322365a44e6d0d
X-Git-Newrev: c31a86ebf66cc322212f1045cb2625cde1b83dc5
X-Patchwork-Hint: ignore
Message-Id: <20251018105242.4986087301@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-click: bump to 8.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c31a86ebf66cc322212f1045cb2625cde1b83dc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release Notes: https://click.palletsprojects.com/en/stable/changes/#version-8-3-0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-click/Config.in         | 2 +-
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-click/Config.in b/package/python-click/Config.in
index 0fd43d5fb1..247cd4e973 100644
--- a/package/python-click/Config.in
+++ b/package/python-click/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_CLICK
 	help
 	  Python composable command line interface toolkit.
 
-	  https://pypi.python.org/pypi/click
+	  https://click.palletsprojects.com/
diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index 79b1df40d9..df8528a786 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  438cfd4974584ae4f960ffeab32e8991  click-8.2.1.tar.gz
-sha256  27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202  click-8.2.1.tar.gz
+md5  fa228744ff03a339957e847fb7890823  click-8.3.0.tar.gz
+sha256  e7b8232224eba16f4ebe410c25ced9f7875cb5f3263ffc93cc3e8da705e229c4  click-8.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 9b64a0c351..ef22c27439 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.2.1
+PYTHON_CLICK_VERSION = 8.3.0
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/60/6c/8ca2efa64cf75a977a0d7fac081354553ebe483345c734fb6b6515d96bbc
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/46/61/de6cd827efad202d7057d93e0fed9294b96952e188f7384832791c7b2254
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
