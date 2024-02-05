Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F450C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F0F60F3B;
	Mon,  5 Feb 2024 13:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F0F60F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9wApqzzXudc; Mon,  5 Feb 2024 13:30:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 584C960F2F;
	Mon,  5 Feb 2024 13:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 584C960F2F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6443B1BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C40F4049A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C40F4049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1Y6r0GHLZfJ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0868D400C4
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0868D400C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6A2F86C2E; Mon,  5 Feb 2024 13:29:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 14:28:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa51f4ac41327eb8277938f2e8f5c11c59113cb3
X-Git-Newrev: 362e5cee6237b2f3a341edad11e435773a0d491a
X-Patchwork-Hint: ignore
Message-Id: <20240205132914.E6A2F86C2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-argh: bump to version 0.31.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=362e5cee6237b2f3a341edad11e435773a0d491a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-argh/python-argh.hash | 8 ++++----
 package/python-argh/python-argh.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
index 8bfb45d1c3..bac9df42d6 100644
--- a/package/python-argh/python-argh.hash
+++ b/package/python-argh/python-argh.hash
@@ -1,6 +1,6 @@
-# md5 from https://pypi.python.org/pypi/argh/json
-md5  7001dd9ff619cf1422ddf8bf813bd08a  argh-0.30.4.tar.gz
-sha256  9fca8e69c4dad4f8d2a7bdfbdd80b0754462b53510a03e1b5cf2b43a87e6e960  argh-0.30.4.tar.gz
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/argh/json
+md5  2659a6353589156e6aa65a99797f8913  argh-0.31.0.tar.gz
+sha256  b93093544309ddbfe6c73dc9bfd60dbc4acecef39f3f464774b3084a1ec5d7b0  argh-0.31.0.tar.gz
+# Locally computed sha256 checksums
 sha256  2594f46b9b23a5fddeca090faeb270c7ceee8116675fe35082be859aa7466e89  COPYING
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
index ccb9f61d48..0da3281d49 100644
--- a/package/python-argh/python-argh.mk
+++ b/package/python-argh/python-argh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGH_VERSION = 0.30.4
+PYTHON_ARGH_VERSION = 0.31.0
 PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
-PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/37/3a/175f4a2c47e8c20e59cf25fe69546f76cf1196251a377b182e8f4542b4c4
+PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/7c/3c/1b7f3fab380c96d61119178040c0183161fe0f182c4da3933bcb3284538f
 PYTHON_ARGH_SETUP_TYPE = flit
 PYTHON_ARGH_LICENSE = LGPL-3.0+
 PYTHON_ARGH_LICENSE_FILES = COPYING COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
