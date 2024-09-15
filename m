Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C3FC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDB1980F46;
	Sun, 15 Sep 2024 21:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqkMz4zADITV; Sun, 15 Sep 2024 21:41:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1334980FB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1334980FB9;
	Sun, 15 Sep 2024 21:41:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18EAC1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E942C60883
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-inU-xDILIO for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A90CD60891
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A90CD60891
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A550283682; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4c7d5a80011820a7562bfcace6c4f05798fd86f
X-Git-Newrev: 89c0dae8ae3c976e40c696fc9debab797a1855aa
X-Patchwork-Hint: ignore
Message-Id: <20240915213638.A550283682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-canopen: bump to version
 2.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=89c0dae8ae3c976e40c696fc9debab797a1855aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-canopen/python-canopen.hash | 4 ++--
 package/python-canopen/python-canopen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-canopen/python-canopen.hash b/package/python-canopen/python-canopen.hash
index fc3668bc6c..8a38dc16a3 100644
--- a/package/python-canopen/python-canopen.hash
+++ b/package/python-canopen/python-canopen.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/canopen/json
-md5  2a757a6996f896d2e6afbf2bcf598df2  canopen-2.2.0.tar.gz
-sha256  5f18651b9df6e4769b9882e969f934ae773ef24a45aabc3334b586982048d08c  canopen-2.2.0.tar.gz
+md5  808c04aa0394210be9eeb46fb6e3bf96  canopen-2.3.0.tar.gz
+sha256  792084a93c138d5b2a406ddd2d4eb5ce208f03bd8fda60f81ad2bb8d56c6b827  canopen-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0740d30978affcd91c0fc817b7cf942a332381bf0380fe17e60c6a0b377c6e0d  LICENSE.txt
diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
index 09ec595ec6..e9747dcdf2 100644
--- a/package/python-canopen/python-canopen.mk
+++ b/package/python-canopen/python-canopen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CANOPEN_VERSION = 2.2.0
+PYTHON_CANOPEN_VERSION = 2.3.0
 PYTHON_CANOPEN_SOURCE = canopen-$(PYTHON_CANOPEN_VERSION).tar.gz
-PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/49/55/67e555f6f4ea51d6d966e998a77881c1bd726c6e8cc602fd04852772ce87
+PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/1a/b3/733e5f98c995d7f3e82853bc5ee2f0677df6203d51d8a4387af188322523
 PYTHON_CANOPEN_SETUP_TYPE = setuptools
 PYTHON_CANOPEN_LICENSE = MIT
 PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
