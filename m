Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF434C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F89060C09;
	Mon,  7 Nov 2022 22:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F89060C09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ky1zlSit0mfz; Mon,  7 Nov 2022 22:22:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CD3160BF5;
	Mon,  7 Nov 2022 22:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD3160BF5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF66B1BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ACA84031F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ACA84031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pG1ByaIMPKL7 for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:20:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69F754015E
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F754015E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58BF6881EB; Mon,  7 Nov 2022 22:20:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:20:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e6cecea3c3a985fe65f16a71d2e3eb2dd3705d60
X-Git-Newrev: b43db8c4226015548c0e2898c230323255add7a8
X-Patchwork-Hint: ignore
Message-Id: <20221107222019.58BF6881EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pyroute2: bump
 to version 0.7.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b43db8c4226015548c0e2898c230323255add7a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Migrate from distutils to setuptools infrastructure.

README.license hash changed due to identifier format update:
https://github.com/svinota/pyroute2/commit/7cd8791881d636069fd57788391314fab625ef49

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyroute2/python-pyroute2.hash | 10 +++++-----
 package/python-pyroute2/python-pyroute2.mk   |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index c292379ebf..bac8809f2d 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5  371683b62314211b8bc9807ac8ef1144  pyroute2-0.5.7.tar.gz
-sha256  963fce07da2841456d39e3b932b071f6de28d23dadfae014022d67a752916f98  pyroute2-0.5.7.tar.gz
+md5  caaef93e32f2c3aee305aefba7c8ad21  pyroute2-0.7.3.tar.gz
+sha256  7041040db1c2d187fbccd151485b1244c41d758be821785847946370eb6bb706  pyroute2-0.7.3.tar.gz
 # Locally computed sha256
-sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache.v2
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL.v2
-sha256  e329111754f1340de20b6084cae4d264b7b4fc8fb48964173f8ee0cb7440a51c  README.license.md
+sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache-2.0
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0-or-later
+sha256  cbd229e4525bd162dd51f53b2e972d0383f0d0bd5277a10387a57ab9bff97c9f  README.license.rst
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index 44c42d1033..fb4a1cbe5d 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.5.7
+PYTHON_PYROUTE2_VERSION = 0.7.3
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/6b/94/2a5f6c11369a21efd27a0b4cb92adf5012da7acdbce7e78055710986ca23
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/9c/e6/8d163b1aea84223696fef8f8c55566adf166b79d614d602469d64af00226
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
-PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache.v2 LICENSE.GPL.v2 README.license.md
-PYTHON_PYROUTE2_SETUP_TYPE = distutils
+PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 LICENSE.GPL-2.0-or-later README.license.rst
+PYTHON_PYROUTE2_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
