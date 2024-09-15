Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5506FC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 238D681402;
	Sun, 15 Sep 2024 21:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWdWUGlrdrvC; Sun, 15 Sep 2024 21:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A71840BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8A71840BE;
	Sun, 15 Sep 2024 21:38:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A35F1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6E7F608A6
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IS0ZuOm3ULj for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70A266088C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70A266088C
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 690CB835CD; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4afa0d048b2d4339d53edbe1bf54a0ec66910a93
X-Git-Newrev: 19c063deef220f9b9e3e1ed7e5a00aea6a21cfb2
X-Patchwork-Hint: ignore
Message-Id: <20240915213638.690CB835CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bluezero: bump to version
 0.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=19c063deef220f9b9e3e1ed7e5a00aea6a21cfb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bluezero/python-bluezero.hash | 4 ++--
 package/python-bluezero/python-bluezero.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bluezero/python-bluezero.hash b/package/python-bluezero/python-bluezero.hash
index e9ccb9133e..150a384223 100644
--- a/package/python-bluezero/python-bluezero.hash
+++ b/package/python-bluezero/python-bluezero.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bluezero/json
-md5  5c256c89c3973cfd20f340f095525af2  bluezero-0.8.0.tar.gz
-sha256  9bd6706ff6b941c3bedd5b64e0447051120ae8eeac458fb65f56cc6730e1e598  bluezero-0.8.0.tar.gz
+md5  8bace06486618fceca632aedc2733027  bluezero-0.9.0.tar.gz
+sha256  2512935e094e3afd21ca9d4cb1b9aaa88a524e9538ae81305b2086f09f0eee17  bluezero-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  59319e80b4caa94ace4817c9f84aa16abc9d4d2b5f7866251b5fda92e87ccdef  LICENSE
diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
index 8e078f1073..81e7363fc7 100644
--- a/package/python-bluezero/python-bluezero.mk
+++ b/package/python-bluezero/python-bluezero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLUEZERO_VERSION = 0.8.0
+PYTHON_BLUEZERO_VERSION = 0.9.0
 PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
-PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/67/e1/15fc417b9828d38aa8e09ba06df61d6889740fe45867510a781df9a8ba35
+PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/7b/9c/bfb3e1f92dd39bf3de8fc483a102bfae763fbf156177b77ed96b8a38bbb1
 PYTHON_BLUEZERO_SETUP_TYPE = setuptools
 PYTHON_BLUEZERO_LICENSE = MIT
 PYTHON_BLUEZERO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
