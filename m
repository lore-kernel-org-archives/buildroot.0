Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C530C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 15:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD46F82AC8;
	Mon, 17 Oct 2022 15:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD46F82AC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V474yUT7bLKq; Mon, 17 Oct 2022 15:08:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D241B81435;
	Mon, 17 Oct 2022 15:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D241B81435
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 008491BF97F
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDCAC82A2D
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDCAC82A2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ed323jNZNBDQ for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 15:08:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8A4381970
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 15:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A4381970
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D928786E80; Mon, 17 Oct 2022 15:08:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 17:07:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5428d8b7b83622578b2c75fc73691cbd0871d7d
X-Git-Newrev: e02e0f6a3b0799027aa70aa5ecfbc634732c6077
X-Patchwork-Hint: ignore
Message-Id: <20221017150813.D928786E80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-login: bump to
 version 0.6.2
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
Content-Type: multipart/mixed; boundary="===============4565932596453061652=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4565932596453061652==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e02e0f6a3b0799027aa70aa5ecfbc634732c6077
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-flask-login/python-flask-login.hash | 4 ++--
 package/python-flask-login/python-flask-login.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-login/python-flask-login.hash b/package/python-flask-login/python-flask-login.hash
index d11e37cce8..c88b70f2d5 100644
--- a/package/python-flask-login/python-flask-login.hash
+++ b/package/python-flask-login/python-flask-login.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-login/json
-md5  0a1576eab473c2a8bb576348333d5ef5  Flask-Login-0.6.1.tar.gz
-sha256  1306d474a270a036d6fd14f45640c4d77355e4f1c67ca4331b372d3448997b8c  Flask-Login-0.6.1.tar.gz
+md5  8020b22ad7ec6f17034f90117a520633  Flask-Login-0.6.2.tar.gz
+sha256  c0a7baa9fdc448cdd3dd6f0939df72eec5177b2f7abe6cb82fc934d29caac9c3  Flask-Login-0.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  7a9dfb9c5da204ed1370f3b62c13e2992a12da1da707f47e156897eeb4344e5b  LICENSE
diff --git a/package/python-flask-login/python-flask-login.mk b/package/python-flask-login/python-flask-login.mk
index 9a11fde542..394fe197e3 100644
--- a/package/python-flask-login/python-flask-login.mk
+++ b/package/python-flask-login/python-flask-login.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_LOGIN_VERSION = 0.6.1
+PYTHON_FLASK_LOGIN_VERSION = 0.6.2
 PYTHON_FLASK_LOGIN_SOURCE = Flask-Login-$(PYTHON_FLASK_LOGIN_VERSION).tar.gz
-PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/3c/0a/e376d599eb6a8999b803a8d390e32451e43a346dbe540350dad48be0069c
+PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/cc/da/eae45ba9ec58af45b46ef94c6ca04fb211ee57c06421b696e894eb11b064
 PYTHON_FLASK_LOGIN_LICENSE = MIT
 PYTHON_FLASK_LOGIN_LICENSE_FILES = LICENSE
 PYTHON_FLASK_LOGIN_SETUP_TYPE = setuptools

--===============4565932596453061652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4565932596453061652==--
