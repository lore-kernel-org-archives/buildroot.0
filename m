Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1B9EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A652611BC;
	Sun, 18 Jun 2023 13:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A652611BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIEMygkjlczS; Sun, 18 Jun 2023 13:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDA5A61197;
	Sun, 18 Jun 2023 13:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDA5A61197
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21ED61BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBF27414C0
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBF27414C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YQN9DBca1CGL for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:15:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA8ED414A1
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA8ED414A1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6BC383D9A; Sun, 18 Jun 2023 13:15:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 15:13:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e15d69160dfa975022de4c9f05a1a99be852322
X-Git-Newrev: 3f1f0597e2f1db8c864ee7a54d95fb64209fcb97
X-Patchwork-Hint: ignore
Message-Id: <20230618131519.C6BC383D9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydal: bump to version
 20230521.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f1f0597e2f1db8c864ee7a54d95fb64209fcb97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index c55a17a545..8ed25084d1 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  eeaf44cdcdb6bd2040713c710a4a04be  pydal-20221110.1.tar.gz
-sha256  7c3e891c70f8d8918e36276f210a1959bb7badf3b276f47191986ffcf5b6a390  pydal-20221110.1.tar.gz
+md5  47f0425745bcd1bb413aa9208cd06b3c  pydal-20230521.1.tar.gz
+sha256  10478a61e627c5b8cb7691f7f7ebf7210845485316493d37d740c297fb6d1845  pydal-20230521.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index f55c7fc2c5..1cc7e90b11 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20221110.1
+PYTHON_PYDAL_VERSION = 20230521.1
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/73/83/b904c464b6ab060e12b3f406f1fab7deb97bcd9d2021d8c87325e6225c2d
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/68/b4/15dc227f965cc0525ca7f432368706cc4087ad6d587a5a05b251d133023e
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
