Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D415FC3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 20:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8670A60E71;
	Mon, 12 May 2025 20:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tf__fkhLlYnI; Mon, 12 May 2025 20:21:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A731360E61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A731360E61;
	Mon, 12 May 2025 20:21:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 514CD154
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33E9540B35
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9n0ubHYDGnrT for <buildroot@buildroot.org>;
 Mon, 12 May 2025 20:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09A4E406EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09A4E406EE
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:21:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECCF0867C1; Mon, 12 May 2025 20:21:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 22:10:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c38ee456cbf13bd381f2194ae523a088a07b474b
X-Git-Newrev: 96ae6c41e7ac57692842ffbac1e81beb35b66d52
X-Patchwork-Hint: ignore
Message-Id: <20250512202107.ECCF0867C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-click: bump to 8.2.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=96ae6c41e7ac57692842ffbac1e81beb35b66d52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update package help text to reflect upstream project description.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-click/Config.in         | 3 +--
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-click/Config.in b/package/python-click/Config.in
index c026998677..0fd43d5fb1 100644
--- a/package/python-click/Config.in
+++ b/package/python-click/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_CLICK
 	bool "python-click"
 	help
-	  A simple wrapper around optparse for powerful command line
-	  utilities.
+	  Python composable command line interface toolkit.
 
 	  https://pypi.python.org/pypi/click
diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index 3511954a5d..c1076cc858 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  b52ee8e6c33d88a2b4626e6a6002245d  click-8.1.8.tar.gz
-sha256  ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a  click-8.1.8.tar.gz
+md5  b9d7fc7a25f30674c85da6f460628a17  click-8.2.0.tar.gz
+sha256  f5452aeddd9988eefa20f90f05ab66f17fce1ee2a36907fd30b05bbb5953814d  click-8.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 8597c65cec..e457b03b8b 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.1.8
+PYTHON_CLICK_VERSION = 8.2.0
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/cd/0f/62ca20172d4f87d93cf89665fbaedcd560ac48b465bd1d92bfc7ea6b0a41
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
