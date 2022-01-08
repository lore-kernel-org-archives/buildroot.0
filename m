Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7AEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 23:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E57DC40457;
	Sat,  8 Jan 2022 23:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id daVUZuF252AL; Sat,  8 Jan 2022 23:16:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34F9540422;
	Sat,  8 Jan 2022 23:16:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1057B1BF95E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1F044040B
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RY3kr9ZgiPm0 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 23:16:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F32B40422
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 23:16:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 02F58813CA; Sat,  8 Jan 2022 23:10:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 00:15:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf0cc7d7b4fecde6c350bd886e7f60b95660ef10
X-Git-Newrev: 5138621497a9a6621d1ef36faf66a3e1ac1677f0
X-Patchwork-Hint: ignore
Message-Id: <20220108231002.02F58813CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-rust: bump to
 version 1.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5138621497a9a6621d1ef36faf66a3e1ac1677f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index a93e98e8c8..6bb42d918c 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  33c3fd3bcde2877483ab782353bee54c  setuptools-rust-0.12.1.tar.gz
-sha256  647009e924f0ae439c7f3e0141a184a69ad247ecb9044c511dabde232d3d570e  setuptools-rust-0.12.1.tar.gz
+md5  479fcd267ff48929bec9a7270e1a96d7  setuptools-rust-1.1.2.tar.gz
+sha256  a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea7f747e153a3e65d1  setuptools-rust-1.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index fe299e8057..c87a0da3c7 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 0.12.1
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.1.2
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/12/22/6ba3031e7cbd6eb002e13ffc7397e136df95813b6a2bd71ece52a8f89613
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-setuptools-scm host-python-toml host-python-semantic-version
+HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-setuptools-scm host-python-toml host-python-semantic-version host-python-typing-extensions
 HOST_PYTHON_SETUPTOOLS_RUST_NEEDS_HOST_PYTHON = python3
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
