Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F21CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E856082C;
	Sat, 21 Sep 2024 21:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8xecXOrG_TR; Sat, 21 Sep 2024 21:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 295706073C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 295706073C;
	Sat, 21 Sep 2024 21:08:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09C391BF869
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9735E6073C
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UOPkyswC7T4 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B493D60643
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B493D60643
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1B36841A3; Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:52:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d90d3eb5bb49b544b99eb3722f47155b7db4025
X-Git-Newrev: 1f34b6153194271dd442ad2be6f1b2b7d6c82d56
X-Patchwork-Hint: ignore
Message-Id: <20240921210741.B1B36841A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pdm-backend: bump to
 version 2.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f34b6153194271dd442ad2be6f1b2b7d6c82d56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pdm-backend/python-pdm-backend.hash | 4 ++--
 package/python-pdm-backend/python-pdm-backend.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
index cc26e58462..70cbf21c66 100644
--- a/package/python-pdm-backend/python-pdm-backend.hash
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pdm-backend/json
-md5  b2805090bbe41c86eb051b1311c7ba34  pdm_backend-2.3.1.tar.gz
-sha256  c03cfb3a803325c049b57ba2502b409479ebb22b6a4ee3746c1f688b939764e8  pdm_backend-2.3.1.tar.gz
+md5  ba2ab8fb453ec751bc186e9c341d4f3a  pdm_backend-2.3.3.tar.gz
+sha256  a8616f628ec84353d7a0ba86b228dcf01bab5debc9e4d1a29e5311a52425d594  pdm_backend-2.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
index a95024ec9b..f1e9fc91d7 100644
--- a/package/python-pdm-backend/python-pdm-backend.mk
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PDM_BACKEND_VERSION = 2.3.1
+PYTHON_PDM_BACKEND_VERSION = 2.3.3
 PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
-PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/70/f4/eaa4da6e3eaa32d902177e0b81563bb5526b2c387aa312d0dfbecf3c7109
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/75/2b/0be2d0f2eba3a4acb755fd2b0e442ef67770b2ef6c75fd646d49f20968fa
 PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
 PYTHON_PDM_BACKEND_LICENSE = MIT
 PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
