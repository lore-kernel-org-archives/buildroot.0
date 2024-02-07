Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284EEC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFEFE81B9A;
	Wed,  7 Feb 2024 16:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8NkP6Eki6qYd; Wed,  7 Feb 2024 16:40:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4616E81F3A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4616E81F3A;
	Wed,  7 Feb 2024 16:40:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C628B1BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8E82416CA
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sm_R6kUEUFZ8 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:40:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D27D940568
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D27D940568
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:40:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B345A81001; Wed,  7 Feb 2024 16:40:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:38:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b2d0b466cf79e25d95a06213b803c1554aec2aa
X-Git-Newrev: 8bdb470c7b41e7c0425f59a23f78a398dba883fd
X-Patchwork-Hint: ignore
Message-Id: <20240207164000.B345A81001@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-scm-git-archive:
 bump to version 1.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bdb470c7b41e7c0425f59a23f78a398dba883fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../python-setuptools-scm-git-archive.hash                            | 4 ++--
 .../python-setuptools-scm-git-archive.mk                              | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
index 40b4b0e7f7..ce790a3d59 100644
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm-git-archive/json
-md5  df3933d33c49c5d9aca06715b4c65370  setuptools_scm_git_archive-1.4.tar.gz
-sha256  b048b27b32e1e76ec865b0caa4bb85df6ddbf4697d6909f567ac36709f6ef2f0  setuptools_scm_git_archive-1.4.tar.gz
+md5  cfcdab6edbe6b710ab24ad355e7cf7a3  setuptools_scm_git_archive-1.4.1.tar.gz
+sha256  c418bc77b3974d3ac65f268f058f23e01dc5f991f2233128b0e16a69de227b09  setuptools_scm_git_archive-1.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
index 278fc972e5..153343788b 100644
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION = 1.4
+PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION = 1.4.1
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SOURCE = setuptools_scm_git_archive-$(PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SITE = https://files.pythonhosted.org/packages/69/5f/7135eec07395c51d3dd6899251b277405ecc2f8f7a80ef80a483e3c5a2bd
+PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SITE = https://files.pythonhosted.org/packages/47/d6/c9a8d1ea95613f79b9b914cf9a5e8e420b7625fc54137c1d7c9cbbda5adf
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
