Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD27CE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8BF8811A6;
	Fri,  6 Sep 2024 20:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IW_UDrNPhqCa; Fri,  6 Sep 2024 20:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18B7A847D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18B7A847D8;
	Fri,  6 Sep 2024 20:07:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 213FA1BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADD8661121
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnIzRdEknsY5 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F66E60727
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F66E60727
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A247869F2; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:09:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2297dfc0e79d15770c4ee232002d09193fe8a7cd
X-Git-Newrev: 379019e891d6d536ac5a8cc37934dd901ffc948f
X-Patchwork-Hint: ignore
Message-Id: <20240906195859.4A247869F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump version to
 2.0.33
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
Content-Type: multipart/mixed; boundary="===============0851701108277381836=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0851701108277381836==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=379019e891d6d536ac5a8cc37934dd901ffc948f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: http://autobuild.buildroot.org/results/c53/c531b6e63c5121138e8e8a1c5d1501d9d7e1391e/

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
[yann.morin.1998@free.fr: add build failure URL]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index d9227f0528..7ffdfaf1b5 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  fd9ed38144fce479ea96b661e048a02f  SQLAlchemy-2.0.32.tar.gz
-sha256  c1b88cc8b02b6a5f0efb0345a03672d4c897dc7d92585176f88c67346f565ea8  SQLAlchemy-2.0.32.tar.gz
+md5  2d7c0dbb4b21a1cb0546d520e7795022  sqlalchemy-2.0.33.tar.gz
+sha256  91c93333c2b37ff721dc83b37e28c29de4c502b5612f2d093468037b86aa2be0  sqlalchemy-2.0.33.tar.gz
 # Locally computed sha256 checksums
 sha256  3c0f59ab887d041de6a4e52ffe3e9edb5d9522de909fae9a6cd7adb6e7be3293  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 3f4e20e669..84201cf833 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.32
-PYTHON_SQLALCHEMY_SOURCE = SQLAlchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/af/6f/967e987683908af816aa3072c1a6997ac9933cf38d66b0474fb03f253323
+PYTHON_SQLALCHEMY_VERSION = 2.0.33
+PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/d5/70/6dc437aff20e454e8ac35cdcc74620fad55985b5ea2830fa2d73b02d5805
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE

--===============0851701108277381836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0851701108277381836==--
