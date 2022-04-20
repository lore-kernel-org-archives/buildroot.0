Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2D8C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 20:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 088D441934;
	Wed, 20 Apr 2022 20:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cf6AFy0UnADi; Wed, 20 Apr 2022 20:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC1E741889;
	Wed, 20 Apr 2022 20:42:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11D971BF2A5
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EE4C82CFA
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01nA-ZGrTEUm for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 20:42:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6241F82C33
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 20:42:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6AF4183F54; Wed, 20 Apr 2022 20:32:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 22:37:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbc318be1721990784497821dc4ecc7aea8c848e
X-Git-Newrev: 3f18f7f2d9e44d3d62582d9db32d909cb8074881
X-Patchwork-Hint: ignore
Message-Id: <20220420203211.6AF4183F54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bidict: bump to version
 0.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f18f7f2d9e44d3d62582d9db32d909cb8074881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to adding dates/author name:
https://github.com/jab/bidict/commit/b5c9f346ce0e3450a9df41c8740c32ed8b62f7f3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-bidict/python-bidict.hash | 6 +++---
 package/python-bidict/python-bidict.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bidict/python-bidict.hash b/package/python-bidict/python-bidict.hash
index 59229f96d9..fe9a94af53 100644
--- a/package/python-bidict/python-bidict.hash
+++ b/package/python-bidict/python-bidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bidict/json
-md5  d9342771969dd0d42092a669ed6f3241  bidict-0.21.3.tar.gz
-sha256  d50bd81fae75e34198ffc94979a0eb0939ff9adb3ef32bcc93a913d8b3e3ed1d  bidict-0.21.3.tar.gz
+md5  da3d37ae93c740c191b5666918c3164f  bidict-0.22.0.tar.gz
+sha256  5c826b3e15e97cc6e615de295756847c282a79b79c5430d3bfc909b1ac9f5bd8  bidict-0.22.0.tar.gz
 # Locally computed sha256 checksums
-sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  LICENSE
+sha256  be0487398bba08e7772b4077b637787b94973b53c44b3cbdd6c7dab10ed15035  LICENSE
diff --git a/package/python-bidict/python-bidict.mk b/package/python-bidict/python-bidict.mk
index c6b7b862ea..7ba15db605 100644
--- a/package/python-bidict/python-bidict.mk
+++ b/package/python-bidict/python-bidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BIDICT_VERSION = 0.21.3
+PYTHON_BIDICT_VERSION = 0.22.0
 PYTHON_BIDICT_SOURCE = bidict-$(PYTHON_BIDICT_VERSION).tar.gz
-PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/3f/81/7221b28d692af5c5fc180c4850b8e4a48c7db92b3d529b430488f67db74f
+PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/2b/84/159749556b9c49ea4489dadeb94d44f05d6033d1db3af4c83120ecac5b15
 PYTHON_BIDICT_SETUP_TYPE = setuptools
 PYTHON_BIDICT_LICENSE = MPL-2.0
 PYTHON_BIDICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
