Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7CBC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9323418AC;
	Mon,  4 Dec 2023 20:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9323418AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e29UM8ssOz7X; Mon,  4 Dec 2023 20:19:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2D27418A8;
	Mon,  4 Dec 2023 20:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2D27418A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35FA61BF97A
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50F8460B25
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50F8460B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CfL9i592SgF4 for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1B3560FF1
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1B3560FF1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2CE4879B7; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 12:26:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66f94d372fce75240cceadeb1bdc738297cfb8fc
X-Git-Newrev: 618ad13422197e3ad18893bc034a11d4b4d0f6c6
X-Patchwork-Hint: ignore
Message-Id: <20231204201328.C2CE4879B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydal: bump to version
 20231114.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=618ad13422197e3ad18893bc034a11d4b4d0f6c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 8ed25084d1..9f2ab55508 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  47f0425745bcd1bb413aa9208cd06b3c  pydal-20230521.1.tar.gz
-sha256  10478a61e627c5b8cb7691f7f7ebf7210845485316493d37d740c297fb6d1845  pydal-20230521.1.tar.gz
+md5  b2072b7b000223890b56830ca1ab3616  pydal-20231114.3.tar.gz
+sha256  c42d16fca9e3bb6d399aefb2434c0e70862ee13c75437852f421920432ee5fb1  pydal-20231114.3.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 1cc7e90b11..245383f244 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20230521.1
+PYTHON_PYDAL_VERSION = 20231114.3
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/68/b4/15dc227f965cc0525ca7f432368706cc4087ad6d587a5a05b251d133023e
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/0b/3b/86302e165af07bc3d9225aea6ed8f52386270220e4aac1aad0101a48aac1
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
