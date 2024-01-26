Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F77C47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 08:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6C7C84FEC;
	Fri, 26 Jan 2024 08:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6C7C84FEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJUXyfOcJEIm; Fri, 26 Jan 2024 08:49:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1526F85012;
	Fri, 26 Jan 2024 08:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1526F85012
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE171BF420
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CB2C45A57
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CB2C45A57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KonDJ4MNQOKc for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6057D45B4F
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6057D45B4F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EAA5864F8; Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 09:46:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aad3136d458578350c7095e0a519834c2a175af6
X-Git-Newrev: be94e1ab54d11e4d3a387a4937ee65fa4d99b3f6
X-Patchwork-Hint: ignore
Message-Id: <20240126084846.4EAA5864F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyroute2: bump to version
 0.7.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=be94e1ab54d11e4d3a387a4937ee65fa4d99b3f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index bac8809f2d..87693d028b 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5  caaef93e32f2c3aee305aefba7c8ad21  pyroute2-0.7.3.tar.gz
-sha256  7041040db1c2d187fbccd151485b1244c41d758be821785847946370eb6bb706  pyroute2-0.7.3.tar.gz
+md5  0566531c56ec453cc9ca0aff2c3f2f31  pyroute2-0.7.10.tar.gz
+sha256  cc2f90aad1517cb0b301041f678cc8d3c3427c26e53f15c78c93c67928d89a02  pyroute2-0.7.10.tar.gz
 # Locally computed sha256
 sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache-2.0
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0-or-later
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index fb4a1cbe5d..023b8e7c44 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.7.3
+PYTHON_PYROUTE2_VERSION = 0.7.10
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/9c/e6/8d163b1aea84223696fef8f8c55566adf166b79d614d602469d64af00226
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/18/44/930e15e4fd5d0c7c54dfd303f644a057d88f411a97581d6edc5cb9e16f9e
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 LICENSE.GPL-2.0-or-later README.license.rst
 PYTHON_PYROUTE2_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
