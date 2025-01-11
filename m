Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578BDC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0C6E4F4D6;
	Fri, 28 Feb 2025 16:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDsTQgSr1iUz; Fri, 28 Feb 2025 16:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA5150117
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AA5150117;
	Fri, 28 Feb 2025 16:54:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20814711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 113F043671
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPTsaKdkuRXy for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 970F742D21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 970F742D21
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FBC487A8B; Fri, 28 Feb 2025 16:30:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 17:30:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: df8012b565a46759ce53168385ab6b010a4349ba
X-Git-Newrev: ea6fb2554bd0607b94b801471e520829f006ee9c
X-Patchwork-Hint: ignore
Message-Id: <20250228163003.8FBC487A8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-gitdb2: bump to
 version 4.0.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea6fb2554bd0607b94b801471e520829f006ee9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-gitdb2/python-gitdb2.hash | 4 ++--
 package/python-gitdb2/python-gitdb2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gitdb2/python-gitdb2.hash b/package/python-gitdb2/python-gitdb2.hash
index c70c1aade9..74a7c6ead8 100644
--- a/package/python-gitdb2/python-gitdb2.hash
+++ b/package/python-gitdb2/python-gitdb2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gitdb/json
-md5  6071755f2899cd4882b83a070b045bac  gitdb-4.0.11.tar.gz
-sha256  bf5421126136d6d0af55bc1e7c1af1c397a34f5b7bd79e776cd3e89785c2b04b  gitdb-4.0.11.tar.gz
+md5  13bf7fcb906ead5236d1edc6e6656924  gitdb-4.0.12.tar.gz
+sha256  5ef71f855d191a3326fcfbc0d5da835f26b13fbcba60c32c21091c349ffdb571  gitdb-4.0.12.tar.gz
 # Locally computed sha256 checksums
 sha256  efd29f596a08e8857e68e7694a50bcda72839792da7c3f041bcbff5f18009239  LICENSE
diff --git a/package/python-gitdb2/python-gitdb2.mk b/package/python-gitdb2/python-gitdb2.mk
index 424f37f8f4..55ec0fc6d5 100644
--- a/package/python-gitdb2/python-gitdb2.mk
+++ b/package/python-gitdb2/python-gitdb2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GITDB2_VERSION = 4.0.11
+PYTHON_GITDB2_VERSION = 4.0.12
 PYTHON_GITDB2_SOURCE = gitdb-$(PYTHON_GITDB2_VERSION).tar.gz
-PYTHON_GITDB2_SITE = https://files.pythonhosted.org/packages/19/0d/bbb5b5ee188dec84647a4664f3e11b06ade2bde568dbd489d9d64adef8ed
+PYTHON_GITDB2_SITE = https://files.pythonhosted.org/packages/72/94/63b0fc47eb32792c7ba1fe1b694daec9a63620db1e313033d18140c2320a
 PYTHON_GITDB2_SETUP_TYPE = setuptools
 PYTHON_GITDB2_LICENSE = BSD-3-Clause
 PYTHON_GITDB2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
