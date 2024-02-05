Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0619FC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A07BD41523;
	Mon,  5 Feb 2024 11:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A07BD41523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ake8_1NEYwTI; Mon,  5 Feb 2024 11:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7375141749;
	Mon,  5 Feb 2024 11:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7375141749
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8AE441BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EA874188F
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EA874188F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Lvazk4YPVWR for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80A254189A
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80A254189A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E09D86B6D; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:05:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a114e72a4716d3a19480317894d5ac46e318a5f6
X-Git-Newrev: 585b0bab9e263f57b0aef60502eb34b73214e8c8
X-Patchwork-Hint: ignore
Message-Id: <20240205110640.6E09D86B6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-referencing: bump to
 version 0.32.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=585b0bab9e263f57b0aef60502eb34b73214e8c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-referencing/python-referencing.hash | 4 ++--
 package/python-referencing/python-referencing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-referencing/python-referencing.hash b/package/python-referencing/python-referencing.hash
index d4f3dce5a4..2880a47477 100644
--- a/package/python-referencing/python-referencing.hash
+++ b/package/python-referencing/python-referencing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/referencing/json
-md5  617d973b9ce86b6f74b2216c6f3af5c9  referencing-0.30.2.tar.gz
-sha256  794ad8003c65938edcdbc027f1933215e0d0ccc0291e3ce20a4d87432b59efc0  referencing-0.30.2.tar.gz
+md5  d1a0a4ae03ebba4b86b22bfb825f150b  referencing-0.32.1.tar.gz
+sha256  3c57da0513e9563eb7e203ebe9bb3a1b509b042016433bd1e45a2853466c3dd3  referencing-0.32.1.tar.gz
 # Locally computed sha256 checksums
 sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index 4d11c99deb..27d1452e91 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REFERENCING_VERSION = 0.30.2
+PYTHON_REFERENCING_VERSION = 0.32.1
 PYTHON_REFERENCING_SOURCE = referencing-$(PYTHON_REFERENCING_VERSION).tar.gz
-PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/e1/43/d3f6cf3e1ec9003520c5fb31dc363ee488c517f09402abd2a1c90df63bbb
+PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/81/ce/910573eca7b1a1c6358b0dc0774ce1eeb81f4c98d4ee371f1c85f22040a1
 PYTHON_REFERENCING_SETUP_TYPE = pep517
 PYTHON_REFERENCING_LICENSE = MIT
 PYTHON_REFERENCING_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
