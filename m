Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653A7CAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D8CB41367;
	Wed, 17 Sep 2025 16:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzxW5bZlTQBn; Wed, 17 Sep 2025 16:46:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77AA54136A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77AA54136A;
	Wed, 17 Sep 2025 16:46:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CD94279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F1CB611D9
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQAbssF7aOCA for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:45:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5290D615A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5290D615A8
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5017485212; Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 18:42:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85fef1bb9137864f7a7274ccb596ba68619520f2
X-Git-Newrev: b08d65ac395aa95f7a675038a8316558f67cb6fc
X-Patchwork-Hint: ignore
Message-Id: <20250917164534.5017485212@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-expandvars: bump to version
 1.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b08d65ac395aa95f7a675038a8316558f67cb6fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-expandvars/python-expandvars.hash | 4 ++--
 package/python-expandvars/python-expandvars.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-expandvars/python-expandvars.hash b/package/python-expandvars/python-expandvars.hash
index 0123ed5420..cd091f75b0 100644
--- a/package/python-expandvars/python-expandvars.hash
+++ b/package/python-expandvars/python-expandvars.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/expandvars/json
-md5  8091f578a547e2b4b9df59100a179266  expandvars-0.12.0.tar.gz
-sha256  7d1adfa55728cf4b5d812ece3d087703faea953e0c0a1a78415de9df5024d844  expandvars-0.12.0.tar.gz
+md5  6afc7c8f9c35241333408f34e598f458  expandvars-1.1.2.tar.gz
+sha256  6c5822b7b756a99a356b915dd1267f52ab8a4efaa135963bd7f4bd5d368f71d7  expandvars-1.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b8a43c35080fc5855e4f8171e4d0d002f6ff1633d8cfc0b5dee0ac4ced2deac7  LICENSE
diff --git a/package/python-expandvars/python-expandvars.mk b/package/python-expandvars/python-expandvars.mk
index 0a72601b5a..33dc09e181 100644
--- a/package/python-expandvars/python-expandvars.mk
+++ b/package/python-expandvars/python-expandvars.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EXPANDVARS_VERSION = 0.12.0
+PYTHON_EXPANDVARS_VERSION = 1.1.2
 PYTHON_EXPANDVARS_SOURCE = expandvars-$(PYTHON_EXPANDVARS_VERSION).tar.gz
-PYTHON_EXPANDVARS_SITE = https://files.pythonhosted.org/packages/2b/a5/46d1f58edcae1d632fafdfee313e378240e002ae45d26502bac938bd8751
+PYTHON_EXPANDVARS_SITE = https://files.pythonhosted.org/packages/9c/64/a9d8ea289d663a44b346203a24bf798507463db1e76679eaa72ee6de1c7a
 PYTHON_EXPANDVARS_SETUP_TYPE = hatch
 PYTHON_EXPANDVARS_LICENSE = MIT
 PYTHON_EXPANDVARS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
