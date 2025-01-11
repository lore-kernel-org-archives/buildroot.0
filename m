Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862A2E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5424160BBA;
	Sat, 11 Jan 2025 16:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDd6_xjOKtqt; Sat, 11 Jan 2025 16:23:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E47560C1F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E47560C1F;
	Sat, 11 Jan 2025 16:23:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FFE1940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACF3E60A4F
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIFTlBH-0Neb for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DDB860A94
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DDB860A94
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:23:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7AAA78184C; Sat, 11 Jan 2025 16:23:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 17:15:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 178130bbad97c0b2b6665557f6345f5a86e0e08d
X-Git-Newrev: 7476515466c27d0918eb81847d4937a2b2a3f745
X-Patchwork-Hint: ignore
Message-Id: <20250111162314.7AAA78184C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-matplotlib: bump to version
 3.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7476515466c27d0918eb81847d4937a2b2a3f745
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-matplotlib/python-matplotlib.hash | 4 ++--
 package/python-matplotlib/python-matplotlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-matplotlib/python-matplotlib.hash b/package/python-matplotlib/python-matplotlib.hash
index 2882997b8a..c862860b06 100644
--- a/package/python-matplotlib/python-matplotlib.hash
+++ b/package/python-matplotlib/python-matplotlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/matplotlib/json
-md5  bb92dfd3c1e9c816100b91008be5e300  matplotlib-3.9.2.tar.gz
-sha256  96ab43906269ca64a6366934106fa01534454a69e471b7bf3d79083981aaab92  matplotlib-3.9.2.tar.gz
+md5  9c9a5c3ced2bba7b5b2f8dab68ae4b06  matplotlib-3.10.0.tar.gz
+sha256  b886d02a581b96704c9d1ffe55709e49b4d2d52709ccebc4be42db856e511278  matplotlib-3.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 7312d2b1ec..49fbd76bdb 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_VERSION = 3.9.2
+PYTHON_MATPLOTLIB_VERSION = 3.10.0
 PYTHON_MATPLOTLIB_SOURCE = matplotlib-$(PYTHON_MATPLOTLIB_VERSION).tar.gz
-PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/9e/d8/3d7f706c69e024d4287c1110d74f7dabac91d9843b99eadc90de9efc8869
+PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/68/dd/fa2e1a45fce2d09f4aea3cee169760e672c8262325aa5796c49d543dc7e6
 PYTHON_MATPLOTLIB_LICENSE = Python-2.0
 PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE/LICENSE
 PYTHON_MATPLOTLIB_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
