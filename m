Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AD1C6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 22:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 552918407A;
	Wed, 22 Mar 2023 22:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 552918407A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WxkbZG4wAtES; Wed, 22 Mar 2023 22:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7339F8407B;
	Wed, 22 Mar 2023 22:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7339F8407B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55BAF1BF909
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2669C41C84
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2669C41C84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRjJ8rQCZQMG for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 22:44:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 984A141C82
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 984A141C82
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96BF187581; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 23:42:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c148c93c9cc69926253ce13f7bfda2a98b4be38
X-Git-Newrev: e4f5e974cafe915e5297a812c828ad47d619783c
X-Patchwork-Hint: ignore
Message-Id: <20230322224400.96BF187581@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bleak: bump to version
 0.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4f5e974cafe915e5297a812c828ad47d619783c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index 001ef65b65..2cd038cb68 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  d038483ec145c3d32c1ef03e04c42621  bleak-0.19.5.tar.gz
-sha256  87845a96453c58c19031c735444a7b3156800534bcd3f23ba74e119e9ae3cd88  bleak-0.19.5.tar.gz
+md5  6f9881cc85648683927ab0b9c58a1a52  bleak-0.20.0.tar.gz
+sha256  7f6fe69454ad5d4c0ab05ae4a9aa1aabd6926d7128eab2fac4ef8a58a72999ee  bleak-0.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index 95ac1d1766..7d3dc2831f 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 0.19.5
+PYTHON_BLEAK_VERSION = 0.20.0
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/e6/b4/e63829826a157d180831a1c5d3720e75d613c1290cb239510d148b906836
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/aa/86/5084561ed4f31aec0322bef015db949a9f2bf0b4f6bd72b16479cf03f459
 PYTHON_BLEAK_SETUP_TYPE = setuptools
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
