Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B474C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF67141842;
	Thu,  9 Nov 2023 21:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF67141842
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sqpu0wXES0W8; Thu,  9 Nov 2023 21:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70EA040354;
	Thu,  9 Nov 2023 21:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70EA040354
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 89B5C1BF312
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6B1960AC3
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6B1960AC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FwVho9BFtRCi for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:05:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09C4F6149A
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09C4F6149A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE3C386E92; Thu,  9 Nov 2023 21:05:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 21:58:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 014a66fcde68bd0b612b62ec722ccc93bdc0d7f9
X-Git-Newrev: ece72fffdce6eafc777235ea7b9d4b12dbdf61d9
X-Patchwork-Hint: ignore
Message-Id: <20231109210542.EE3C386E92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-munch: bump to version 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ece72fffdce6eafc777235ea7b9d4b12dbdf61d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-munch/python-munch.hash | 4 ++--
 package/python-munch/python-munch.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-munch/python-munch.hash b/package/python-munch/python-munch.hash
index 7e32282833..a895bc9185 100644
--- a/package/python-munch/python-munch.hash
+++ b/package/python-munch/python-munch.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/munch/json
-md5  ed84c3718416c8d4d03d0a6ef46e8e0c  munch-2.5.0.tar.gz
-sha256  2d735f6f24d4dba3417fa448cae40c6e896ec1fdab6cdb5e6510999758a4dbd2  munch-2.5.0.tar.gz
+md5  4e70cf760e3b81dcaa6050803c1dbd72  munch-4.0.0.tar.gz
+sha256  542cb151461263216a4e37c3fd9afc425feeaf38aaa3025cd2a981fadb422235  munch-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  57ca95c92059c8380625192462979bd32994aae3fcdf902ff6eb1e467eeb0469  LICENSE.txt
diff --git a/package/python-munch/python-munch.mk b/package/python-munch/python-munch.mk
index 85f6803f07..c2941aa0b5 100644
--- a/package/python-munch/python-munch.mk
+++ b/package/python-munch/python-munch.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MUNCH_VERSION = 2.5.0
+PYTHON_MUNCH_VERSION = 4.0.0
 PYTHON_MUNCH_SOURCE = munch-$(PYTHON_MUNCH_VERSION).tar.gz
-PYTHON_MUNCH_SITE = https://files.pythonhosted.org/packages/43/a1/ec48010724eedfe2add68eb7592a0d238590e14e08b95a4ffb3c7b2f0808
+PYTHON_MUNCH_SITE = https://files.pythonhosted.org/packages/e7/2b/45098135b5f9f13221820d90f9e0516e11a2a0f55012c13b081d202b782a
 PYTHON_MUNCH_SETUP_TYPE = setuptools
 PYTHON_MUNCH_LICENSE = MIT
 PYTHON_MUNCH_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
