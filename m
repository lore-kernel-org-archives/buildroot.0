Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B039AD1BDF1
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8029C8104F;
	Mon,  4 Nov 2024 20:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Gjdh5yXeg52; Mon,  4 Nov 2024 20:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87BBF81083
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87BBF81083;
	Mon,  4 Nov 2024 20:42:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 578C73B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23D8260796
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrHJN3nZjBP9 for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FA2F6079D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FA2F6079D
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C21884CC9; Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 21:39:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55fdf4c61da9006d5b0e2c647cb44f4350434ac4
X-Git-Newrev: 0eb7d710daa0aa0cf0a066d1702effe1f7d63b17
X-Patchwork-Hint: ignore
Message-Id: <20241104204205.3C21884CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysmi: bump to version 1.5.6
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0eb7d710daa0aa0cf0a066d1702effe1f7d63b17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pysmi/python-pysmi.hash | 4 ++--
 package/python-pysmi/python-pysmi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index 39a76fc740..1736572710 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5  84ff7ba2166c022b194c271f43b14c56  pysmi-1.5.5.tar.gz
-sha256  ad96dc983370e2b29a37dcc3af4ca6948127522b629bece23320ca0698c1b605  pysmi-1.5.5.tar.gz
+md5  4fc3708430d818df6d6cf3543b01d5d6  pysmi-1.5.6.tar.gz
+sha256  5b25825a5b4a566c42615c7b80547834dd32be394bf0c0504f56676843f96749  pysmi-1.5.6.tar.gz
 # Locally computed sha256 checksums
 sha256  bc211b99a3eb46f3b1f64f8152dffc869d3bc4bffed82545732ef9e34628513b  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index 753105928c..a2793647d8 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 1.5.5
+PYTHON_PYSMI_VERSION = 1.5.6
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/dc/fb/8461c21d0893c72492100b35fce128b057c4e615e79b0ce4496412ffec0c
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/a3/a1/b43edf8fd80c550782c9f0daa499c7d3013d31ff924405a7f96c9cdaa5d2
 PYTHON_PYSMI_SETUP_TYPE = pep517
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
