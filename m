Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD01CC83F38
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94B9860BB2;
	Thu, 17 Jul 2025 20:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDPp14_eslqO; Thu, 17 Jul 2025 20:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B26B360B1F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B26B360B1F;
	Thu, 17 Jul 2025 20:43:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C1871A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2031C820CB
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBUPzcqRooI9 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31A03820CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31A03820CA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 306E584D71; Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 22:32:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f1c46ef4ecc15d52a59f15772442df774823513
X-Git-Newrev: 9626618831fe208ef94f4cec0af3008611b33e4d
X-Patchwork-Hint: ignore
Message-Id: <20250717204325.306E584D71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-rust: bump to
 version 1.11.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9626618831fe208ef94f4cec0af3008611b33e4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index 2b7c7b9387..daba4fb28e 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  09bd134c06a3083ed65a6ca01314dbe7  setuptools_rust-1.11.0.tar.gz
-sha256  f765d66f3def6fdc85e1e6d889c6a812aea1430c8dadcf1c7b6779b45f874fb2  setuptools_rust-1.11.0.tar.gz
+md5  cc5c2cf6828af473951295d9f33bcf33  setuptools_rust-1.11.1.tar.gz
+sha256  7dabc4392252ced314b8050d63276e05fdc5d32398fc7d3cce1f6a6ac35b76c0  setuptools_rust-1.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index ef61da549a..01cd04867a 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.11.0
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.11.1
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools_rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/e0/0c/db5a68b4e95229db38a1793d58561870bd68b92b95fed183c6cd48910c9f
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/e0/92/bf8589b1a2b6107cf9ec8daa9954c0b7620643fe1f37d31d75e572d995f5
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
