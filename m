Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D614C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 20:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C331860B10;
	Sat, 12 Feb 2022 20:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLFc-1guV06w; Sat, 12 Feb 2022 20:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B04360AD1;
	Sat, 12 Feb 2022 20:39:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 482561BF577
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3744B81457
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vH4zXXI_YMDe for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 20:39:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AC7681455
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 20:39:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DA02382470; Sat, 12 Feb 2022 20:31:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 21:38:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af0ea7d0372445fb315e739190fd98ecaf37c607
X-Git-Newrev: 37e49ce3e17cc1f434b05a9a431c716bd70dc540
X-Patchwork-Hint: ignore
Message-Id: <20220212203150.DA02382470@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-session: bump to
 version 2.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=37e49ce3e17cc1f434b05a9a431c716bd70dc540
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-aiohttp-session/python-aiohttp-session.hash | 4 ++--
 package/python-aiohttp-session/python-aiohttp-session.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-session/python-aiohttp-session.hash b/package/python-aiohttp-session/python-aiohttp-session.hash
index 3842f0c7af..8b44318307 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.hash
+++ b/package/python-aiohttp-session/python-aiohttp-session.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-session/json
-md5  d57d463a9db13b681f7924b38aa77f64  aiohttp-session-2.10.0.tar.gz
-sha256  2af19af9f435937baacbb6420f887b21e5021bb34be146c2702c58e6ebf6b76b  aiohttp-session-2.10.0.tar.gz
+md5  797273eb5f0ef9e95fa92c6a933cf4ad  aiohttp-session-2.11.0.tar.gz
+sha256  0fdf39600f6a05c4943ef6c7b099071ca9854413111a26761626244be5015dc4  aiohttp-session-2.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7bc5dd2f229a6b922befb1427fd4ad2c0b255f12c1b1869370ba77520dc22bc7  LICENSE
diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index a28b1ae143..3d59b75e3d 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SESSION_VERSION = 2.10.0
+PYTHON_AIOHTTP_SESSION_VERSION = 2.11.0
 PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp-session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
-PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/d6/3f/ab6288e8bbf4a9ae63ea0d3d5711bccc3a6dad1cb85a420c14fdeabc209e
+PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/3b/a7/0b97b9a2e3a553a86a6703f86b0e9b1afb2b262849700e8f80015c0f643f
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
