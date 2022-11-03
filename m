Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A075EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5033B61077;
	Thu,  3 Nov 2022 21:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5033B61077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTCkcB2cm7nL; Thu,  3 Nov 2022 21:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 747066106C;
	Thu,  3 Nov 2022 21:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 747066106C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 77C281BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BD6840BEB
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BD6840BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJUKbVgZGjGo for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A318D40C12
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A318D40C12
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FBF387BCC; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 95702e627051b99c9911196841a584c461583c2d
X-Git-Newrev: aef5c2d3b6bf9aabe543495a9ad33de7ddf58812
X-Patchwork-Hint: ignore
Message-Id: <20221103205513.9FBF387BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pylibftdi: bump
 to version 0.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=aef5c2d3b6bf9aabe543495a9ad33de7ddf58812
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to date update:
https://github.com/codedstructure/pylibftdi/commit/4662ebe069eefd5a89709d4165e3be808cad636c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pylibftdi/python-pylibftdi.hash | 6 +++---
 package/python-pylibftdi/python-pylibftdi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index 5570c1c9f6..ee0ba127ca 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5  c48e442cef7b1e865b4d96ab92f509ad  pylibftdi-0.18.1.tar.gz
-sha256  bdd04076933959b20b3c8b4fb8be7882d3362675f259e7eeb23ebff03b81859d  pylibftdi-0.18.1.tar.gz
+md5  fb43ade3283b809d4ebe92bf4a60d7fc  pylibftdi-0.20.0.tar.gz
+sha256  f4a87fc4af2c9c7d42badd4192ca9b529f32c9d96fdc8daea7e29c509226df5f  pylibftdi-0.20.0.tar.gz
 # Locally computed sha256 checksums
-sha256  0e40132339e1ef7d17d93837fbc273d1e87302e9295162bd19c9161e5700ddcc  LICENSE.txt
+sha256  0d3f1af06b566a783091422061b60e864fc5d5853418b71643041e254b4ae7f9  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 2f5614867d..34040b72ac 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.18.1
+PYTHON_PYLIBFTDI_VERSION = 0.20.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/50/9b/1e1cdb9715bacfb83e5eaf5e69f4e2fbd92d61f43c5e185cc3935ec01b28
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/b8/03/4f778ce6dceea58dc5bfd555c22fdb265afc922d81d3c4496a791a54c479
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_DEPENDENCIES = libftdi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
