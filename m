Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B530DC43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 14:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7003C408D1;
	Thu,  2 Jun 2022 14:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TeNbNUncR7Uv; Thu,  2 Jun 2022 14:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 022AF408AC;
	Thu,  2 Jun 2022 14:22:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57F891BF5EA
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44BCA8266A
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y6tBj89GZEKP for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 14:21:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE21182A0E
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 14:21:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9909B86A98; Thu,  2 Jun 2022 14:10:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jun 2022 16:14:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d2fc8442ebc20b2baf90e684c43fb9bc78fe838d
X-Git-Newrev: 72f333fa744c8b3dbecfba58cf657b52e27e3e7b
X-Patchwork-Hint: ignore
Message-Id: <20220602141006.9909B86A98@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-flask-login:
 bump to version 0.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=72f333fa744c8b3dbecfba58cf657b52e27e3e7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-login/python-flask-login.hash | 9 ++++-----
 package/python-flask-login/python-flask-login.mk   | 4 ++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-flask-login/python-flask-login.hash b/package/python-flask-login/python-flask-login.hash
index 9ff1f82a09..d11e37cce8 100644
--- a/package/python-flask-login/python-flask-login.hash
+++ b/package/python-flask-login/python-flask-login.hash
@@ -1,6 +1,5 @@
-# From https://pypi.org/project/Flask-Login/#copy-hash-modal-8bb2ac58-b80a-4793-84d4-4f32b92976d9
-md5  a2d94aa6ae935345ebc68eb3cbb5fccd  Flask-Login-0.5.0.tar.gz
-sha256  6d33aef15b5bcead780acc339464aae8a6e28f13c90d8b1cf9de8b549d1c0b4b  Flask-Login-0.5.0.tar.gz
-
-# License files
+# md5, sha256 from https://pypi.org/pypi/flask-login/json
+md5  0a1576eab473c2a8bb576348333d5ef5  Flask-Login-0.6.1.tar.gz
+sha256  1306d474a270a036d6fd14f45640c4d77355e4f1c67ca4331b372d3448997b8c  Flask-Login-0.6.1.tar.gz
+# Locally computed sha256 checksums
 sha256  7a9dfb9c5da204ed1370f3b62c13e2992a12da1da707f47e156897eeb4344e5b  LICENSE
diff --git a/package/python-flask-login/python-flask-login.mk b/package/python-flask-login/python-flask-login.mk
index efb63b262b..9a11fde542 100644
--- a/package/python-flask-login/python-flask-login.mk
+++ b/package/python-flask-login/python-flask-login.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_LOGIN_VERSION = 0.5.0
+PYTHON_FLASK_LOGIN_VERSION = 0.6.1
 PYTHON_FLASK_LOGIN_SOURCE = Flask-Login-$(PYTHON_FLASK_LOGIN_VERSION).tar.gz
-PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/f9/01/f6c0a3a654ca125cf9cd273314c03a8bc6a47bf861765c8c1d375e15a28d
+PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/3c/0a/e376d599eb6a8999b803a8d390e32451e43a346dbe540350dad48be0069c
 PYTHON_FLASK_LOGIN_LICENSE = MIT
 PYTHON_FLASK_LOGIN_LICENSE_FILES = LICENSE
 PYTHON_FLASK_LOGIN_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
