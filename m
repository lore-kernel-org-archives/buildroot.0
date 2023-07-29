Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC8BC001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D580081B3E;
	Sat, 29 Jul 2023 21:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D580081B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JzH6KZQnjW3; Sat, 29 Jul 2023 21:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D49481341;
	Sat, 29 Jul 2023 21:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D49481341
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AE9A1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5237D40350
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5237D40350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-v3xVTtpgSQ for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:40:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B61D40165
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B61D40165
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69D8A83B56; Sat, 29 Jul 2023 21:40:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 23:39:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1367f3e465500129998631419cf645c0180c71a1
X-Git-Newrev: d81517903f73ba927ef72934aa211a1d5ddbf414
X-Patchwork-Hint: ignore
Message-Id: <20230729214012.69D8A83B56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-smorest: bump version
 to 0.42.0
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
Content-Type: multipart/mixed; boundary="===============5576781158945992836=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5576781158945992836==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d81517903f73ba927ef72934aa211a1d5ddbf414
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-smorest/python-flask-smorest.hash | 4 ++--
 package/python-flask-smorest/python-flask-smorest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-smorest/python-flask-smorest.hash b/package/python-flask-smorest/python-flask-smorest.hash
index 941535c503..2c9cf3a51a 100644
--- a/package/python-flask-smorest/python-flask-smorest.hash
+++ b/package/python-flask-smorest/python-flask-smorest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-smorest/json
-md5  1dad52f26c59ca2dcaf0c5d109879605  flask-smorest-0.40.0.tar.gz
-sha256  9b46b4937ccf78702d99fed8cfd1cd5c37608ddefd65ff16a86d1ad5c7f7d8c0  flask-smorest-0.40.0.tar.gz
+md5  d7f8b4f7c9c6c2607dfc68bd5bbbd52d  flask-smorest-0.42.0.tar.gz
+sha256  868421b29e060a602e3739c2caf7b97cfe21c3ac488f51a2b5e95e168dd3bec2  flask-smorest-0.42.0.tar.gz
 # Locally computed sha256 checksums
 sha256  40999ea1d9c1b8202fa44f8e6849a557e22df892481e067abf999879064b9521  LICENSE
diff --git a/package/python-flask-smorest/python-flask-smorest.mk b/package/python-flask-smorest/python-flask-smorest.mk
index 069d9244dd..ac4ff188a5 100644
--- a/package/python-flask-smorest/python-flask-smorest.mk
+++ b/package/python-flask-smorest/python-flask-smorest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SMOREST_VERSION = 0.40.0
+PYTHON_FLASK_SMOREST_VERSION = 0.42.0
 PYTHON_FLASK_SMOREST_SOURCE = flask-smorest-$(PYTHON_FLASK_SMOREST_VERSION).tar.gz
-PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/e6/b5/1b81ea4f7e377cf8a653aa10c249656a1c73de7a3695b2544d7a713ea3c2
+PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/45/ec/9ceb51a4b8a20ae66bfc7e83ad6781f03a9f37cde6a4111a65aa6cb669a2
 PYTHON_FLASK_SMOREST_SETUP_TYPE = setuptools
 PYTHON_FLASK_SMOREST_LICENSE = MIT
 PYTHON_FLASK_SMOREST_LICENSE_FILES = LICENSE

--===============5576781158945992836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5576781158945992836==--
