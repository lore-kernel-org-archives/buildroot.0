Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2834C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:01:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFC7060F39
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFC7060F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9955840305;
	Sun, 26 Sep 2021 21:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yVvT33mBn3aZ; Sun, 26 Sep 2021 21:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 050FC40300;
	Sun, 26 Sep 2021 21:01:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EF811BF3DB
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2124819F3
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PqDZhkRPuXCe for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CF4C81A18
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 89A7D8D2AF; Sun, 26 Sep 2021 20:57:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 22:15:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1c790cec7407da402fef89cd7de2e0a2f7e0bab
X-Git-Newrev: 659ea506090b2f8149075e5ac5e61f529b34966a
X-Patchwork-Hint: ignore
Message-Id: <20210926205756.89A7D8D2AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiosignal: bump to version
 1.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=659ea506090b2f8149075e5ac5e61f529b34966a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-aiosignal/python-aiosignal.hash | 6 +++---
 package/python-aiosignal/python-aiosignal.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiosignal/python-aiosignal.hash b/package/python-aiosignal/python-aiosignal.hash
index 17c69c8144..3fdd459502 100644
--- a/package/python-aiosignal/python-aiosignal.hash
+++ b/package/python-aiosignal/python-aiosignal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiosignal/json
-md5	0831ab9e46799842ed84529dbaa86196  aiosignal-1.0.0.tar.gz
-sha256	7cd33cbe05bc2d83e77f80d688b4717e424d15eecf6d65384e173b2873e62f13  aiosignal-1.0.0.tar.gz
+md5  f3edf1b700b4fee6ea6ed375c3f6555c  aiosignal-1.1.2.tar.gz
+sha256  15605698a0401075a03d36cea979e3c0e6cf8467a9e3b9047040514dd9e6f43b  aiosignal-1.1.2.tar.gz
 # Locally computed sha256 checksums
-sha256	6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
+sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
diff --git a/package/python-aiosignal/python-aiosignal.mk b/package/python-aiosignal/python-aiosignal.mk
index 14b4264620..ea11d97060 100644
--- a/package/python-aiosignal/python-aiosignal.mk
+++ b/package/python-aiosignal/python-aiosignal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOSIGNAL_VERSION = 1.0.0
+PYTHON_AIOSIGNAL_VERSION = 1.1.2
 PYTHON_AIOSIGNAL_SOURCE = aiosignal-$(PYTHON_AIOSIGNAL_VERSION).tar.gz
-PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/ca/b7/5ae01ed039ea51cc8280d87b8a1269ba2f1343d7466c1e50c618558352e5
+PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/ac/f7/c3df3b7eac6ea96175e0817b272b43b398d5ba589be09a50d1b758d5b852
 PYTHON_AIOSIGNAL_SETUP_TYPE = setuptools
 PYTHON_AIOSIGNAL_LICENSE = Apache-2.0
 PYTHON_AIOSIGNAL_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
