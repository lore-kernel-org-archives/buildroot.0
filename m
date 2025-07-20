Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAA6C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 21:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6032B839CD;
	Sun, 20 Jul 2025 21:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aX-eiLVFFYAb; Sun, 20 Jul 2025 21:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DC3F83490
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DC3F83490;
	Sun, 20 Jul 2025 21:30:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D922127
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43D5940922
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQcT7ShjKKqM for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 21:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D02740920
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D02740920
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:30:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C9BA86900; Sun, 20 Jul 2025 21:30:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 22:53:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4f62f87272bdccae43fd3592acb637fcd324de0
X-Git-Newrev: 723651ed0e33673ab2e13f3ef56a7e7b929a00cb
X-Patchwork-Hint: ignore
Message-Id: <20250720213008.4C9BA86900@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiojobs: bump to version
 1.4.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=723651ed0e33673ab2e13f3ef56a7e7b929a00cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiojobs/python-aiojobs.hash | 4 ++--
 package/python-aiojobs/python-aiojobs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiojobs/python-aiojobs.hash b/package/python-aiojobs/python-aiojobs.hash
index d5721dc6d0..b37c0c2a8c 100644
--- a/package/python-aiojobs/python-aiojobs.hash
+++ b/package/python-aiojobs/python-aiojobs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiojobs/json
-md5  efad80daa647b6346258f1027da44c8b  aiojobs-1.3.0.tar.gz
-sha256  03074c884b3dc388b8d798c0de24ec17d72b2799018497fda8062c0431a494b5  aiojobs-1.3.0.tar.gz
+md5  62057a870d80ed0d9ebe951ba3457cff  aiojobs-1.4.0.tar.gz
+sha256  463665c75d1fcc46c78d44375c1034abf5e3f087894b0fc5ec4dd16ef90fdc98  aiojobs-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1803dc89455114eefad3b827543343edc2452432fdac29b5edc66c8b66d4cbf3  LICENSE
diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
index e8ada82305..e0dff3fbe8 100644
--- a/package/python-aiojobs/python-aiojobs.mk
+++ b/package/python-aiojobs/python-aiojobs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOJOBS_VERSION = 1.3.0
+PYTHON_AIOJOBS_VERSION = 1.4.0
 PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
-PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/c4/0b/d612a769c28bd22bcc52b369a9a10c63eb6e7b5e2e0cfb35e3be7357fe29
+PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/03/54/751969398e2039b4dc458fa153dc066a0f7337a5b480d58944f59b7b38ae
 PYTHON_AIOJOBS_SETUP_TYPE = setuptools
 PYTHON_AIOJOBS_LICENSE = Apache-2.0
 PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
