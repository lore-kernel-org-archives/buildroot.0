Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D897CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CE70840EA;
	Sun, 22 Sep 2024 10:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZOkQwNP7zAr; Sun, 22 Sep 2024 10:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D4B7840EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D4B7840EE;
	Sun, 22 Sep 2024 10:37:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 467EE1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA75F40638
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7iKUzcrQt3X for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF74E40631
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF74E40631
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9DD88219F; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:31:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cc845756e3e5012bcb1b88bdf72dd14fbd361b7
X-Git-Newrev: c6804b486371c56e88be41d0b34dcb16abfbfe13
X-Patchwork-Hint: ignore
Message-Id: <20240922103442.A9DD88219F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zc-lockfile: bump to
 version 3.0.post1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6804b486371c56e88be41d0b34dcb16abfbfe13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-zc-lockfile/python-zc-lockfile.hash | 4 ++--
 package/python-zc-lockfile/python-zc-lockfile.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zc-lockfile/python-zc-lockfile.hash b/package/python-zc-lockfile/python-zc-lockfile.hash
index 181adda1bb..97f05ddd3f 100644
--- a/package/python-zc-lockfile/python-zc-lockfile.hash
+++ b/package/python-zc-lockfile/python-zc-lockfile.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zc.lockfile/json
-md5  3895445752278ddcc4578658c3c9a492  zc.lockfile-2.0.tar.gz
-sha256  307ad78227e48be260e64896ec8886edc7eae22d8ec53e4d528ab5537a83203b  zc.lockfile-2.0.tar.gz
+md5  5e902492de505a0f98e49b1e31cf2bc2  zc.lockfile-3.0.post1.tar.gz
+sha256  adb2ee6d9e6a2333c91178dcb2c9b96a5744c78edb7712dc784a7d75648e81ec  zc.lockfile-3.0.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zc-lockfile/python-zc-lockfile.mk b/package/python-zc-lockfile/python-zc-lockfile.mk
index a4621e6d06..60648afc29 100644
--- a/package/python-zc-lockfile/python-zc-lockfile.mk
+++ b/package/python-zc-lockfile/python-zc-lockfile.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZC_LOCKFILE_VERSION = 2.0
+PYTHON_ZC_LOCKFILE_VERSION = 3.0.post1
 PYTHON_ZC_LOCKFILE_SOURCE = zc.lockfile-$(PYTHON_ZC_LOCKFILE_VERSION).tar.gz
-PYTHON_ZC_LOCKFILE_SITE = https://files.pythonhosted.org/packages/11/98/f21922d501ab29d62665e7460c94f5ed485fd9d8348c126697947643a881
+PYTHON_ZC_LOCKFILE_SITE = https://files.pythonhosted.org/packages/5b/83/a5432aa08312fc834ea594473385c005525e6a80d768a2ad246e78877afd
 PYTHON_ZC_LOCKFILE_SETUP_TYPE = setuptools
 PYTHON_ZC_LOCKFILE_LICENSE = ZPL-2.1
 PYTHON_ZC_LOCKFILE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
