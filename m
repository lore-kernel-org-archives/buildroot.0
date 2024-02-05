Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820C0C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3303681EF9;
	Mon,  5 Feb 2024 22:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3303681EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKeaboHWt2C6; Mon,  5 Feb 2024 22:49:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EC0581EDB;
	Mon,  5 Feb 2024 22:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EC0581EDB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27D331BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15E6560E29
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15E6560E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqBrwvUz7G_J for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:48:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A82960AF0
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A82960AF0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 289B386EAC; Mon,  5 Feb 2024 22:48:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 23:48:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: beef64d5ea34577f7539d4323d05a0c59bd612c9
X-Git-Newrev: 70601ca41c2bb67d056a4c6e5710647385acda29
X-Patchwork-Hint: ignore
Message-Id: <20240205224845.289B386EAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-idna: bump to version 3.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=70601ca41c2bb67d056a4c6e5710647385acda29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file hash changed due to year update:
https://github.com/kjd/idna/commit/89cd0612146a50a720e5aef8f040ca8ed4c6274b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-idna/python-idna.hash | 6 +++---
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 3a758a6eac..5e6ac716a2 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  13ea24e076212b6baae1135a116d1e0e  idna-3.4.tar.gz
-sha256  814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530b5526063d02cb4  idna-3.4.tar.gz
+md5  70f4beef4feb196ac64b75a93271f53c  idna-3.6.tar.gz
+sha256  9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca  idna-3.6.tar.gz
 # Locally computed sha256 checksums
-sha256  a2d6e4d940bd24dbe7b9645cde19a9792cc51db7ae0d5acd301ac860caa3e836  LICENSE.md
+sha256  cb2faf0ca18c6d387ec7cb66f321939fba6e67e9dac09d31477cb9d8d3fe6899  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 3976cb1518..eb92432bd3 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.4
+PYTHON_IDNA_VERSION = 3.6
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/8b/e1/43beb3d38dba6cb420cefa297822eac205a277ab43e5ba5d5c46faf96438
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/bf/3f/ea4b9117521a1e9c50344b909be7886dd00a519552724809bb1f486986c2
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
