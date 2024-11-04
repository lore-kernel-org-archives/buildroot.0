Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70246D1BDF1
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DF38810A2;
	Mon,  4 Nov 2024 20:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qe4xy-WBOcS; Mon,  4 Nov 2024 20:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39DE3810DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39DE3810DA;
	Mon,  4 Nov 2024 20:43:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 029E83B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C139140530
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhP7kXoyKyCB for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F223B40528
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F223B40528
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE45D84CC9; Mon,  4 Nov 2024 20:42:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 21:39:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c2db937d85c8968ea1d6b5da18742167b87ab3c
X-Git-Newrev: 41ac6c2be67fbd43dba8e0b7b3e6e3465dfe1aa8
X-Patchwork-Hint: ignore
Message-Id: <20241104204204.EE45D84CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mwscrape: bump to version
 2e153faa678b90402ca87aa765f7d11386d7942c
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

commit: https://git.buildroot.net/buildroot/commit/?id=41ac6c2be67fbd43dba8e0b7b3e6e3465dfe1aa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-mwscrape/python-mwscrape.hash | 2 +-
 package/python-mwscrape/python-mwscrape.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-mwscrape/python-mwscrape.hash b/package/python-mwscrape/python-mwscrape.hash
index 0f64a9e19c..82964d317e 100644
--- a/package/python-mwscrape/python-mwscrape.hash
+++ b/package/python-mwscrape/python-mwscrape.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d0e6c747f6a866dedbc759f78830b3f496e8d03401a3c727d0b48735341c5b6  python-mwscrape-568ccbe6e12dd6391277df02adf724ba0e5f9197.tar.gz
+sha256  11b97dab59a4494238fc7f86c3d132bd9f042890284e9f477ed4cef0e869921f  python-mwscrape-2e153faa678b90402ca87aa765f7d11386d7942c.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE.txt
diff --git a/package/python-mwscrape/python-mwscrape.mk b/package/python-mwscrape/python-mwscrape.mk
index 8b6c718c56..b15e026505 100644
--- a/package/python-mwscrape/python-mwscrape.mk
+++ b/package/python-mwscrape/python-mwscrape.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_MWSCRAPE_VERSION = 568ccbe6e12dd6391277df02adf724ba0e5f9197
+PYTHON_MWSCRAPE_VERSION = 2e153faa678b90402ca87aa765f7d11386d7942c
 PYTHON_MWSCRAPE_SITE = $(call github,itkach,mwscrape,$(PYTHON_MWSCRAPE_VERSION))
 PYTHON_MWSCRAPE_LICENSE = MPL-2.0
 PYTHON_MWSCRAPE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
