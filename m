Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E969C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A9A6610C6;
	Tue, 21 Feb 2023 00:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A9A6610C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0MDtgSWMmvGo; Tue, 21 Feb 2023 00:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18790610E7;
	Tue, 21 Feb 2023 00:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18790610E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8A321BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3B026FB96
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3B026FB96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KfrZEV4IzyRz for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E00226FB8D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E00226FB8D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDE09828C8; Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:16:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1e85e54729ece9fd7285c2e4d3f7ea537aabe0a3
X-Git-Newrev: e68d50ffb27acc6b89d55ebc7d19c3daae269a40
X-Patchwork-Hint: ignore
Message-Id: <20230220205235.DDE09828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-traitlets: bump
 to version 5.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e68d50ffb27acc6b89d55ebc7d19c3daae269a40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-traitlets/python-traitlets.hash | 4 ++--
 package/python-traitlets/python-traitlets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
index 0c68e04518..80fa8d4d44 100644
--- a/package/python-traitlets/python-traitlets.hash
+++ b/package/python-traitlets/python-traitlets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/traitlets/json
-md5  74ad03a0c8dd45d5621b12e0be0ab38f  traitlets-5.7.1.tar.gz
-sha256  fde8f62c05204ead43c2c1b9389cfc85befa7f54acb5da28529d671175bb4108  traitlets-5.7.1.tar.gz
+md5  95b21c721316bbc06922df9d97af5158  traitlets-5.8.0.tar.gz
+sha256  6cc57d6dc28c85d5365961726ffd19b538739347749e13ebe34e03323a0e8f84  traitlets-5.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3dcd47086529bf178cf7d10f35a8c188a1e9710391acecceef700898a4cf099b  COPYING.md
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index 8cda56817f..7054557a48 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRAITLETS_VERSION = 5.7.1
+PYTHON_TRAITLETS_VERSION = 5.8.0
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/0b/db/9adbbb2bef9a43ecfa4f1cbcec1d662adade10262328a4b7ef65effc6341
+PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/56/48/0eb99357330a02974d537be8e4096bc58cfac1089e3153570119ccea7a40
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
 PYTHON_TRAITLETS_LICENSE_FILES = COPYING.md
 PYTHON_TRAITLETS_SETUP_TYPE = pep517
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
