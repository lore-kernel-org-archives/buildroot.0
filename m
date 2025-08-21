Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF4DCA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 16:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A403B418A5;
	Thu, 21 Aug 2025 16:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1mq8vGXuvwM; Thu, 21 Aug 2025 16:34:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9C77418F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9C77418F7;
	Thu, 21 Aug 2025 16:34:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E1BFD8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 16:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 253A941853
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 16:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYVnnLJ4u6Z0 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 16:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 541D7418C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 541D7418C6
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 16:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3ED2287473; Thu, 21 Aug 2025 16:34:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 18:16:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9728da17bc97a54a767ec3a218d8098729a439f1
X-Git-Newrev: dda699f3f1477ec91fd132f41d2f6f3ee09a4554
X-Patchwork-Hint: ignore
Message-Id: <20250821163441.3ED2287473@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pydal: bump to
 version 20250629.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=dda699f3f1477ec91fd132f41d2f6f3ee09a4554
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydal/python-pydal.hash | 6 +++---
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 2e51472313..aa6b55b951 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  3afe3f02b2b9ddeb366be400740003f5  pydal-20241204.1.tar.gz
-sha256  1ba1f9e528b985e234f5b3acfd9d549998b44f7ed7ae747b9e8d4ad3047bf511  pydal-20241204.1.tar.gz
+# md5, sha256 https://pypi.org/project/pydal/#pydal-20250629.2.tar.gz
+md5  9d6c7dcab8d109355b41befd4e00beea  pydal-20250629.2.tar.gz
+sha256  3fae6250b9dc61ab0deda8700fbe5ccc6970ba6f8de03d58d1609de97a415d29  pydal-20250629.2.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 2764314496..cd9d2967e6 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20241204.1
+PYTHON_PYDAL_VERSION = 20250629.2
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/e8/78/7ddf9aacea5cd2e63423d278d26465c63ecdae87cf1c503d8fc1f7dfcfa5
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/43/9b/a4ec4f0970259b873ee6ea66cfd7681436aa3dff814aa1ad589315a6a4a6
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
