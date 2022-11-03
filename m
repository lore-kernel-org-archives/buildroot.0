Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E131C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AF366104E;
	Thu,  3 Nov 2022 20:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AF366104E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2R2lfpOZSGB; Thu,  3 Nov 2022 20:57:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28C9161045;
	Thu,  3 Nov 2022 20:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28C9161045
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19C041BF96B
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81FED40BC0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81FED40BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skwlZXOA0OXV for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FA0540BCF
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FA0540BCF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9099387BCA; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 474148dc7a9ee5d30ac29d95643667500360220b
X-Git-Newrev: 66911c3dd28a134f550ca03efe19c19daf229dd1
X-Patchwork-Hint: ignore
Message-Id: <20221103205510.9099387BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-bluezero: bump
 to version 0.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=66911c3dd28a134f550ca03efe19c19daf229dd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bluezero/python-bluezero.hash | 4 ++--
 package/python-bluezero/python-bluezero.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bluezero/python-bluezero.hash b/package/python-bluezero/python-bluezero.hash
index 59e8c5af5b..6bedf62b27 100644
--- a/package/python-bluezero/python-bluezero.hash
+++ b/package/python-bluezero/python-bluezero.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bluezero/json
-md5  b26e6425d8adc4613b7cdf1d131f8c0b  bluezero-0.6.0.tar.gz
-sha256  d94f0672b1de3ff0040801538143fe9a42c501d8db79bcd183c9e051b8da83bc  bluezero-0.6.0.tar.gz
+md5  efa07525f1bf6db9af66eb7d9775cdb0  bluezero-0.7.1.tar.gz
+sha256  f146feb65ee9f6fd9f3638ff0a44df9fd6efb48cf66a39ce51a62a7d38ab5206  bluezero-0.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  59319e80b4caa94ace4817c9f84aa16abc9d4d2b5f7866251b5fda92e87ccdef  LICENSE
diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
index 7e244fe3f0..34efb6155c 100644
--- a/package/python-bluezero/python-bluezero.mk
+++ b/package/python-bluezero/python-bluezero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLUEZERO_VERSION = 0.6.0
+PYTHON_BLUEZERO_VERSION = 0.7.1
 PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
-PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/be/15/4a806580ffd359a03184776f37cf201298918f302b414b8a3e594d1be65c
+PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/9a/66/d4a92869ed2afd9483a65aff200b2ba0ca4365429bc9a836c5803ab876a5
 PYTHON_BLUEZERO_SETUP_TYPE = setuptools
 PYTHON_BLUEZERO_LICENSE = MIT
 PYTHON_BLUEZERO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
