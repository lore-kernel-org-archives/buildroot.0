Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E080EC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A77742151;
	Mon,  6 Nov 2023 22:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A77742151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K4_4Iq5Sxgz2; Mon,  6 Nov 2023 22:26:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0B714212D;
	Mon,  6 Nov 2023 22:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0B714212D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FDB51BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2942341665
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2942341665
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y7aiOLCmofMV for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A0DF415CB
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A0DF415CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6653C86B77; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:15:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 998ecc6c93b8b6f4a856388fe6bc2abd8fd399d1
X-Git-Newrev: f650ad66d013506397d7a539c1686473e728ed73
X-Patchwork-Hint: ignore
Message-Id: <20231106222017.6653C86B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-login: bump to
 version 0.6.3
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
Content-Type: multipart/mixed; boundary="===============4600308927249111489=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4600308927249111489==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f650ad66d013506397d7a539c1686473e728ed73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-login/python-flask-login.hash | 4 ++--
 package/python-flask-login/python-flask-login.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-login/python-flask-login.hash b/package/python-flask-login/python-flask-login.hash
index c88b70f2d5..af034ae751 100644
--- a/package/python-flask-login/python-flask-login.hash
+++ b/package/python-flask-login/python-flask-login.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-login/json
-md5  8020b22ad7ec6f17034f90117a520633  Flask-Login-0.6.2.tar.gz
-sha256  c0a7baa9fdc448cdd3dd6f0939df72eec5177b2f7abe6cb82fc934d29caac9c3  Flask-Login-0.6.2.tar.gz
+md5  689564b8b7f3782f0db382b7aa85bbc2  Flask-Login-0.6.3.tar.gz
+sha256  5e23d14a607ef12806c699590b89d0f0e0d67baeec599d75947bf9c147330333  Flask-Login-0.6.3.tar.gz
 # Locally computed sha256 checksums
 sha256  7a9dfb9c5da204ed1370f3b62c13e2992a12da1da707f47e156897eeb4344e5b  LICENSE
diff --git a/package/python-flask-login/python-flask-login.mk b/package/python-flask-login/python-flask-login.mk
index 394fe197e3..ed10c98f5a 100644
--- a/package/python-flask-login/python-flask-login.mk
+++ b/package/python-flask-login/python-flask-login.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_LOGIN_VERSION = 0.6.2
+PYTHON_FLASK_LOGIN_VERSION = 0.6.3
 PYTHON_FLASK_LOGIN_SOURCE = Flask-Login-$(PYTHON_FLASK_LOGIN_VERSION).tar.gz
-PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/cc/da/eae45ba9ec58af45b46ef94c6ca04fb211ee57c06421b696e894eb11b064
+PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/c3/6e/2f4e13e373bb49e68c02c51ceadd22d172715a06716f9299d9df01b6ddb2
 PYTHON_FLASK_LOGIN_LICENSE = MIT
 PYTHON_FLASK_LOGIN_LICENSE_FILES = LICENSE
 PYTHON_FLASK_LOGIN_SETUP_TYPE = setuptools

--===============4600308927249111489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4600308927249111489==--
