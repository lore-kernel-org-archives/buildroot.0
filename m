Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619EBC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F4814289B;
	Fri, 10 Nov 2023 21:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F4814289B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74pRFfiUX49Y; Fri, 10 Nov 2023 21:19:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 532D4428A3;
	Fri, 10 Nov 2023 21:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 532D4428A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A762C1BF997
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F2F641913
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F2F641913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBY_zSECzhf8 for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:19:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C030400BD
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C030400BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4658F87002; Fri, 10 Nov 2023 21:19:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:16:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab3d5a5f5e9be354f8fcde9ebd85eebc21c4379c
X-Git-Newrev: b23e07206570e440fb04c55c88a678d3fd870a00
X-Patchwork-Hint: ignore
Message-Id: <20231110211928.4658F87002@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-kiwisolver: bump to version
 1.4.5
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b23e07206570e440fb04c55c88a678d3fd870a00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-kiwisolver/python-kiwisolver.hash | 4 ++--
 package/python-kiwisolver/python-kiwisolver.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
index 7f2e263a5b..900027a88b 100644
--- a/package/python-kiwisolver/python-kiwisolver.hash
+++ b/package/python-kiwisolver/python-kiwisolver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/kiwisolver/json
-md5  34796908455c3b23c889439b541e424b  kiwisolver-1.4.4.tar.gz
-sha256  d41997519fcba4a1e46eb4a2fe31bc12f0ff957b2b81bac28db24744f333e955  kiwisolver-1.4.4.tar.gz
+md5  20dea6992699d6be8a563995d7fe0309  kiwisolver-1.4.5.tar.gz
+sha256  e57e563a57fb22a142da34f38acc2fc1a5c864bc29ca1517a88abc963e60d6ec  kiwisolver-1.4.5.tar.gz
 # Locally computed sha256 checksums
 sha256  26da8d49744796f2601fb5fe9e5d8b9e8102064ca60a8dc1825b6177cb05450c  LICENSE
diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
index 2c5db26dbc..04a0779b37 100644
--- a/package/python-kiwisolver/python-kiwisolver.mk
+++ b/package/python-kiwisolver/python-kiwisolver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KIWISOLVER_VERSION = 1.4.4
+PYTHON_KIWISOLVER_VERSION = 1.4.5
 PYTHON_KIWISOLVER_SOURCE = kiwisolver-$(PYTHON_KIWISOLVER_VERSION).tar.gz
-PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/5f/5c/272a7dd49a1914f35cd8d6d9f386defa8b047f6fbd06badd6b77b3ba24e7
+PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/b9/2d/226779e405724344fc678fcc025b812587617ea1a48b9442628b688e85ea
 PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
 PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
 PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
