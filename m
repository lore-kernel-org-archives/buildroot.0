Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE5AC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4834841810;
	Thu, 17 Jul 2025 20:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBQqeedSfxPH; Thu, 17 Jul 2025 20:43:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CAE9417FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CAE9417FF;
	Thu, 17 Jul 2025 20:43:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC6B41A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66264820CF
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9Z9CdEuPXPA for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67EDF82128
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67EDF82128
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66F8886351; Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 22:35:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e0eb020135979fb5b923dcde9a7771e9dfb33fa
X-Git-Newrev: fff98fd6ed6ce71e9f4c648646181acfe87b760b
X-Patchwork-Hint: ignore
Message-Id: <20250717204325.66F8886351@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hatch-fancy-pypi-readme:
 bump to version 25.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fff98fd6ed6ce71e9f4c648646181acfe87b760b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .../python-hatch-fancy-pypi-readme.hash                               | 4 ++--
 .../python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
index e3a6363eb7..e2d22cb287 100644
--- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatch-fancy-pypi-readme/json
-md5  f5f9e639f066c91f8e623ec6231beae9  hatch_fancy_pypi_readme-24.1.0.tar.gz
-sha256  44dd239f1a779b9dcf8ebc9401a611fd7f7e3e14578dcf22c265dfaf7c1514b8  hatch_fancy_pypi_readme-24.1.0.tar.gz
+md5  8e1ed2416887685adc1c909ed4fb63cb  hatch_fancy_pypi_readme-25.1.0.tar.gz
+sha256  9c58ed3dff90d51f43414ce37009ad1d5b0f08ffc9fc216998a06380f01c0045  hatch_fancy_pypi_readme-25.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e69ea57f96e599e617f61af3e85bf326b87e833994709fb5e5908a81197730a2  LICENSE.txt
diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
index 0857864965..5e658239b1 100644
--- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCH_FANCY_PYPI_README_VERSION = 24.1.0
+PYTHON_HATCH_FANCY_PYPI_README_VERSION = 25.1.0
 PYTHON_HATCH_FANCY_PYPI_README_SOURCE = hatch_fancy_pypi_readme-$(PYTHON_HATCH_FANCY_PYPI_README_VERSION).tar.gz
-PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/b4/c2/c9094283a07dd96c5a8f7a5f1910259d40d2e29223b95dd875a6ca13b58f
+PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/f3/0f/aed57c301f339936eb91cb4d8c1e5088a101081854bd3ec18a889df32365
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE = MIT
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = hatch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
