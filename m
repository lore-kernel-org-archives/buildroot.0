Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77819CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 20:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 335BB615AC;
	Tue, 14 Oct 2025 20:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rw4rDl6kyq8g; Tue, 14 Oct 2025 20:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D583B615B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D583B615B5;
	Tue, 14 Oct 2025 20:30:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7142ABC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABE8F4022D
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGz4Kl3l8ZC1 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 20:29:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B3C3403FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B3C3403FC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49A69870FD; Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 22:10:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fac30633345f50602df02365a95f06a303c28444
X-Git-Newrev: 2510757e5e6debeab28569c8dad97af67671ecfa
X-Patchwork-Hint: ignore
Message-Id: <20251014202937.49A69870FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-libevdev: bump version to
 0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=2510757e5e6debeab28569c8dad97af67671ecfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-libevdev/python-libevdev.hash | 4 ++--
 package/python-libevdev/python-libevdev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-libevdev/python-libevdev.hash b/package/python-libevdev/python-libevdev.hash
index 2799078cc8..c48ddbf716 100644
--- a/package/python-libevdev/python-libevdev.hash
+++ b/package/python-libevdev/python-libevdev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/libevdev/json
-md5  34b48098c1fba26de79a0d67a17a588a  libevdev-0.11.tar.gz
-sha256  e9ca006a4df2488a60bd9a740011ee948d81904be2364f017e560169508f560f  libevdev-0.11.tar.gz
+md5  9bf8acc011c72d1466ae8f0b8f2c5fac  libevdev-0.12.tar.gz
+sha256  02e952632ec6c249cbb9c66f6fa00012ea448b06606c77cd139133bc2fe46b08  libevdev-0.12.tar.gz
 # Locally computed sha256 checksums
 sha256  a547b196da4e5bb9588a6e24f1f36ae9e2349ca5375e2cf9c315186e237d9f6d  COPYING
diff --git a/package/python-libevdev/python-libevdev.mk b/package/python-libevdev/python-libevdev.mk
index e5256064c9..cc40adc874 100644
--- a/package/python-libevdev/python-libevdev.mk
+++ b/package/python-libevdev/python-libevdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBEVDEV_VERSION = 0.11
+PYTHON_LIBEVDEV_VERSION = 0.12
 PYTHON_LIBEVDEV_SOURCE = libevdev-$(PYTHON_LIBEVDEV_VERSION).tar.gz
-PYTHON_LIBEVDEV_SITE = https://files.pythonhosted.org/packages/b0/49/2fe589ce1fa6ca0f05ae0b1717923650f2cc6eec6307c71fbc7789738902
+PYTHON_LIBEVDEV_SITE = https://files.pythonhosted.org/packages/61/6b/e0193f4ba0c3b7d20f8f1b961793d39df5538451c0959abb115020d4ec2d
 PYTHON_LIBEVDEV_SETUP_TYPE = setuptools
 PYTHON_LIBEVDEV_LICENSE = MIT
 PYTHON_LIBEVDEV_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
