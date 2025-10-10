Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D06CCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 12:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 123B880061;
	Fri, 10 Oct 2025 12:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 091SVDmHxUuN; Fri, 10 Oct 2025 12:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AA3384548
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AA3384548;
	Fri, 10 Oct 2025 12:04:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D746814B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7A6D8403A
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQaMvKuNoLnw for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 12:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF06B83B76
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF06B83B76
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:04:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF9AE86F10; Fri, 10 Oct 2025 12:04:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 13:58:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2343cad2be33b340e108b60196ce94c2e8c52e3b
X-Git-Newrev: fe0df1157c4ce3548a93625faa3ca1f9c7ae8814
X-Patchwork-Hint: ignore
Message-Id: <20251010120416.AF9AE86F10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump to version
 2.0.43
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
Content-Type: multipart/mixed; boundary="===============8458658898616406024=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8458658898616406024==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fe0df1157c4ce3548a93625faa3ca1f9c7ae8814
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.42
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.43

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 93f6bb35ab..8c688914aa 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  76ade8b13f77b9ceaff6c91f5617c668  sqlalchemy-2.0.41.tar.gz
-sha256  edba70118c4be3c2b1f90754d308d0b79c6fe2c0fdc52d8ddf603916f83f4db9  sqlalchemy-2.0.41.tar.gz
+md5  a006c045b1a5610dba083ab3ae5dd991  sqlalchemy-2.0.43.tar.gz
+sha256  788bfcef6787a7764169cfe9859fe425bf44559619e1d9f56f5bddf2ebf6f417  sqlalchemy-2.0.43.tar.gz
 # Locally computed sha256 checksums
 sha256  9821720b58d4a565b61321007a8ad43ab6991a3959e66cd5db4dd9eae69c7dfc  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 10a9f16b66..733d27ae69 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.41
+PYTHON_SQLALCHEMY_VERSION = 2.0.43
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/63/66/45b165c595ec89aa7dcc2c1cd222ab269bc753f1fc7a1e68f8481bd957bf
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/d7/bc/d59b5d97d27229b0e009bd9098cd81af71c2fa5549c580a0a67b9bed0496
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE

--===============8458658898616406024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8458658898616406024==--
