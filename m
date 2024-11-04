Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAE9D1BDF2
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BE7481066;
	Mon,  4 Nov 2024 20:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpHTtIHiB0qU; Mon,  4 Nov 2024 20:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F02D381046
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F02D381046;
	Mon,  4 Nov 2024 20:42:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 545D927E1
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 364F08101B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o71kk2z5ZFBg for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66DF48101D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66DF48101D
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62C1884CC9; Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 21:39:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbce27d2519cc9caf5710d67282975c915a4b25a
X-Git-Newrev: cab9b431a47b184589251a9b404d31074bb024ea
X-Patchwork-Hint: ignore
Message-Id: <20241104204205.62C1884CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-selenium: bump to version
 4.26.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=cab9b431a47b184589251a9b404d31074bb024ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-selenium/python-selenium.hash | 2 +-
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index aa492248a5..c3dd0879cd 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  2e801325943bae1ccf4978b76e25f539d2e24d5765891be20d77d117940a9674  python-selenium-4.25.0-cargo2.tar.gz
+sha256  0c7bbef3f83aa48e1786ecc089e8d6a23c35164e7e9b02917697eca7a23628a2  python-selenium-4.26.1-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  de658a7d3761e92b471e2f630ea99eeb3389b27820809b1e4853baabd5fbadb7  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index b317a83148..8f5f2c3598 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.25.0
+PYTHON_SELENIUM_VERSION = 4.26.1
 PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/0e/5a/d3735b189b91715fd0f5a9b8d55e2605061309849470e96ab830f02cba40
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/3f/b1/e9efcb88d5682e802cf03bdee4886f854d75bdb2859d1e72cb74041b4ef6
 PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
