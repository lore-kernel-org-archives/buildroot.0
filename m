Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CABC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB278703F4;
	Fri, 28 Feb 2025 16:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRopOUHy7l5p; Fri, 28 Feb 2025 16:53:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A1C970388
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A1C970388;
	Fri, 28 Feb 2025 16:53:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FA4E94F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB38942FD2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5m8VJOOnPFEZ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57E6F41E69
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57E6F41E69
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5065B87A8B; Fri, 28 Feb 2025 16:30:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 17:20:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 67f16fae0c26ffcddace7ce9db0fb98f4dc44878
X-Git-Newrev: 979f9cdff0be3f7e56e207dc200ae17288239766
X-Patchwork-Hint: ignore
Message-Id: <20250228163003.5065B87A8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-modbus-tk: bump
 to version 1.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=979f9cdff0be3f7e56e207dc200ae17288239766
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-modbus-tk/python-modbus-tk.hash | 4 ++--
 package/python-modbus-tk/python-modbus-tk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-modbus-tk/python-modbus-tk.hash b/package/python-modbus-tk/python-modbus-tk.hash
index c7f4ac2dd4..c60733b02d 100644
--- a/package/python-modbus-tk/python-modbus-tk.hash
+++ b/package/python-modbus-tk/python-modbus-tk.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/modbus-tk/json
-md5  2e66c361d3e4591a19be1259ef50fdf7  modbus_tk-1.1.3.tar.gz
-sha256  690fa7bb86ea978992465d2d61c8b5acc639ce0e8b833a0aa96d4dd172c5644a  modbus_tk-1.1.3.tar.gz
+md5  03873278a842535c9069cc0dd352f520  modbus_tk-1.1.4.tar.gz
+sha256  68977766eb10469973dd56a2814bd981b85dd180b79043248786d88008f2593b  modbus_tk-1.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3b6a7f9c478ac1982e86cdadb45eb4788241b95839500eb26839d5053b74a24a  license.txt
 sha256  aa7ca42152a13db6a27b31944f99851efc3b9ee813912ff21d7d6ceadca62e6f  copying.txt
diff --git a/package/python-modbus-tk/python-modbus-tk.mk b/package/python-modbus-tk/python-modbus-tk.mk
index d8552e57a6..2e15354b04 100644
--- a/package/python-modbus-tk/python-modbus-tk.mk
+++ b/package/python-modbus-tk/python-modbus-tk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MODBUS_TK_VERSION = 1.1.3
+PYTHON_MODBUS_TK_VERSION = 1.1.4
 PYTHON_MODBUS_TK_SOURCE = modbus_tk-$(PYTHON_MODBUS_TK_VERSION).tar.gz
-PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/8d/9f/5963e30dba160dbc646b76c59ca8136709c7fe9002bbaaa3cf1e1bb0404b
+PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/78/40/9ae5c428b1867bfccd3c184dcf18cfef04e3d9c5b9dc22b8e9eb8d480651
 PYTHON_MODBUS_TK_SETUP_TYPE = setuptools
 PYTHON_MODBUS_TK_LICENSE = LGPL-2.1+
 PYTHON_MODBUS_TK_LICENSE_FILES = license.txt copying.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
