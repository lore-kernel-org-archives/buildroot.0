Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553EDCF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 251AD8412B;
	Sun, 22 Sep 2024 10:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_PdMSZDSOik; Sun, 22 Sep 2024 10:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF55A8436B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF55A8436B;
	Sun, 22 Sep 2024 10:37:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF6201BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC43740654
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9gw8S_g6yVn for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A9134064E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A9134064E
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8667C811F3; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:31:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b2af895a50245e4e66556c2b34769f0b80ba05a
X-Git-Newrev: 01255066f8909124002d4a3b05a8f01a44fde4bd
X-Patchwork-Hint: ignore
Message-Id: <20240922103442.8667C811F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xlib: bump to version 0.33
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

commit: https://git.buildroot.net/buildroot/commit/?id=01255066f8909124002d4a3b05a8f01a44fde4bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to formatting changes:
https://github.com/python-xlib/python-xlib/commit/b04e96a39b8ae0b82c52d0385d1edc1d8f96cb6a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-xlib/python-xlib.hash | 6 +++---
 package/python-xlib/python-xlib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlib/python-xlib.hash b/package/python-xlib/python-xlib.hash
index 066f450416..f516d7b4c4 100644
--- a/package/python-xlib/python-xlib.hash
+++ b/package/python-xlib/python-xlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-xlib/json
-md5  ba31623fb64a1e5a0b1ae1f6495c3bf6  python-xlib-0.32.tar.gz
-sha256  20e1382f8a98d8ed0facfa45415c46fd0c8eeb6f9996e58c22d3382a4ed6e37b  python-xlib-0.32.tar.gz
+md5  20a687ac84ee632aea9b9861206aa0eb  python-xlib-0.33.tar.gz
+sha256  55af7906a2c75ce6cb280a584776080602444f75815a7aff4d287bb2d7018b32  python-xlib-0.33.tar.gz
 # Locally computed sha256 checksums
-sha256  06eb1c441443cf15ac84f309003f4c43c62246939d37c75fc3e056c2d34cd300  LICENSE
+sha256  3bb6f6bec94b99e2927a8880bf49c401f5e8f48a20ddea96310860264cae20b0  LICENSE
diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
index 32f16e5d66..23c7b39974 100644
--- a/package/python-xlib/python-xlib.mk
+++ b/package/python-xlib/python-xlib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_XLIB_VERSION = 0.32
-PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/4d/cf/a29ecb43a5c84a65ffd726e3b28806f56b3bc5e796ddb533ff52af107dcf
+PYTHON_XLIB_VERSION = 0.33
+PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/86/f5/8c0653e5bb54e0cbdfe27bf32d41f27bc4e12faa8742778c17f2a71be2c0
 PYTHON_XLIB_SETUP_TYPE = setuptools
 PYTHON_XLIB_LICENSE = LGPL-2.1+
 PYTHON_XLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
