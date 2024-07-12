Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A972C3DA4D
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC60B41868;
	Fri, 12 Jul 2024 13:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTtYnyt8_YTK; Fri, 12 Jul 2024 13:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B51C44187C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B51C44187C;
	Fri, 12 Jul 2024 13:22:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AAA51BF4E6
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 356E084616
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTR0DpIwh2vu for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AB83845FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AB83845FE
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:22:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A40785E68; Fri, 12 Jul 2024 13:22:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 15:21:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f538c7e6bdc07e3bd3db7a34798a47a905af4413
X-Git-Newrev: 8d466affdbdff1cd6de6fa5ddcc44d920cd3abdc
X-Patchwork-Hint: ignore
Message-Id: <20240712132203.0A40785E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ruamel-yaml: bump to
 version 0.18.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8d466affdbdff1cd6de6fa5ddcc44d920cd3abdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://sourceforge.net/p/ruamel-yaml/code/ci/56b3e2666fb275deab3eec99193c103e4edf93bb/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 6 +++---
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index ee5016835b..02845d112b 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel.yaml/json
-md5  206bda0f33ab2c2f63777636200748b7  ruamel.yaml-0.17.21.tar.gz
-sha256  8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af  ruamel.yaml-0.17.21.tar.gz
+md5  24fac3544a3c7bd7eeaf6e4f704a056e  ruamel.yaml-0.18.5.tar.gz
+sha256  61917e3a35a569c1133a8f772e1226961bf5a1198bea7e23f06a0841dea1ab0e  ruamel.yaml-0.18.5.tar.gz
 # Locally computed sha256 checksums
-sha256  ab837b032c5aae84503fc0c733a116a26fd272e90dc4402fa68d3c9e51aed3b0  LICENSE
+sha256  ba45629abb7022949148ce65de4a59e7ee164d30c94450389a6afdd3ebe4e9e0  LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index a6fed3bc2c..bbdac591ca 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_VERSION = 0.17.21
+PYTHON_RUAMEL_YAML_VERSION = 0.18.5
 PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/46/a9/6ed24832095b692a8cecc323230ce2ec3480015fbfa4b79941bd41b23a3c
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/82/43/fa976e03a4a9ae406904489119cd7dd4509752ca692b2e0a19491ca1782c
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
