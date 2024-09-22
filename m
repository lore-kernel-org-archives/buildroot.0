Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA630CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F13781975;
	Sun, 22 Sep 2024 10:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHYWUn2VOzRG; Sun, 22 Sep 2024 10:35:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A917817A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A917817A8;
	Sun, 22 Sep 2024 10:35:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBFED1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B71B606E0
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqdgDFk8N5iF for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F112606CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F112606CA
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C6508219F; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:30:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a540c340c4ef54da67de479489201bf75e5317c2
X-Git-Newrev: 7c4510bf6c540661eefc64c3c5675ea010f0c90b
X-Patchwork-Hint: ignore
Message-Id: <20240922103441.5C6508219F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-traitlets: bump to version
 5.14.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c4510bf6c540661eefc64c3c5675ea010f0c90b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to rename/reformat:
https://github.com/ipython/traitlets/commit/1f4dc18c611622b89f46c8d92252551446c107e8

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-traitlets/python-traitlets.hash | 6 +++---
 package/python-traitlets/python-traitlets.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
index 80fa8d4d44..56fc569436 100644
--- a/package/python-traitlets/python-traitlets.hash
+++ b/package/python-traitlets/python-traitlets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/traitlets/json
-md5  95b21c721316bbc06922df9d97af5158  traitlets-5.8.0.tar.gz
-sha256  6cc57d6dc28c85d5365961726ffd19b538739347749e13ebe34e03323a0e8f84  traitlets-5.8.0.tar.gz
+md5  f6e6529cca4cbe3299e3f07ce24d3fdc  traitlets-5.14.3.tar.gz
+sha256  9ed0579d3502c94b4b3732ac120375cda96f923114522847de4b3bb98b96b6b7  traitlets-5.14.3.tar.gz
 # Locally computed sha256 checksums
-sha256  3dcd47086529bf178cf7d10f35a8c188a1e9710391acecceef700898a4cf099b  COPYING.md
+sha256  2f51727d9063b54856773cb51388bdb79f2936ee4a1b692ef553d8c4201311ab  LICENSE
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index 7054557a48..f8a5e2d95d 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TRAITLETS_VERSION = 5.8.0
+PYTHON_TRAITLETS_VERSION = 5.14.3
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/56/48/0eb99357330a02974d537be8e4096bc58cfac1089e3153570119ccea7a40
+PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/eb/79/72064e6a701c2183016abbbfedaba506d81e30e232a68c9f0d6f6fcd1574
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
-PYTHON_TRAITLETS_LICENSE_FILES = COPYING.md
+PYTHON_TRAITLETS_LICENSE_FILES = LICENSE
 PYTHON_TRAITLETS_SETUP_TYPE = pep517
 PYTHON_TRAITLETS_DEPENDENCIES = host-python-hatchling
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
