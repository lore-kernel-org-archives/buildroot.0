Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B53C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C67FB610AB;
	Thu,  3 Nov 2022 21:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C67FB610AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5bXy5aROvvB; Thu,  3 Nov 2022 21:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D48FA6109C;
	Thu,  3 Nov 2022 21:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D48FA6109C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3A491BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53E6540C01
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53E6540C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqoWHOBYNbsJ for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42F9240C0A
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42F9240C0A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39CA087BD1; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f8bb4a619ac723d6a35e2b3ebe9f6e1d07a5d0f6
X-Git-Newrev: c4525b49cb32651c5029847ed02e72b5c075ef4d
X-Patchwork-Hint: ignore
Message-Id: <20221103205513.39CA087BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pudb: bump to
 version 2022.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4525b49cb32651c5029847ed02e72b5c075ef4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index fc19f589d9..d9943a3601 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  100b955e103b72279604420bbdcd07a5  pudb-2021.1.tar.gz
-sha256  309ee82b45a0ffca0bc4c7f521fd3e357589c764f339bdf9dcabb7ad40692d6e  pudb-2021.1.tar.gz
+md5  c2b4275b76068f18d630f7bae889345b  pudb-2022.1.2.tar.gz
+sha256  6b83ab805bddb53710109690a2237e98bf83c0b3a00033c517cdf5f6a8fa470d  pudb-2022.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index 31df3147d0..7df38f0f02 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2021.1
+PYTHON_PUDB_VERSION = 2022.1.2
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/c7/69/813e93519fc28744457ff68fa2eaac3b4ea30dda1e6994e969fe9d3008d9
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/8b/ef/6dea7c63fdddd7753e2a2930e59799ef32247f2499c0d9bcd233439e7483
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
