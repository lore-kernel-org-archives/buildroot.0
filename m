Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D070AC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A04B770494;
	Fri, 28 Feb 2025 16:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGnp83yocE_S; Fri, 28 Feb 2025 16:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 981D87066E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 981D87066E;
	Fri, 28 Feb 2025 16:56:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10F751DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6BFC45FD7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAxJlN4xsAvg for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5672842D72
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5672842D72
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5077E87C52; Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jan 2025 12:03:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e08b2b0fe64e7ece4bd75908ca9c7e3a7579629b
X-Git-Newrev: 4a2740f0482a1abb20fd8e46fea1c7ee52ffe095
X-Patchwork-Hint: ignore
Message-Id: <20250228163007.5077E87C52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-tabledata: bump
 to version 1.3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a2740f0482a1abb20fd8e46fea1c7ee52ffe095
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add new host-python-setuptools-scm build dependency.

License hash changed due to year update:
https://github.com/thombashi/tabledata/commit/c86bbd425f5f2bfa8e65a4e216e4457f9bd70c4e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tabledata/python-tabledata.hash | 6 +++---
 package/python-tabledata/python-tabledata.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-tabledata/python-tabledata.hash b/package/python-tabledata/python-tabledata.hash
index 19fd4ea9c5..fb3471af95 100644
--- a/package/python-tabledata/python-tabledata.hash
+++ b/package/python-tabledata/python-tabledata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tabledata/json
-md5  579c4e7454a837d252d4977b73556aae  tabledata-1.3.3.tar.gz
-sha256  c90daaba9a408e4397934b3ff2f6c06797d5289676420bf520c741ad43e6ff91  tabledata-1.3.3.tar.gz
+md5  c0efbc178462c94920c02c52da56bf18  tabledata-1.3.4.tar.gz
+sha256  e9649cab129d718f3bff4150083b77f8a78c30f6634a30caf692b10fdc60cb97  tabledata-1.3.4.tar.gz
 # Locally computed sha256 checksums
-sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
+sha256  4434f353a12dd0236a99e5d3fd07fe3b3a453f9164fe10c57a11d6ca86b50c08  LICENSE
diff --git a/package/python-tabledata/python-tabledata.mk b/package/python-tabledata/python-tabledata.mk
index 43e22d45d1..bf845b7a7b 100644
--- a/package/python-tabledata/python-tabledata.mk
+++ b/package/python-tabledata/python-tabledata.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TABLEDATA_VERSION = 1.3.3
+PYTHON_TABLEDATA_VERSION = 1.3.4
 PYTHON_TABLEDATA_SOURCE = tabledata-$(PYTHON_TABLEDATA_VERSION).tar.gz
-PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/48/6a/7f78fbf883f325b70ba9ce5c10d97652f5c371e224940097c2cea9d0f456
+PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/b2/35/171c8977162f1163368406deddde4c59673b62bd0cb2f34948a02effb075
 PYTHON_TABLEDATA_SETUP_TYPE = setuptools
 PYTHON_TABLEDATA_LICENSE = MIT
 PYTHON_TABLEDATA_LICENSE_FILES = LICENSE
+PYTHON_TABLEDATA_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
