Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA46C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5D6D415A9;
	Mon,  5 Dec 2022 11:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5D6D415A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5bIs4ROj-NF2; Mon,  5 Dec 2022 11:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3D10410C8;
	Mon,  5 Dec 2022 11:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3D10410C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 236721BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F1C441606
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F1C441606
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7cG5VU6rkIn for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64BAC415E6
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64BAC415E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61AA285BA3; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a7801f1a1feaa8b84f8f56699a001c1d71e3ffd
X-Git-Newrev: 6293c033a906d279235a98cc2c49bea3447f5b67
X-Patchwork-Hint: ignore
Message-Id: <20221205112602.61AA285BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ifaddr: bump to version
 0.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6293c033a906d279235a98cc2c49bea3447f5b67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ifaddr/python-ifaddr.hash | 4 ++--
 package/python-ifaddr/python-ifaddr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ifaddr/python-ifaddr.hash b/package/python-ifaddr/python-ifaddr.hash
index 57b155caa5..e3c2b13b69 100644
--- a/package/python-ifaddr/python-ifaddr.hash
+++ b/package/python-ifaddr/python-ifaddr.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ifaddr/json
-md5  97c4eb7505643b5f1fe17733cb42abd9  ifaddr-0.1.7.tar.gz
-sha256  1f9e8a6ca6f16db5a37d3356f07b6e52344f6f9f7e806d618537731669eb1a94  ifaddr-0.1.7.tar.gz
+md5  b1cac02b5dc354d68dd6d853bc9565a7  ifaddr-0.2.0.tar.gz
+sha256  cc0cbfcaabf765d44595825fb96a99bb12c79716b73b44330ea38ee2b0c4aed4  ifaddr-0.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8700856576ae2bc80c63bc970250510d9213fb02fed006d5f22742c9ddde24d7  LICENSE.txt
diff --git a/package/python-ifaddr/python-ifaddr.mk b/package/python-ifaddr/python-ifaddr.mk
index f1154d9de8..9b7d50d825 100644
--- a/package/python-ifaddr/python-ifaddr.mk
+++ b/package/python-ifaddr/python-ifaddr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IFADDR_VERSION = 0.1.7
+PYTHON_IFADDR_VERSION = 0.2.0
 PYTHON_IFADDR_SOURCE = ifaddr-$(PYTHON_IFADDR_VERSION).tar.gz
-PYTHON_IFADDR_SITE = https://files.pythonhosted.org/packages/3d/fc/4ce147e3997cd0ea470ad27112087545cf83bf85015ddb3054673cb471bb
+PYTHON_IFADDR_SITE = https://files.pythonhosted.org/packages/e8/ac/fb4c578f4a3256561548cd825646680edcadb9440f3f68add95ade1eb791
 PYTHON_IFADDR_SETUP_TYPE = setuptools
 PYTHON_IFADDR_LICENSE = MIT
 PYTHON_IFADDR_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
