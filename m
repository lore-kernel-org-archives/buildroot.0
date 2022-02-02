Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FD6C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 10:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68337833C6;
	Wed,  2 Feb 2022 10:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ek1oL-vr-ZGY; Wed,  2 Feb 2022 10:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C43E818C2;
	Wed,  2 Feb 2022 10:22:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD3C1BF9B9
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E3DF60EC3
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3krcpW21E9-w for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 10:21:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEB6060FAD
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 10:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BCAED829F9; Wed,  2 Feb 2022 10:14:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Feb 2022 11:20:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b32b8785df57b3efda67f3b0390574fd65698693
X-Git-Newrev: 02358c962c43b90f272aedd77a43033643056557
X-Patchwork-Hint: ignore
Message-Id: <20220202101446.BCAED829F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyparsing: bump to version
 3.0.7
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02358c962c43b90f272aedd77a43033643056557
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index a21baf46e5..1e56e878a1 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  2f5fad6c8e99ac2562ab08ad9e45b195  pyparsing-3.0.6.tar.gz
-sha256  d9bdec0013ef1eb5a84ab39a3b3868911598afa494f5faa038647101504e2b81  pyparsing-3.0.6.tar.gz
+md5  9d38774991175444e21a3dfa865876cc  pyparsing-3.0.7.tar.gz
+sha256  18ee9022775d270c55187733956460083db60b37d0d0fb357445f3094eed3eea  pyparsing-3.0.7.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index b6ab353a6d..e33541bdb7 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.0.6
+PYTHON_PYPARSING_VERSION = 3.0.7
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/ab/61/1a1613e3dcca483a7aa9d446cb4614e6425eb853b90db131c305bd9674cb
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/d6/60/9bed18f43275b34198eb9720d4c1238c68b3755620d20df0afd89424d32b
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
