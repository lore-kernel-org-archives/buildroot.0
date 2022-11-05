Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737AEC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B81481BC6;
	Mon,  5 Dec 2022 11:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B81481BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TZ_FQeVWUNkp; Mon,  5 Dec 2022 11:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FE4781DFA;
	Mon,  5 Dec 2022 11:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FE4781DFA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02A801BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71F1A41681
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71F1A41681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQ14Ao_XEPHf for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BC4B4167B
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BC4B4167B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85F4585BBE; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:08:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 133a37d810a66f22e793efe2654645c743902ed0
X-Git-Newrev: 6177018855a0794903e619b1e6d84617da07772f
X-Patchwork-Hint: ignore
Message-Id: <20221205112607.85F4585BBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zlmdb: bump to version
 22.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6177018855a0794903e619b1e6d84617da07772f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-zlmdb/python-zlmdb.hash | 4 ++--
 package/python-zlmdb/python-zlmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zlmdb/python-zlmdb.hash b/package/python-zlmdb/python-zlmdb.hash
index d98dc7d12a..1ae5d72efa 100644
--- a/package/python-zlmdb/python-zlmdb.hash
+++ b/package/python-zlmdb/python-zlmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zlmdb/json
-md5  d730a394b74108933a65c9fbe76aba36  zlmdb-22.3.1.tar.gz
-sha256  0d416a47b1ee627186af8e5c99e5246f6b277df44ba5c6bb67e947eabf948e5a  zlmdb-22.3.1.tar.gz
+md5  1e217f3228cb4c2303f06461b79e593e  zlmdb-22.6.1.tar.gz
+sha256  aff353121c2eed3c18e53c82358c41932a21bf882995ee3a79c6eb1ae4c95397  zlmdb-22.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8a139bf325dcca11e0e476ce537bf791a6cfbeed8899a9b6ddc55238e180d230  LICENSE
diff --git a/package/python-zlmdb/python-zlmdb.mk b/package/python-zlmdb/python-zlmdb.mk
index a040622d9d..d20ac9e016 100644
--- a/package/python-zlmdb/python-zlmdb.mk
+++ b/package/python-zlmdb/python-zlmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZLMDB_VERSION = 22.3.1
+PYTHON_ZLMDB_VERSION = 22.6.1
 PYTHON_ZLMDB_SOURCE = zlmdb-$(PYTHON_ZLMDB_VERSION).tar.gz
-PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/71/87/bb3cebd5312e670e33551317c7fc5e4b6a4a9af39075a71cd541b32cc0bf
+PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/97/15/992e61a18cb64b573814c9d92676b22d522f2cc2ea79ff78b834bd392b80
 PYTHON_ZLMDB_SETUP_TYPE = setuptools
 PYTHON_ZLMDB_LICENSE = MIT
 PYTHON_ZLMDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
