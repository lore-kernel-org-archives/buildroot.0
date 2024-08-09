Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E9BC52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 22:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1326381359;
	Fri,  9 Aug 2024 22:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMOb0sWqyU6m; Fri,  9 Aug 2024 22:00:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5CA78143C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5CA78143C;
	Fri,  9 Aug 2024 22:00:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7916A1BF286
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74773613C8
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_PNmXZ8ypre for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 22:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FDBB606B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FDBB606B1
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 22:00:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EFEE84F7B; Fri,  9 Aug 2024 22:00:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Aug 2024 23:59:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d2f1985994da4dc95a67f1513e9f186324533bc5
X-Git-Newrev: fde4729cc1fc635198e2db504998aef3050d13a3
X-Patchwork-Hint: ignore
Message-Id: <20240809220015.8EFEE84F7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-sqlalchemy:
 bump version to 2.0.32
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
Content-Type: multipart/mixed; boundary="===============1518169613368692063=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1518169613368692063==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fde4729cc1fc635198e2db504998aef3050d13a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index a413fcc266..d9227f0528 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  dfa687701ddf1416cba19024e6f9ec3d  SQLAlchemy-2.0.31.tar.gz
-sha256  b607489dd4a54de56984a0c7656247504bd5523d9d0ba799aef59d4add009484  SQLAlchemy-2.0.31.tar.gz
+md5  fd9ed38144fce479ea96b661e048a02f  SQLAlchemy-2.0.32.tar.gz
+sha256  c1b88cc8b02b6a5f0efb0345a03672d4c897dc7d92585176f88c67346f565ea8  SQLAlchemy-2.0.32.tar.gz
 # Locally computed sha256 checksums
 sha256  3c0f59ab887d041de6a4e52ffe3e9edb5d9522de909fae9a6cd7adb6e7be3293  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 567ffbbb87..3f4e20e669 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.31
+PYTHON_SQLALCHEMY_VERSION = 2.0.32
 PYTHON_SQLALCHEMY_SOURCE = SQLAlchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/ba/7d/e3312ae374fe7a4af7e1494735125a714a0907317c829ab8d8a31d89ded4
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/af/6f/967e987683908af816aa3072c1a6997ac9933cf38d66b0474fb03f253323
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE

--===============1518169613368692063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1518169613368692063==--
