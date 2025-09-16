Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72321CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 21:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 273D660B6E;
	Tue, 16 Sep 2025 21:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id csZTVOiNZaiG; Tue, 16 Sep 2025 21:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56008611F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56008611F4;
	Tue, 16 Sep 2025 21:16:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2E5812D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D50BC41DC8
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VhixHdM2zgy for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 21:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DA7D41DB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DA7D41DB2
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:16:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 095BA84EF8; Tue, 16 Sep 2025 21:16:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:55:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3809dfaf3522ece78c197f00720538b0bbe6e59
X-Git-Newrev: 07903d2b274bc98f930e06dee237682015acb1d7
X-Patchwork-Hint: ignore
Message-Id: <20250916211649.095BA84EF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cffi: bump to version 2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=07903d2b274bc98f930e06dee237682015acb1d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License has changed due to license change from regular MIT to
MIT-no-attribution:
https://github.com/python-cffi/cffi/commit/67a170dc7972dc9361743690b38da3d963b200ef

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cffi/python-cffi.hash | 6 +++---
 package/python-cffi/python-cffi.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 2847d38b55..347a6f3ede 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cffi/json
-md5  4336ca58b2df0cc3b163884d5fa2e5e2  cffi-1.17.1.tar.gz
-sha256  1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824  cffi-1.17.1.tar.gz
+md5  5e897f6251e614f6bd128a73e81801a4  cffi-2.0.0.tar.gz
+sha256  44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529  cffi-2.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
+sha256  5ba24ddc57067f9249add644c3afc41a5d6dc37e23433ef759d95df370b0af63  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 152009e8ca..ab9068b101 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.17.1
+PYTHON_CFFI_VERSION = 2.0.0
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/fc/97/c783634659c2920c3fc70419e3af40972dbaf758daa229a7d6ea6135c90d
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
-PYTHON_CFFI_LICENSE = MIT
+PYTHON_CFFI_LICENSE = MIT-0
 PYTHON_CFFI_LICENSE_FILES = LICENSE
 
 # This host package uses pkg-config to find libffi, so we have to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
