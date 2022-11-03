Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82217C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 244F681FC6;
	Thu,  3 Nov 2022 21:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 244F681FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2a2uMZxTDp57; Thu,  3 Nov 2022 21:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31BF081FBF;
	Thu,  3 Nov 2022 21:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31BF081FBF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 556941BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AD7840C16
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AD7840C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wPMrtr-bg6m for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF0A640C2C
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF0A640C2C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB9DE87BCC; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0aeb786c1e73acba9b0f6ff1a187c2fa328ad72
X-Git-Newrev: 331393e8a5903fa5b41e7854c02b56f3c0b168a5
X-Patchwork-Hint: ignore
Message-Id: <20221103205514.AB9DE87BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-sqlalchemy:
 bump to version 1.4.42
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

commit: https://git.buildroot.net/buildroot/commit/?id=331393e8a5903fa5b41e7854c02b56f3c0b168a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to date update:
https://github.com/sqlalchemy/sqlalchemy/commit/ad244b9b7577486bd4e22d74d64e35802af84977

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 6 +++---
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 3274e10fd3..9f479d8f7b 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  af9722657ba51131703dbe75f24b054a  SQLAlchemy-1.3.10.tar.gz
-sha256  0f0768b5db594517e1f5e1572c73d14cf295140756431270d89496dc13d5e46c  SQLAlchemy-1.3.10.tar.gz
+md5  52318b83e8931c5f5a459f54fe4be3e8  SQLAlchemy-1.4.42.tar.gz
+sha256  177e41914c476ed1e1b77fd05966ea88c094053e17a85303c4ce007f88eff363  SQLAlchemy-1.4.42.tar.gz
 # Locally computed sha256 checksums
-sha256  0acffa15f3427e94014235e3c44376f6fe5df0ff461a93a9116eebcce74c056e  LICENSE
+sha256  859ded25da34c1eb73e6e736df4c5f8ce3ed2ed5290663176f06e7720d9c9a20  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index d6829853fc..a94b9eca92 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 1.3.10
+PYTHON_SQLALCHEMY_VERSION = 1.4.42
 PYTHON_SQLALCHEMY_SOURCE = SQLAlchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/14/0e/487f7fc1e432cec50d2678f94e4133f2b9e9356e35bacc30d73e8cb831fc
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/e4/56/8ea85eaab7d93b58f9c213ad8fc5882838189a29fc8cc401d80710a12969
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
