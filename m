Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7851C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B582C84768;
	Sun, 15 Sep 2024 21:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQ5q0ovIJEh8; Sun, 15 Sep 2024 21:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82BDE8476F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82BDE8476F;
	Sun, 15 Sep 2024 21:39:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 832F81BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A99AA608B7
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEhRorv7gMxF for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1731B60887
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1731B60887
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 126A583682; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 849a7ec839035be5147f6e9f72672c502cdeb5de
X-Git-Newrev: 9d713d2b7adf77954787ec66c19be773bf2a9621
X-Patchwork-Hint: ignore
Message-Id: <20240915213639.126A583682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cssutils: bump to version
 2.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d713d2b7adf77954787ec66c19be773bf2a9621
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file got renamed, but the contents did not change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cssutils/python-cssutils.hash | 6 +++---
 package/python-cssutils/python-cssutils.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
index d93135a989..66c87904b4 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssutils/json
-md5  11707e5da7c40bd98e5b4998489f10e0  cssutils-2.9.0.tar.gz
-sha256  89477b3d17d790e97b9fb4def708767061055795aae6f7c82ae32e967c9be4cd  cssutils-2.9.0.tar.gz
+md5  c8c21e635454d9ca73b21892def35f55  cssutils-2.11.1.tar.gz
+sha256  0563a76513b6af6eebbe788c3bf3d01c920e46b3f90c8416738c5cfc773ff8e2  cssutils-2.11.1.tar.gz
 # Locally computed sha256 checksums
-sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
+sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  LICENSE
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index be5be30eee..0fc706780c 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 2.9.0
+PYTHON_CSSUTILS_VERSION = 2.11.1
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/b4/65/a054545c81eb87af898d664043578b8444ea3ded656db3da8f9d9fa21334
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/33/9f/329d26121fe165be44b1dfff21aa0dc348f04633931f1d20ed6cf448a236
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
-PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
+PYTHON_CSSUTILS_LICENSE_FILES = LICENSE
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
 PYTHON_CSSUTILS_DEPENDENCIES = host-python-setuptools-scm
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
