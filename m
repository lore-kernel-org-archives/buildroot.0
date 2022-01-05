Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B3CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 09:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6E4C408D3;
	Wed,  5 Jan 2022 09:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MRXUtwg5Safy; Wed,  5 Jan 2022 09:33:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D965F408C8;
	Wed,  5 Jan 2022 09:33:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F7D61BF390
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 09:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 211E082C91
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 09:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8_fxwyjTDSe for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 09:32:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7682B82CB7
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 09:32:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 619A4832C8; Wed,  5 Jan 2022 09:26:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Jan 2022 10:32:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6282553e764939bbe665fd0bafc46eca31dff51b
X-Git-Newrev: 9a478b17ae4c67b7d9282daf3db3af6b7917587c
X-Patchwork-Hint: ignore
Message-Id: <20220105092630.619A4832C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/selinux-python: bump to version 3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a478b17ae4c67b7d9282daf3db3af6b7917587c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/SELinuxProject/selinux/releases/tag/3.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/selinux-python/selinux-python.hash | 4 ++--
 package/selinux-python/selinux-python.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 00c28b722c..6ada3fee36 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 770855ea8120ef23007fdb9db94b1ed6e8cd77917b584ed8877bbee9c16e74fb selinux-python-3.2.tar.gz
+sha256  8ad91061300387996ccb474962fb93dde263d924aa8f740618be16b22e2444ec  selinux-python-3.3.tar.gz
 
 # Hash for license file
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 61ec7eb595..0cec602f3d 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 3.2
+SELINUX_PYTHON_VERSION = 3.3
 SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
