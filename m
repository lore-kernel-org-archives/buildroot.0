Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB12CCD18E
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 22:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1FB5612A2;
	Tue, 14 Oct 2025 22:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_fWFTszHIQU; Tue, 14 Oct 2025 22:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E6D560F42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E6D560F42;
	Tue, 14 Oct 2025 22:00:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 313214C4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF9FD406AF
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8hlvDK5R1Xi for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 22:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FA1D40742
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FA1D40742
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D864870FC; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 23:58:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6bd542dcefe87edc4e21530fae0436371b85203
X-Git-Newrev: 2ab5af64c0ffe67f597c085c0ef9442ae3e347d3
X-Patchwork-Hint: ignore
Message-Id: <20251014220002.7D864870FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-spidev: bump version to 3.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ab5af64c0ffe67f597c085c0ef9442ae3e347d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-spidev/python-spidev.hash | 4 ++--
 package/python-spidev/python-spidev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-spidev/python-spidev.hash b/package/python-spidev/python-spidev.hash
index 77f7ce4039..166a36faba 100644
--- a/package/python-spidev/python-spidev.hash
+++ b/package/python-spidev/python-spidev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/spidev/json
-md5  3074b983c687b1ec3a80833a7508642d  spidev-3.7.tar.gz
-sha256  ce628a5ff489f45132679879bff5f455a66abf9751af01843850155b06ae92f0  spidev-3.7.tar.gz
+md5  1c44b18936bfb8d519f11ef9fe15fc73  spidev-3.8.tar.gz
+sha256  2bc02fb8c6312d519ebf1f4331067427c0921d3f77b8bcaf05189a2e8b8382c0  spidev-3.8.tar.gz
 # Locally computed sha256 checksums
 sha256  510129bc8174c0fa81fa6d653691d1bd5d3555f7f38979ec45b5fc5bbff5377b  LICENSE
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
index e93871c745..2f7f7f23fc 100644
--- a/package/python-spidev/python-spidev.mk
+++ b/package/python-spidev/python-spidev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SPIDEV_VERSION = 3.7
+PYTHON_SPIDEV_VERSION = 3.8
 PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
-PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/b5/99/dd50af8200e224ce9412ad01cdbeeb5b39b2d61acd72138f2b92c4a6d619
+PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/67/87/039b6eeea781598015b538691bc174cc0bf77df9d4d2d3b8bf9245c0de8c
 PYTHON_SPIDEV_SETUP_TYPE = setuptools
 PYTHON_SPIDEV_LICENSE = MIT
 PYTHON_SPIDEV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
