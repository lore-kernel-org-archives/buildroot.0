Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5219BC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:17:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B47260EFF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B47260EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE1444063A;
	Tue,  3 Aug 2021 22:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4VGQuL5aEWj; Tue,  3 Aug 2021 22:17:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8F9B4060C;
	Tue,  3 Aug 2021 22:17:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02F801BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CAA3608F2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aKKcvOpXod-U for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 561B960864
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 977EE87C25; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 23:36:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 705b5b3cd0e38a37672eac086ca555da2ec60baf
X-Git-Newrev: 7c5fcad353d6d2964d4664be31cc442ac800df3c
X-Patchwork-Hint: ignore
Message-Id: <20210803210959.977EE87C25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-typing: bump to
 version 3.10.0.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7c5fcad353d6d2964d4664be31cc442ac800df3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-typing/python-typing.hash | 4 ++--
 package/python-typing/python-typing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing/python-typing.hash b/package/python-typing/python-typing.hash
index 438ecb0727..f587eb7bfa 100644
--- a/package/python-typing/python-typing.hash
+++ b/package/python-typing/python-typing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing/json
-md5  276296e7b6b617d4f8b5e8874f240bd4  typing-3.7.4.3.tar.gz
-sha256  1187fb9c82fd670d10aa07bbb6cfcfe4bdda42d6fab8d5134f04e8c4d0b71cc9  typing-3.7.4.3.tar.gz
+md5  d6dd450cfe0c8c6547eef09a0491775d  typing-3.10.0.0.tar.gz
+sha256  13b4ad211f54ddbf93e5901a9967b1e07720c1d1b78d596ac6a439641aa1b130  typing-3.10.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
diff --git a/package/python-typing/python-typing.mk b/package/python-typing/python-typing.mk
index efb2196286..dd1d8f29b5 100644
--- a/package/python-typing/python-typing.mk
+++ b/package/python-typing/python-typing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_VERSION = 3.7.4.3
+PYTHON_TYPING_VERSION = 3.10.0.0
 PYTHON_TYPING_SOURCE = typing-$(PYTHON_TYPING_VERSION).tar.gz
-PYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/05/d9/6eebe19d46bd05360c9a9aae822e67a80f9242aabbfc58b641b957546607
+PYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/b0/1b/835d4431805939d2996f8772aca1d2313a57e8860fec0e48e8e7dfe3a477
 PYTHON_TYPING_SETUP_TYPE = setuptools
 PYTHON_TYPING_LICENSE = Python-2.0, others
 PYTHON_TYPING_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
