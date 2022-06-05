Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3921AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5058612A2;
	Sun,  5 Jun 2022 21:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSINGcN2Noub; Sun,  5 Jun 2022 21:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C97E66129A;
	Sun,  5 Jun 2022 21:10:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3000C1BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1634F83F70
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mddfnXdKQzPG for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:10:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AB2583F6B
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:10:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A876D86C1A; Sun,  5 Jun 2022 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jun 2022 23:10:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f27ea50528755b5f353e3db124dee535645dcf09
X-Git-Newrev: 9866182c39b133e0f7b116a1cb9b1626e572bd47
X-Patchwork-Hint: ignore
Message-Id: <20220605205846.A876D86C1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pyjwt: bump to
 version 2.4.0
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
Content-Type: multipart/mixed; boundary="===============0537834628965003868=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0537834628965003868==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9866182c39b133e0f7b116a1cb9b1626e572bd47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The hash of the license file is changed due to a copyright year
change:

-Copyright (c) 2015 José Padilla
+Copyright (c) 2015-2022 José Padilla

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyjwt/python-pyjwt.hash | 6 +++---
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index 5ea6c0cd50..d51df02be1 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5  60cf2d463157bf21eb37be0430521036  PyJWT-2.3.0.tar.gz
-sha256  b888b4d56f06f6dcd777210c334e69c737be74755d3e5e9ee3fe67dc18a0ee41  PyJWT-2.3.0.tar.gz
+md5  665f444d7805e36826bb09ce6434e73a  PyJWT-2.4.0.tar.gz
+sha256  d42908208c699b3b973cbeb01a969ba6a96c821eefb1c5bfe4c390c01d67abba  PyJWT-2.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256  ec82af815b5f9da8685afb300cc5beb7949e1c22b79b6c1c054796cefdf6cac6  LICENSE
+sha256  797a7a20231d4c433e9f1911db1731d06b5828b98f499819a034f7c0f56f5ce5  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index ba8130e7ca..53cc50b650 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.3.0
+PYTHON_PYJWT_VERSION = 2.4.0
 PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/1d/8e/01bdcfdbb352daaba8ea406d9df149c5bba7dbf70f908d4fa4c269fe6a08
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/d8/6b/6287745054dbcccf75903630346be77d4715c594402cec7c2518032416c2
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE

--===============0537834628965003868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0537834628965003868==--
