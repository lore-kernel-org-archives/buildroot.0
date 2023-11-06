Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD36FC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99361420A9;
	Mon,  6 Nov 2023 22:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99361420A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSSmnXV6qVFl; Mon,  6 Nov 2023 22:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C567B420AF;
	Mon,  6 Nov 2023 22:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C567B420AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 847971BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64D464168B
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64D464168B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yD5qOMfM29h7 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26CF2415BD
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26CF2415BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1529F86B77; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:13:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34a7ac32b36d30b088151d36eb5b450da7a4e972
X-Git-Newrev: d7a908f7305c51069d4ffb7808efc3fb4b3853d0
X-Patchwork-Hint: ignore
Message-Id: <20231106222017.1529F86B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dataproperty: bump to
 version 1.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7a908f7305c51069d4ffb7808efc3fb4b3853d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dataproperty/python-dataproperty.hash | 4 ++--
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index 3edec5cc8c..ee5644a7ff 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dataproperty/json
-md5  8c8864a1dc456d25456b5c4de99a3fb6  DataProperty-0.55.0.tar.gz
-sha256  73ccf10f8b123968210438a1a1aa859ea6d5a16b4e1f4d307da7a81b838e79fa  DataProperty-0.55.0.tar.gz
+md5  aca50cd5f543b7831d8a48ab1c02a152  DataProperty-1.0.1.tar.gz
+sha256  723e5729fa6e885e127a771a983ee1e0e34bb141aca4ffe1f0bfa7cde34650a4  DataProperty-1.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 0feef55310..6cac4f27e5 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.55.0
+PYTHON_DATAPROPERTY_VERSION = 1.0.1
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/85/6e/627eba99858c486c5b82468e4aaf60808c2e35d1bb768ee5da712b6fe9be
+PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/48/e2/31ffb67d2a9ab4ff70b106e08ad01a3e7696f8d409457042d1eb18244f82
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
