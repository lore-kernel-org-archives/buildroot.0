Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9E3C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47177401FB;
	Mon,  5 Dec 2022 11:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47177401FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p6WyeO0_86ro; Mon,  5 Dec 2022 11:48:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE8340202;
	Mon,  5 Dec 2022 11:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE8340202
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F5CE1BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8318941615
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8318941615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mzqtjj3eD1fp for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DFC44161A
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DFC44161A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5671B85BA2; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbb859d66ba5249b3cfef1c3821683054cdce8cd
X-Git-Newrev: 0af5cbd4bee578444fa1320a72d045149ab0f897
X-Patchwork-Hint: ignore
Message-Id: <20221205112605.5671B85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-semantic-version: bump to
 version 2.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0af5cbd4bee578444fa1320a72d045149ab0f897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-semantic-version/python-semantic-version.hash | 4 ++--
 package/python-semantic-version/python-semantic-version.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-semantic-version/python-semantic-version.hash b/package/python-semantic-version/python-semantic-version.hash
index 692905ec29..49e28c429a 100644
--- a/package/python-semantic-version/python-semantic-version.hash
+++ b/package/python-semantic-version/python-semantic-version.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/semantic-version/json
-md5  76d7364def7ee487b6153d40b13de904  semantic_version-2.8.5.tar.gz
-sha256  d2cb2de0558762934679b9a104e82eca7af448c9f4974d1f3eeccff651df8a54  semantic_version-2.8.5.tar.gz
+md5  e48abef93ba69abcd4eaf4640edfc38b  semantic_version-2.10.0.tar.gz
+sha256  bdabb6d336998cbb378d4b9db3a4b56a1e3235701dc05ea2690d9a997ed5041c  semantic_version-2.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a85e7ef2fbc670d26781ed6844cd31a7e8ada65d21328f75a0b02402faae37ea  LICENSE
diff --git a/package/python-semantic-version/python-semantic-version.mk b/package/python-semantic-version/python-semantic-version.mk
index 2352690e26..76a65e734f 100644
--- a/package/python-semantic-version/python-semantic-version.mk
+++ b/package/python-semantic-version/python-semantic-version.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEMANTIC_VERSION_VERSION = 2.8.5
+PYTHON_SEMANTIC_VERSION_VERSION = 2.10.0
 PYTHON_SEMANTIC_VERSION_SOURCE = semantic_version-$(PYTHON_SEMANTIC_VERSION_VERSION).tar.gz
-PYTHON_SEMANTIC_VERSION_SITE = https://files.pythonhosted.org/packages/d4/52/3be868c7ed1f408cb822bc92ce17ffe4e97d11c42caafce0589f05844dd0
+PYTHON_SEMANTIC_VERSION_SITE = https://files.pythonhosted.org/packages/7d/31/f2289ce78b9b473d582568c234e104d2a342fd658cc288a7553d83bb8595
 PYTHON_SEMANTIC_VERSION_SETUP_TYPE = setuptools
 PYTHON_SEMANTIC_VERSION_LICENSE = BSD-2-Clause
 PYTHON_SEMANTIC_VERSION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
