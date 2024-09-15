Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88254C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5906581EE4;
	Sun, 15 Sep 2024 21:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6ouNwzkVQTe; Sun, 15 Sep 2024 21:40:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D62BA84847
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D62BA84847;
	Sun, 15 Sep 2024 21:40:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 706AE1BF94D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F45F60894
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_itCV_YOv_9 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B55A6608A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B55A6608A4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE5AC835CD; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b752ec8c8e2408f747dbe581356c1ede3c1f4044
X-Git-Newrev: a15f8cff85fac14fbd1232069d4c6f1690677ef7
X-Patchwork-Hint: ignore
Message-Id: <20240915213639.AE5AC835CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-cors: bump to version
 5.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a15f8cff85fac14fbd1232069d4c6f1690677ef7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-cors/python-flask-cors.hash | 4 ++--
 package/python-flask-cors/python-flask-cors.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index ced7d9dcea..41c232df36 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-cors/json
-md5  0ccfa375e744200243d85719b38cdbc6  Flask-Cors-4.0.0.tar.gz
-sha256  f268522fcb2f73e2ecdde1ef45e2fd5c71cc48fe03cffb4b441c6d1b40684eb0  Flask-Cors-4.0.0.tar.gz
+md5  a6e8202cc008ef6f70ce75a7ae7f8d9d  flask_cors-5.0.0.tar.gz
+sha256  5aadb4b950c4e93745034594d9f3ea6591f734bb3662e16e255ffbf5e89c88ef  flask_cors-5.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index bfcaf63c64..1119648370 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CORS_VERSION = 4.0.0
-PYTHON_FLASK_CORS_SOURCE = Flask-Cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
-PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/c8/b0/bd7130837a921497520f62023c7ba754e441dcedf959a43e6d1fd86e5451
+PYTHON_FLASK_CORS_VERSION = 5.0.0
+PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
+PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/4f/d0/d9e52b154e603b0faccc0b7c2ad36a764d8755ef4036acbf1582a67fb86b
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
