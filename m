Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4ECC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 21:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 393A560603;
	Wed, 27 Mar 2024 21:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtJNVwMxpYWM; Wed, 27 Mar 2024 21:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 404C960BC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 404C960BC9;
	Wed, 27 Mar 2024 21:17:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB1011BF300
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2F9140199
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_LiYOeuYCDD for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 21:17:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB604415AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB604415AC
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 21:17:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4A6884307; Wed, 27 Mar 2024 21:17:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 22:11:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0bc79fc8dd6be999f11df9b9f774434d1ba513f
X-Git-Newrev: bb5cb8955bea6cd127c06ea946cf6825066385fb
X-Patchwork-Hint: ignore
Message-Id: <20240327211724.D4A6884307@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump version to
 2.0.29
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
Content-Type: multipart/mixed; boundary="===============7563273557376071854=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7563273557376071854==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bb5cb8955bea6cd127c06ea946cf6825066385fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
[Arnout: fix check-package error in hash file]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 7951a32978..0bc9256c54 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  7abfc2972d7e16315c8b7492ea0e0fdb  SQLAlchemy-2.0.25.tar.gz
-sha256  a2c69a7664fb2d54b8682dd774c3b54f67f84fa123cf84dda2a5f40dcaa04e08  SQLAlchemy-2.0.25.tar.gz
+md5  ea746e69e0702cc8d2c91c5140ce35cc  SQLAlchemy-2.0.28.tar.gz
+sha256  bd9566b8e58cabd700bc367b60e90d9349cd16f0984973f98a9a09f9c64e86f0  SQLAlchemy-2.0.29.tar.gz
 # Locally computed sha256 checksums
 sha256  3c0f59ab887d041de6a4e52ffe3e9edb5d9522de909fae9a6cd7adb6e7be3293  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 167c3a4498..b7dac92a99 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.25
+PYTHON_SQLALCHEMY_VERSION = 2.0.29
 PYTHON_SQLALCHEMY_SOURCE = SQLAlchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/7b/bb/85bd8e211f54983e927c7cd9b2ad66773fbef507957156fc72e481a62681
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/99/04/59971bfc2f192e3b52376ca8d1e134c78d04bc044ef7e04cf10c42d2ce17
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE

--===============7563273557376071854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7563273557376071854==--
