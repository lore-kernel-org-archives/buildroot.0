Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B68C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA37401DF;
	Mon,  5 Dec 2022 11:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BA37401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6u4xzBmtGOg; Mon,  5 Dec 2022 11:38:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AC0B4018C;
	Mon,  5 Dec 2022 11:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AC0B4018C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AE3E1BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFFAC4055F
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFFAC4055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAI_KblwAHF6 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFBA240578
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFBA240578
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA63585B9E; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e7583258a51abc131cc455f1527b634b570a08c
X-Git-Newrev: 29c99ba046fa64db3fe990649745baf056e3ea7f
X-Patchwork-Hint: ignore
Message-Id: <20221205112602.AA63585B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jmespath: bump to version
 1.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=29c99ba046fa64db3fe990649745baf056e3ea7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jmespath/python-jmespath.hash | 5 +++--
 package/python-jmespath/python-jmespath.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-jmespath/python-jmespath.hash b/package/python-jmespath/python-jmespath.hash
index a1c64a121e..03f64f3b74 100644
--- a/package/python-jmespath/python-jmespath.hash
+++ b/package/python-jmespath/python-jmespath.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/jmespath/json
-sha256  a490e280edd1f57d6de88636992d05b71e97d69a26a19f058ecf7d304474bf5e  jmespath-1.0.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/jmespath/json
+md5  2dd28beb22d698f58fe2281bfe5fe3a3  jmespath-1.0.1.tar.gz
+sha256  90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe  jmespath-1.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  66b313cce80ed0623fc7db3f24863a0c80fd83eb341a46b57864158ae74faa56  LICENSE.txt
diff --git a/package/python-jmespath/python-jmespath.mk b/package/python-jmespath/python-jmespath.mk
index 48b19e8494..a94a13a229 100644
--- a/package/python-jmespath/python-jmespath.mk
+++ b/package/python-jmespath/python-jmespath.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JMESPATH_VERSION = 1.0.0
+PYTHON_JMESPATH_VERSION = 1.0.1
 PYTHON_JMESPATH_SOURCE = jmespath-$(PYTHON_JMESPATH_VERSION).tar.gz
-PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/06/7e/44686b986ef9ca6069db224651baaa8300b93af2a085a5b135997bf659b3
+PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/00/2a/e867e8531cf3e36b41201936b7fa7ba7b5702dbef42922193f05c8976cd6
 PYTHON_JMESPATH_SETUP_TYPE = setuptools
 PYTHON_JMESPATH_LICENSE = MIT
 PYTHON_JMESPATH_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
