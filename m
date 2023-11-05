Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14CEC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 551E3409D0;
	Sun,  5 Nov 2023 21:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 551E3409D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iAT9bnCG7yQ5; Sun,  5 Nov 2023 21:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A3744097D;
	Sun,  5 Nov 2023 21:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A3744097D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD7C61BF869
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06B7D81F50
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B7D81F50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBWW90JNj3cz for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF00C81F3D
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF00C81F3D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD661868AA; Sun,  5 Nov 2023 21:11:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 22:00:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4be2da2cef371faff39ceb7fa28b948945016fc9
X-Git-Newrev: b5fef7a8389d608b3561c85a317ee50a3e51dc51
X-Patchwork-Hint: ignore
Message-Id: <20231105211104.DD661868AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiofiles: bump to version
 23.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5fef7a8389d608b3561c85a317ee50a3e51dc51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-aiofiles/python-aiofiles.hash | 4 ++--
 package/python-aiofiles/python-aiofiles.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
index e7799c7ff7..3dc9281de7 100644
--- a/package/python-aiofiles/python-aiofiles.hash
+++ b/package/python-aiofiles/python-aiofiles.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiofiles/json
-md5  d648a31366030470c97401741747065f  aiofiles-23.1.0.tar.gz
-sha256  edd247df9a19e0db16534d4baaf536d6609a43e1de5401d7a4c1c148753a1635  aiofiles-23.1.0.tar.gz
+md5  ab5dfab3180f56a21b46e1e90b16c6e6  aiofiles-23.2.1.tar.gz
+sha256  84ec2218d8419404abcb9f0c02df3f34c6e0a68ed41072acfb1cef5cbc29051a  aiofiles-23.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index 96bd636a4a..582f7908cd 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOFILES_VERSION = 23.1.0
+PYTHON_AIOFILES_VERSION = 23.2.1
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
-PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/40/a0/07be94aecba162ed5147359f9883e82afd2ac13aed33678a008fc8c36f8b
+PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/af/41/cfed10bc64d774f497a86e5ede9248e1d062db675504b41c320954d99641
 PYTHON_AIOFILES_SETUP_TYPE = setuptools
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
