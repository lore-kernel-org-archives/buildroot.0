Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F05AC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F1AA83F05;
	Tue,  7 Jun 2022 19:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGOy2vwyx7Q6; Tue,  7 Jun 2022 19:32:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2902982E29;
	Tue,  7 Jun 2022 19:32:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57A221BF475
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E3A540B53
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dJ-H8hY99xQC for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E24F6408BC
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E1A7686E23; Tue,  7 Jun 2022 19:04:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jun 2022 16:14:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72f333fa744c8b3dbecfba58cf657b52e27e3e7b
X-Git-Newrev: 16bfb1a3c45656da85aca892125b032befbbdbe4
X-Patchwork-Hint: ignore
Message-Id: <20220607190458.E1A7686E23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-expects-json: bump to
 version 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=16bfb1a3c45656da85aca892125b032befbbdbe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-expects-json/python-flask-expects-json.hash | 4 ++--
 package/python-flask-expects-json/python-flask-expects-json.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-expects-json/python-flask-expects-json.hash b/package/python-flask-expects-json/python-flask-expects-json.hash
index c023222fd7..e465bcb56a 100644
--- a/package/python-flask-expects-json/python-flask-expects-json.hash
+++ b/package/python-flask-expects-json/python-flask-expects-json.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-expects-json/json
-md5  c1fb8ede58db312d7923212dc97b8ab4  flask-expects-json-1.5.0.tar.gz
-sha256  0087dc3d089f1ac75a1fc0f259f4dbd02bbb9c356e92e1a080f2309e2f75d053  flask-expects-json-1.5.0.tar.gz
+md5  3a77c4059f21e6e37e652c9dbbdc2e7c  flask-expects-json-1.7.0.tar.gz
+sha256  4ef186a86f10572a21af82e549546deda024326628b4a96cd14d3a0f71754d62  flask-expects-json-1.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  06154a99fdc664107294a0a5e7e68f776078d075408dd32bbeaa7340fdd39e73  LICENSE.txt
diff --git a/package/python-flask-expects-json/python-flask-expects-json.mk b/package/python-flask-expects-json/python-flask-expects-json.mk
index 487f15d4e5..55c9bc9571 100644
--- a/package/python-flask-expects-json/python-flask-expects-json.mk
+++ b/package/python-flask-expects-json/python-flask-expects-json.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_EXPECTS_JSON_VERSION = 1.5.0
+PYTHON_FLASK_EXPECTS_JSON_VERSION = 1.7.0
 PYTHON_FLASK_EXPECTS_JSON_SOURCE = flask-expects-json-$(PYTHON_FLASK_EXPECTS_JSON_VERSION).tar.gz
-PYTHON_FLASK_EXPECTS_JSON_SITE = https://files.pythonhosted.org/packages/4c/4a/9d9d050af700fb3feebd1f8466e73d65ce8b4709f27773e07100b0993451
+PYTHON_FLASK_EXPECTS_JSON_SITE = https://files.pythonhosted.org/packages/12/a5/b27cf21d62c2b5a0a32e2f92bde9658e74c34fcc2e004bb0d591f1bf7627
 PYTHON_FLASK_EXPECTS_JSON_SETUP_TYPE = setuptools
 PYTHON_FLASK_EXPECTS_JSON_LICENSE = MIT
 PYTHON_FLASK_EXPECTS_JSON_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
