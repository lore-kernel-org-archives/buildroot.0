Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61E9C0218D
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 14:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A92A60E79;
	Sat, 25 Jan 2025 14:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfBSrIihM640; Sat, 25 Jan 2025 14:33:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E73760F10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E73760F10;
	Sat, 25 Jan 2025 14:33:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06F69941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D77C60B50
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWAAOtv_0UjQ for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 14:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD2F60A7D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BD2F60A7D
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:32:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 280418637E; Sat, 25 Jan 2025 14:32:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 14:21:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9681664f066585613018e873b6199f397b8c63c6
X-Git-Newrev: 170b737330cdab8a42910b0f0a4475069554a393
X-Patchwork-Hint: ignore
Message-Id: <20250125143247.280418637E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hpack: bump to version 4.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=170b737330cdab8a42910b0f0a4475069554a393
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-hpack/python-hpack.hash | 4 ++--
 package/python-hpack/python-hpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hpack/python-hpack.hash b/package/python-hpack/python-hpack.hash
index 988cbaae0b..aaaa3bcbbb 100644
--- a/package/python-hpack/python-hpack.hash
+++ b/package/python-hpack/python-hpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hpack/json
-md5  27e01514ef06dc9fa0798d3dcb7de47c  hpack-4.0.0.tar.gz
-sha256  fc41de0c63e687ebffde81187a948221294896f6bdc0ae2312708df339430095  hpack-4.0.0.tar.gz
+md5  16e7423c5b5078c1997fa3eedd2e5935  hpack-4.1.0.tar.gz
+sha256  ec5eca154f7056aa06f196a557655c5b009b382873ac8d1e66e79e87535f1dca  hpack-4.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  LICENSE
diff --git a/package/python-hpack/python-hpack.mk b/package/python-hpack/python-hpack.mk
index 4b581c1001..2655a6b4ad 100644
--- a/package/python-hpack/python-hpack.mk
+++ b/package/python-hpack/python-hpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HPACK_VERSION = 4.0.0
+PYTHON_HPACK_VERSION = 4.1.0
 PYTHON_HPACK_SOURCE = hpack-$(PYTHON_HPACK_VERSION).tar.gz
-PYTHON_HPACK_SITE = https://files.pythonhosted.org/packages/3e/9b/fda93fb4d957db19b0f6b370e79d586b3e8528b20252c729c476a2c02954
+PYTHON_HPACK_SITE = https://files.pythonhosted.org/packages/2c/48/71de9ed269fdae9c8057e5a4c0aa7402e8bb16f2c6e90b3aa53327b113f8
 PYTHON_HPACK_SETUP_TYPE = setuptools
 PYTHON_HPACK_LICENSE = MIT
 PYTHON_HPACK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
