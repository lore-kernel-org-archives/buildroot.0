Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECB5C021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 20:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB2D080BBE;
	Tue, 25 Feb 2025 20:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94lyWxPciEC3; Tue, 25 Feb 2025 20:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA25880CD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA25880CD7;
	Tue, 25 Feb 2025 20:12:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BB842019
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F42280CD7
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufmi2xWcJlqB for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 20:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5A8680BBE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5A8680BBE
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:12:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C3BC87B04; Tue, 25 Feb 2025 20:12:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Feb 2025 21:11:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84eed2762945f0287cff2cf604947b65c0408c8f
X-Git-Newrev: d577c1c339649d54b0dab41949a192006c86a3ae
X-Patchwork-Hint: ignore
Message-Id: <20250225201237.5C3BC87B04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump to version
 2.0.38
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
Content-Type: multipart/mixed; boundary="===============5736292599991914591=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5736292599991914591==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d577c1c339649d54b0dab41949a192006c86a3ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.38

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index cfa326cfdc..aa9888b58d 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  b7b1514b01796c1b98d7b7ddd2b2c79a  sqlalchemy-2.0.37.tar.gz
-sha256  12b28d99a9c14eaf4055810df1001557176716de0167b91026e648e65229bffb  sqlalchemy-2.0.37.tar.gz
+md5  3cbf218c54b25fa4e18d78842956601d  sqlalchemy-2.0.38.tar.gz
+sha256  e5a4d82bdb4bf1ac1285a68eab02d253ab73355d9f0fe725a97e1e0fa689decb  sqlalchemy-2.0.38.tar.gz
 # Locally computed sha256 checksums
 sha256  9821720b58d4a565b61321007a8ad43ab6991a3959e66cd5db4dd9eae69c7dfc  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index c8d919c3cd..3a9d9e06b6 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.37
+PYTHON_SQLALCHEMY_VERSION = 2.0.38
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/3b/20/93ea2518df4d7a14ebe9ace9ab8bb92aaf7df0072b9007644de74172b06c
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/e4/08/9a90962ea72acd532bda71249a626344d855c4032603924b1b547694b837
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE

--===============5736292599991914591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5736292599991914591==--
