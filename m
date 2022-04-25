Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF44C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 21:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EF9440B14;
	Mon, 25 Apr 2022 21:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qteGvPcM9WTU; Mon, 25 Apr 2022 21:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2562940119;
	Mon, 25 Apr 2022 21:26:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3CB1BF3A6
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FDC54027A
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsCCuePZn_gv for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 21:25:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58BD44028E
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 21:25:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0530B844C1; Mon, 25 Apr 2022 21:15:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 23:23:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e22dca48c9d8d677bea11c6dbee8e027681ee5b
X-Git-Newrev: 2e49ff10202e28a8dc942bfe11d7a623aca0bf6c
X-Patchwork-Hint: ignore
Message-Id: <20220425211513.0530B844C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyparsing: bump to version
 3.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e49ff10202e28a8dc942bfe11d7a623aca0bf6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package now requires flit and must use the flit-bootstrap setup
type for the host build since it is a dependency of
host-python-pypa-build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index 1e56e878a1..e7137d55c9 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  9d38774991175444e21a3dfa865876cc  pyparsing-3.0.7.tar.gz
-sha256  18ee9022775d270c55187733956460083db60b37d0d0fb357445f3094eed3eea  pyparsing-3.0.7.tar.gz
+md5  971252e99e1e02a4c27f001894e0422d  pyparsing-3.0.8.tar.gz
+sha256  7bf433498c016c4314268d95df76c81b842a4cb2b276fa3312cfb1e1d85f6954  pyparsing-3.0.8.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 2fb705bc7a..7e458042f5 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.0.7
+PYTHON_PYPARSING_VERSION = 3.0.8
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/d6/60/9bed18f43275b34198eb9720d4c1238c68b3755620d20df0afd89424d32b
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/31/df/789bd0556e65cf931a5b87b603fcf02f79ff04d5379f3063588faaf9c1e4
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
-PYTHON_PYPARSING_SETUP_TYPE = setuptools
+PYTHON_PYPARSING_SETUP_TYPE = flit
+HOST_PYTHON_PYPARSING_SETUP_TYPE = flit-bootstrap
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
