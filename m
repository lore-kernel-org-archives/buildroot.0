Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B00DC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 186654209C;
	Mon,  6 Nov 2023 22:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 186654209C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ZvlaCRebu5Q; Mon,  6 Nov 2023 22:24:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DBBF42142;
	Mon,  6 Nov 2023 22:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DBBF42142
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48F131BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89003415BD
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89003415BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jWdsBWyfQseM for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B91B041605
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B91B041605
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B17F086B77; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:15:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bd4d7ed63b31d5d90c5ab2d5ddec3da96623604
X-Git-Newrev: fc7d6021d1474dad8d7e1d1bb643fd41ce865f01
X-Patchwork-Hint: ignore
Message-Id: <20231106222017.B17F086B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gitdb2: bump to version
 4.0.11
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fc7d6021d1474dad8d7e1d1bb643fd41ce865f01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gitdb2/python-gitdb2.hash | 4 ++--
 package/python-gitdb2/python-gitdb2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gitdb2/python-gitdb2.hash b/package/python-gitdb2/python-gitdb2.hash
index 7bc187cf53..c70c1aade9 100644
--- a/package/python-gitdb2/python-gitdb2.hash
+++ b/package/python-gitdb2/python-gitdb2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gitdb/json
-md5  3f52187435ab0b6e64a15782ffaf29ab  gitdb-4.0.7.tar.gz
-sha256  96bf5c08b157a666fec41129e6d327235284cca4c81e92109260f353ba138005  gitdb-4.0.7.tar.gz
+md5  6071755f2899cd4882b83a070b045bac  gitdb-4.0.11.tar.gz
+sha256  bf5421126136d6d0af55bc1e7c1af1c397a34f5b7bd79e776cd3e89785c2b04b  gitdb-4.0.11.tar.gz
 # Locally computed sha256 checksums
 sha256  efd29f596a08e8857e68e7694a50bcda72839792da7c3f041bcbff5f18009239  LICENSE
diff --git a/package/python-gitdb2/python-gitdb2.mk b/package/python-gitdb2/python-gitdb2.mk
index 91a17e24a7..424f37f8f4 100644
--- a/package/python-gitdb2/python-gitdb2.mk
+++ b/package/python-gitdb2/python-gitdb2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GITDB2_VERSION = 4.0.7
+PYTHON_GITDB2_VERSION = 4.0.11
 PYTHON_GITDB2_SOURCE = gitdb-$(PYTHON_GITDB2_VERSION).tar.gz
-PYTHON_GITDB2_SITE = https://files.pythonhosted.org/packages/34/fe/9265459642ab6e29afe734479f94385870e8702e7f892270ed6e52dd15bf
+PYTHON_GITDB2_SITE = https://files.pythonhosted.org/packages/19/0d/bbb5b5ee188dec84647a4664f3e11b06ade2bde568dbd489d9d64adef8ed
 PYTHON_GITDB2_SETUP_TYPE = setuptools
 PYTHON_GITDB2_LICENSE = BSD-3-Clause
 PYTHON_GITDB2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
