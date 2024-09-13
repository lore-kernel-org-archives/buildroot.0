Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB942FC6172
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 22:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94287406F8;
	Fri, 13 Sep 2024 22:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3uPf90mgBfs; Fri, 13 Sep 2024 22:18:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61E4D424D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E4D424D2;
	Fri, 13 Sep 2024 22:18:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 428F31BF2BE
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31BAA4024D
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYLFcI4am79C for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 22:18:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1576D402DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1576D402DC
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 22:18:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 031AE86FFC; Fri, 13 Sep 2024 22:18:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 00:18:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d30841bb82e076e64067af9ef3cc3ab58ced8558
X-Git-Newrev: 30e39b33e9b6a2680357ad5d5120ac6d70ecbf7b
X-Patchwork-Hint: ignore
Message-Id: <20240913221843.031AE86FFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-sse: bump to
 version 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=30e39b33e9b6a2680357ad5d5120ac6d70ecbf7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiohttp-sse/python-aiohttp-sse.hash | 4 ++--
 package/python-aiohttp-sse/python-aiohttp-sse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.hash b/package/python-aiohttp-sse/python-aiohttp-sse.hash
index 224601450c..e8382e7f8e 100644
--- a/package/python-aiohttp-sse/python-aiohttp-sse.hash
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-sse/json
-md5  822cd0c30325e8a711101c1a1ede4058  aiohttp-sse-2.1.0.tar.gz
-sha256  dfe8f7271ab4470891fa1bfa1913d6889b3d19015dd3d3a4cab949e66971bbca  aiohttp-sse-2.1.0.tar.gz
+md5  8c86e737a2f3642941c1d383f42ce6ae  aiohttp-sse-2.2.0.tar.gz
+sha256  a48dd5774031d3f41a29e159ebdbb93e89c8f37c1e9e83e196296be51885a5c2  aiohttp-sse-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5585eb91ec607b4fdbe97d44a61146a9cc27bb703336628bc3c6a1eaffe60307  LICENSE
diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.mk b/package/python-aiohttp-sse/python-aiohttp-sse.mk
index 2aef1579f5..bf46c98528 100644
--- a/package/python-aiohttp-sse/python-aiohttp-sse.mk
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SSE_VERSION = 2.1.0
+PYTHON_AIOHTTP_SSE_VERSION = 2.2.0
 PYTHON_AIOHTTP_SSE_SOURCE = aiohttp-sse-$(PYTHON_AIOHTTP_SSE_VERSION).tar.gz
-PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/2f/3f/cc4f5a3fe6cb50ad5b9d26bb7738c5da1f61645b517d4230df2fc32d89f0
+PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/80/df/4ddb30e689695fd91cf41c072e154061120ed166e8baf6c9a0020f27dffc
 PYTHON_AIOHTTP_SSE_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SSE_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
