Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4E6C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:58:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C7361216
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58C7361216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32D3E84963;
	Sun,  3 Oct 2021 19:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V07MpYha-okt; Sun,  3 Oct 2021 19:58:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63AF78496B;
	Sun,  3 Oct 2021 19:58:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9E31BF45A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A174B407E8
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q_ki0aA-CF_D for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D055D40805
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 31FDD87A5E; Sun,  3 Oct 2021 19:53:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 21:51:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98bac18835e14188a7e96877cfa13194e78bf3ae
X-Git-Newrev: 1ed89ba44e6cd6a03a3cb97cf299da69c42d9107
X-Patchwork-Hint: ignore
Message-Id: <20211003195309.31FDD87A5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ptyprocess: bump to version
 0.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ed89ba44e6cd6a03a3cb97cf299da69c42d9107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-ptyprocess/python-ptyprocess.hash | 6 +++---
 package/python-ptyprocess/python-ptyprocess.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ptyprocess/python-ptyprocess.hash b/package/python-ptyprocess/python-ptyprocess.hash
index 3af431a756..bbd24b33ef 100644
--- a/package/python-ptyprocess/python-ptyprocess.hash
+++ b/package/python-ptyprocess/python-ptyprocess.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ptyprocess/json
-md5	37402d69f3b50913d4d483587bffad8f  ptyprocess-0.6.0.tar.gz
-sha256	923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0  ptyprocess-0.6.0.tar.gz
+md5  9da200c397cb1752209a6b718b6cfc68  ptyprocess-0.7.0.tar.gz
+sha256  5c5d0a3b48ceee0b48485e0c26037c0acd7d29765ca3fbb5cb3831d347423220  ptyprocess-0.7.0.tar.gz
 # Locally computed sha256 checksums
-sha256	c822d385b1a73329846241799becf18690b5d44764c1bed69300b536a405030a  LICENSE
+sha256  c822d385b1a73329846241799becf18690b5d44764c1bed69300b536a405030a  LICENSE
diff --git a/package/python-ptyprocess/python-ptyprocess.mk b/package/python-ptyprocess/python-ptyprocess.mk
index 45102e9aa7..d077fbb779 100644
--- a/package/python-ptyprocess/python-ptyprocess.mk
+++ b/package/python-ptyprocess/python-ptyprocess.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PTYPROCESS_VERSION = 0.6.0
-PYTHON_PTYPROCESS_SITE = https://files.pythonhosted.org/packages/7d/2d/e4b8733cf79b7309d84c9081a4ab558c89d8c89da5961bf4ddb050ca1ce0
+PYTHON_PTYPROCESS_VERSION = 0.7.0
+PYTHON_PTYPROCESS_SITE = https://files.pythonhosted.org/packages/20/e5/16ff212c1e452235a90aeb09066144d0c5a6a8c0834397e03f5224495c4e
 PYTHON_PTYPROCESS_SOURCE = ptyprocess-$(PYTHON_PTYPROCESS_VERSION).tar.gz
 PYTHON_PTYPROCESS_LICENSE = ISC
 PYTHON_PTYPROCESS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
