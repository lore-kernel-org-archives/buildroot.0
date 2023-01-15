Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9C2C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7A0A60A9C;
	Tue, 21 Feb 2023 00:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7A0A60A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pw4f9yykwy7T; Tue, 21 Feb 2023 00:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1462660A8A;
	Tue, 21 Feb 2023 00:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1462660A8A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C92FF1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC4386FB95
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC4386FB95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OxDoVfQqN1Ni for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D27F56FB8C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D27F56FB8C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0F458648F; Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:16:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c60f09bf11cd465caa51c7f099508c44d6359a01
X-Git-Newrev: 1e85e54729ece9fd7285c2e4d3f7ea537aabe0a3
X-Patchwork-Hint: ignore
Message-Id: <20230220205235.D0F458648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-termcolor: bump
 to version 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e85e54729ece9fd7285c2e4d3f7ea537aabe0a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-termcolor/python-termcolor.hash | 4 ++--
 package/python-termcolor/python-termcolor.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-termcolor/python-termcolor.hash b/package/python-termcolor/python-termcolor.hash
index 73fb9129ed..9be0ad00c8 100644
--- a/package/python-termcolor/python-termcolor.hash
+++ b/package/python-termcolor/python-termcolor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/termcolor/json
-md5  f7f59efd147dd1ec2a25e667616e8a52  termcolor-2.1.1.tar.gz
-sha256  67cee2009adc6449c650f6bcf3bdeed00c8ba53a8cda5362733c53e0a39fb70b  termcolor-2.1.1.tar.gz
+md5  ba0af4ee713cd0030c2d436091af4241  termcolor-2.2.0.tar.gz
+sha256  dfc8ac3f350788f23b2947b3e6cfa5a53b630b612e6cd8965a015a776020b99a  termcolor-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e79b6bd82962c1330caaa7c42278567b08667777673f8e2371a624d5715d4c0e  COPYING.txt
diff --git a/package/python-termcolor/python-termcolor.mk b/package/python-termcolor/python-termcolor.mk
index d7511d692f..5cbedfb396 100644
--- a/package/python-termcolor/python-termcolor.mk
+++ b/package/python-termcolor/python-termcolor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TERMCOLOR_VERSION = 2.1.1
+PYTHON_TERMCOLOR_VERSION = 2.2.0
 PYTHON_TERMCOLOR_SOURCE = termcolor-$(PYTHON_TERMCOLOR_VERSION).tar.gz
-PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/19/da/ff1f0906818a5bd2e69e773d88801ca3c9e92d0d7caa99db1665658819ea
+PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/e5/4e/b2a54a21092ad2d5d70b0140e4080811bee06a39cc8481651579fe865c89
 PYTHON_TERMCOLOR_SETUP_TYPE = pep517
 PYTHON_TERMCOLOR_LICENSE = MIT
 PYTHON_TERMCOLOR_LICENSE_FILES = COPYING.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
