Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9291C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65C2B40BD6;
	Thu,  3 Nov 2022 21:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65C2B40BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZzY5_jRNZxeK; Thu,  3 Nov 2022 21:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77C8C40BDD;
	Thu,  3 Nov 2022 21:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77C8C40BDD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4785F1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E9FE4162D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E9FE4162D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mVRF9ZUKRWPF for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B406441759
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B406441759
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1C6687BCE; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1fbb2cef681e154ab5ee0b8d13e90596d902c5e8
X-Git-Newrev: ada358be6bba0ca95f4a16e98373ecf7a9e1e263
X-Patchwork-Hint: ignore
Message-Id: <20221103205511.B1C6687BCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/python-flask-sqlalchemy: bump to version 3.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ada358be6bba0ca95f4a16e98373ecf7a9e1e263
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash | 4 ++--
 package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
index 4c2a701eb3..50ca14371d 100644
--- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
+++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-sqlalchemy/json
-md5  dcb6b62248ced71dab183f2cb2778583  Flask-SQLAlchemy-2.5.1.tar.gz
-sha256  2bda44b43e7cacb15d4e05ff3cc1f8bc97936cc464623424102bfc2c35e95912  Flask-SQLAlchemy-2.5.1.tar.gz
+md5  cbc5756b7e14683de1a540516159a81a  Flask-SQLAlchemy-3.0.2.tar.gz
+sha256  16199f5b3ddfb69e0df2f52ae4c76aedbfec823462349dabb21a1b2e0a2b65e9  Flask-SQLAlchemy-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
index b1d00ad6c0..ca6fd0c793 100644
--- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
+++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SQLALCHEMY_VERSION = 2.5.1
+PYTHON_FLASK_SQLALCHEMY_VERSION = 3.0.2
 PYTHON_FLASK_SQLALCHEMY_SOURCE = Flask-SQLAlchemy-$(PYTHON_FLASK_SQLALCHEMY_VERSION).tar.gz
-PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/35/f0/39dd2d8e7e5223f78a5206d7020dc0e16718a964acfb3564d89e9798ab9b
+PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/0b/b7/05a8f9c3f010775275f8dec53e40ff7ea1ae61bf1cfa4b524caf4d3da982
 PYTHON_FLASK_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_FLASK_SQLALCHEMY_LICENSE = BSD-3-Clause
 PYTHON_FLASK_SQLALCHEMY_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
