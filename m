Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AFDC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11E448338B;
	Wed,  7 Feb 2024 16:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4lod7hVSG8v; Wed,  7 Feb 2024 16:03:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E77833DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24E77833DB;
	Wed,  7 Feb 2024 16:03:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F8851BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7886C40354
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jtJUXEEputme for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64C9F4019D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64C9F4019D
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:03:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B0CC87605; Wed,  7 Feb 2024 16:03:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:01:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6008f2b1b901be1374ac201b5e560cca61b4b61e
X-Git-Newrev: 33ac66e792b559bcbf31d69c58750a97b188933c
X-Patchwork-Hint: ignore
Message-Id: <20240207160356.3B0CC87605@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setproctitle: bump to
 version 1.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=33ac66e792b559bcbf31d69c58750a97b188933c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-setproctitle/python-setproctitle.hash | 6 +++---
 package/python-setproctitle/python-setproctitle.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
index ac8fed986a..f60595bf6c 100644
--- a/package/python-setproctitle/python-setproctitle.hash
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setproctitle/json
-md5  fa9771540422a59a8dee1331ad6fd3a9  setproctitle-1.3.2.tar.gz
-sha256  b9fb97907c830d260fa0658ed58afd48a86b2b88aac521135c352ff7fd3477fd  setproctitle-1.3.2.tar.gz
-# Locally computed
+md5  1c042d6717212de791c4f9b63e7b544e  setproctitle-1.3.3.tar.gz
+sha256  c913e151e7ea01567837ff037a23ca8740192880198b7fbb90b16d181607caae  setproctitle-1.3.3.tar.gz
+# Locally computed sha256 checksums
 sha256  4ace14d0836da75079088cfc5cef6f2ddc8ce16f600609b36ee1bf10f8101f61  COPYRIGHT
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index 7055920c08..ca2d0ffbc6 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETPROCTITLE_VERSION = 1.3.2
+PYTHON_SETPROCTITLE_VERSION = 1.3.3
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
-PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/b5/47/ac709629ddb9779fee29b7d10ae9580f60a4b37e49bce72360ddf9a79cdc
+PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/ff/e1/b16b16a1aa12174349d15b73fd4b87e641a8ae3fb1163e80938dbbf6ae98
 PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
 PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
 PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
