Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA36C71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 17:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 663B180F47;
	Mon,  7 Jul 2025 17:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75a-zHo-rksi; Mon,  7 Jul 2025 17:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BE2180E8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE2180E8B;
	Mon,  7 Jul 2025 17:02:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65AE41BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6249A60A9C
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNl9ZTZmFkPJ for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 17:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9695B60B6E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9695B60B6E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:02:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84EA085FEF; Mon,  7 Jul 2025 17:02:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Jul 2025 18:54:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 279cd778651b2f66122233ef6b958a91a5489027
X-Git-Newrev: 3c46549f890977a805ecbf460bb2f022f482feaa
X-Patchwork-Hint: ignore
Message-Id: <20250707170253.84EA085FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-spidev: bump to version 3.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c46549f890977a805ecbf460bb2f022f482feaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is just a minor upgrade for fixed deprecation warning

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
[Julien: fix hash file spacing to resolve check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-spidev/python-spidev.hash | 4 ++--
 package/python-spidev/python-spidev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-spidev/python-spidev.hash b/package/python-spidev/python-spidev.hash
index cd8a24eb72..77f7ce4039 100644
--- a/package/python-spidev/python-spidev.hash
+++ b/package/python-spidev/python-spidev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/spidev/json
-md5  83a73279d6e823a9030c4315577bfae3  spidev-3.6.tar.gz
-sha256  14dbc37594a4aaef85403ab617985d3c3ef464d62bc9b769ef552db53701115b  spidev-3.6.tar.gz
+md5  3074b983c687b1ec3a80833a7508642d  spidev-3.7.tar.gz
+sha256  ce628a5ff489f45132679879bff5f455a66abf9751af01843850155b06ae92f0  spidev-3.7.tar.gz
 # Locally computed sha256 checksums
 sha256  510129bc8174c0fa81fa6d653691d1bd5d3555f7f38979ec45b5fc5bbff5377b  LICENSE
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
index f48b5b0832..e93871c745 100644
--- a/package/python-spidev/python-spidev.mk
+++ b/package/python-spidev/python-spidev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SPIDEV_VERSION = 3.6
+PYTHON_SPIDEV_VERSION = 3.7
 PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
-PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/c7/d9/401c0a7be089e02826cf2c201f489876b601f15be100fe391ef9c2faed83
+PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/b5/99/dd50af8200e224ce9412ad01cdbeeb5b39b2d61acd72138f2b92c4a6d619
 PYTHON_SPIDEV_SETUP_TYPE = setuptools
 PYTHON_SPIDEV_LICENSE = MIT
 PYTHON_SPIDEV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
