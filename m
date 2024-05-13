Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D08C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF90340866;
	Mon, 13 May 2024 21:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFkFsTFoV7zh; Mon, 13 May 2024 21:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8027940878
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8027940878;
	Mon, 13 May 2024 21:02:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C8251BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9373C828F2
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Nt7iP1vvzCe for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84912826D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84912826D6
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:02:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6ADD7872E7; Mon, 13 May 2024 21:02:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 23:00:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b533c2d9ee6247939fb34fbe6550dea0a656ff1
X-Git-Newrev: fbd082e0cac44e53a83d62ff5c103fddd7fd6f31
X-Patchwork-Hint: ignore
Message-Id: <20240513210212.6ADD7872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump version to
 2.0.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbd082e0cac44e53a83d62ff5c103fddd7fd6f31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 0bc9256c54..d047719d54 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  ea746e69e0702cc8d2c91c5140ce35cc  SQLAlchemy-2.0.28.tar.gz
-sha256  bd9566b8e58cabd700bc367b60e90d9349cd16f0984973f98a9a09f9c64e86f0  SQLAlchemy-2.0.29.tar.gz
+md5  c13a21626c7ae00b42a08880af574e3c  SQLAlchemy-2.0.30.tar.gz
+sha256  2b1708916730f4830bc69d6f49d37f7698b5bd7530aca7f04f785f8849e95255  SQLAlchemy-2.0.30.tar.gz
 # Locally computed sha256 checksums
 sha256  3c0f59ab887d041de6a4e52ffe3e9edb5d9522de909fae9a6cd7adb6e7be3293  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index b7dac92a99..e1180a4e1a 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.29
+PYTHON_SQLALCHEMY_VERSION = 2.0.30
 PYTHON_SQLALCHEMY_SOURCE = SQLAlchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/99/04/59971bfc2f192e3b52376ca8d1e134c78d04bc044ef7e04cf10c42d2ce17
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/36/d0/0137ebcf0dc230c2e82a621b3af755b8788a2a9dd6fd1b8cd6d5e7f6b00d
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
