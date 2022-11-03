Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F37AC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE8A640BDD;
	Thu,  3 Nov 2022 21:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE8A640BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcpF0nSuGEl8; Thu,  3 Nov 2022 21:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 251FD40BC6;
	Thu,  3 Nov 2022 21:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 251FD40BC6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 254451BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6513140C32
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6513140C32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qG9OlMOrk8Z for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DF0B40BE3
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DF0B40BE3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C59487BCE; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d680db0ba77dab0ab28734d2d596e44aafeb525c
X-Git-Newrev: 8d6ae5dae91367b3bfd6e1ed441eb954966684f4
X-Patchwork-Hint: ignore
Message-Id: <20221103205511.5C59487BCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-docutils: bump
 to version 0.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d6ae5dae91367b3bfd6e1ed441eb954966684f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to url update:
https://sourceforge.net/p/docutils/code/8959/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-docutils/python-docutils.hash | 9 +++++----
 package/python-docutils/python-docutils.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index f5e0b82db8..6a36f362e9 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/docutils/json, sha256 locally computed
-md5  ca5827e2432fd58f4c8d74a6591135de  docutils-0.18.1.tar.gz
-sha256  679987caf361a7539d76e584cbeddc311e3aee937877c87346f31debc63e9d06  docutils-0.18.1.tar.gz
-sha256  f20172170ef9aeebbf53adf5d8f7d309f7dc6068e9a3a1b52ea772305686739d  COPYING.txt
+# md5, sha256 from https://pypi.org/pypi/docutils/json
+md5  0afa992a6e93db892107c3f087d0d9df  docutils-0.19.tar.gz
+sha256  33995a6753c30b7f577febfc2c50411fec6aac7f7ffeb7c4cfe5991072dcf9e6  docutils-0.19.tar.gz
+# Locally computed sha256 checksums
+sha256  16b78bd9994588326a871ac39f64480969ebeb57ecd46a31874744560e72390a  COPYING.txt
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 39a570f5a1..d06521d10f 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.18.1
+PYTHON_DOCUTILS_VERSION = 0.19
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/57/b1/b880503681ea1b64df05106fc7e3c4e3801736cf63deffc6fa7fc5404cf5
+PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/6b/5c/330ea8d383eb2ce973df34d1239b3b21e91cd8c865d21ff82902d952f91f
 PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, Python-2.0, GPL-3.0+ (emacs mode)
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
 PYTHON_DOCUTILS_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
