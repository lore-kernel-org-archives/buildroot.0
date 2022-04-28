Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEB7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95C5283F18;
	Thu, 28 Apr 2022 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0C_CUQx372uO; Thu, 28 Apr 2022 21:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ABC383F12;
	Thu, 28 Apr 2022 21:10:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 356F21BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB4BA41BF3
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YoWx1IzK7xh6 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:09:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70F3D41BE6
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:09:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4C98D846A0; Thu, 28 Apr 2022 20:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 23:00:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 678d92b5a7716989b15e963bf2ad0f1f29810262
X-Git-Newrev: 61e525780d2b684799c48aeb3455c6394d3a7fb6
X-Patchwork-Hint: ignore
Message-Id: <20220428205845.4C98D846A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-extensions: bump to
 version 4.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=61e525780d2b684799c48aeb3455c6394d3a7fb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package now requires the flit setup type.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-typing-extensions/python-typing-extensions.hash | 4 ++--
 package/python-typing-extensions/python-typing-extensions.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index abaac77d34..f37a609adc 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing_extensions/json
-md5  ed80ecc8eac5cb15840535ca54eb43f3  typing_extensions-3.10.0.2.tar.gz
-sha256  49f75d16ff11f1cd258e1b988ccff82a3ca5570217d7ad8c5f48205dd99a677e  typing_extensions-3.10.0.2.tar.gz
+md5  197fb153e3720a3f6e0c85bb47f9c2b5  typing_extensions-4.2.0.tar.gz
+sha256  f1c24655a0da0d1b67f07e17a5e6b2a105894e6824b92096378bb3668ef02376  typing_extensions-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index 668071e025..a664e5d3e9 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 3.10.0.2
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.2.0
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/ed/12/c5079a15cf5c01d7f4252b473b00f7e68ee711be605b9f001528f0298b98
-PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = setuptools
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/fe/71/1df93bd59163c8084d812d166c907639646e8aac72886d563851b966bf18
+PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
