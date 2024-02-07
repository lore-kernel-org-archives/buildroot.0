Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9844C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7646683C8D;
	Wed,  7 Feb 2024 16:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3LK5snZqD3dY; Wed,  7 Feb 2024 16:43:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3615283C88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3615283C88;
	Wed,  7 Feb 2024 16:43:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3799F1BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 321B3410E4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCKLLxlbUqAq for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69367409EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69367409EB
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:43:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6438F8767C; Wed,  7 Feb 2024 16:43:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:40:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4bb00267175bc0d0cc5de0c14b03a9dd5d1cc627
X-Git-Newrev: ea08bfdf4511180def1a04befa5b06f5a627af3d
X-Patchwork-Hint: ignore
Message-Id: <20240207164326.6438F8767C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-smbprotocol: bump to
 version 1.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea08bfdf4511180def1a04befa5b06f5a627af3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-smbprotocol/python-smbprotocol.hash | 7 +++----
 package/python-smbprotocol/python-smbprotocol.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
index a46f9f635b..b9d5f74999 100644
--- a/package/python-smbprotocol/python-smbprotocol.hash
+++ b/package/python-smbprotocol/python-smbprotocol.hash
@@ -1,6 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbprotocol/json
-md5  a7474ab4cf8912dffaab56ad5067f429  smbprotocol-1.10.1.tar.gz
-sha256  b5bc9d4930ec947d42c21089a4d373b97e3f6488fd15d32d27189312fd8a04c9  smbprotocol-1.10.1.tar.gz
-
-# Locally computed
+md5  ccbb42bdd58a0070f56e966d8562451b  smbprotocol-1.12.0.tar.gz
+sha256  5916a4b6c948bb70f82c246bdbfc86cf152226b71dac9f33b3d731d91e86274f  smbprotocol-1.12.0.tar.gz
+# Locally computed sha256 checksums
 sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
index 17c2b17dbc..ece0744252 100644
--- a/package/python-smbprotocol/python-smbprotocol.mk
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBPROTOCOL_VERSION = 1.10.1
+PYTHON_SMBPROTOCOL_VERSION = 1.12.0
 PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
-PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/13/1a/73ad1883beebe4f6f47879cb9880690944faa00681141920c7a2219f6152
+PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/57/72/d95216a9fd5da1b2fa225130741f50d4949c8f76d46669d30921c06d69ff
 PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
 PYTHON_SMBPROTOCOL_LICENSE = MIT
 PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
