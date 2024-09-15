Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B74C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 213E081E41;
	Sun, 15 Sep 2024 21:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oi6046OzrTDO; Sun, 15 Sep 2024 21:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FF5784544
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF5784544;
	Sun, 15 Sep 2024 21:39:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57C7C1BF94D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 899AF40A11
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6pCBft4Xh1uv for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5460040A0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5460040A0B
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 503F983683; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33ecf0db825f84e5dadfac806c13dc7c3479d1a8
X-Git-Newrev: 0b779eb980c5bc47e725ccfd404b43ffd59d9e7a
X-Patchwork-Hint: ignore
Message-Id: <20240915213639.503F983683@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-email-validator: bump to
 version 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b779eb980c5bc47e725ccfd404b43ffd59d9e7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-email-validator/python-email-validator.hash | 4 ++--
 package/python-email-validator/python-email-validator.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-email-validator/python-email-validator.hash b/package/python-email-validator/python-email-validator.hash
index 4342f8d91b..f7a7ed8a33 100644
--- a/package/python-email-validator/python-email-validator.hash
+++ b/package/python-email-validator/python-email-validator.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/email-validator/json
-md5  a836759afeb7efdc5d493fbdf8a1bae6  email_validator-2.1.1.tar.gz
-sha256  200a70680ba08904be6d1eef729205cc0d687634399a5924d842533efb824b84  email_validator-2.1.1.tar.gz
+md5  593073eca56ac1e947d47b9b314f2f11  email_validator-2.2.0.tar.gz
+sha256  cb690f344c617a714f22e66ae771445a1ceb46821152df8e165c5f9a364582b7  email_validator-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  672179752e109134a3fb2bdd0780b29fdb7a03974f0f586a13aead5129562d4c  LICENSE
diff --git a/package/python-email-validator/python-email-validator.mk b/package/python-email-validator/python-email-validator.mk
index 8d82eb092f..35881c13a3 100644
--- a/package/python-email-validator/python-email-validator.mk
+++ b/package/python-email-validator/python-email-validator.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EMAIL_VALIDATOR_VERSION = 2.1.1
+PYTHON_EMAIL_VALIDATOR_VERSION = 2.2.0
 PYTHON_EMAIL_VALIDATOR_SOURCE = email_validator-$(PYTHON_EMAIL_VALIDATOR_VERSION).tar.gz
-PYTHON_EMAIL_VALIDATOR_SITE = https://files.pythonhosted.org/packages/63/82/2914bff80ebee8c027802a664ad4b4caad502cd594e358f76aff395b5e56
+PYTHON_EMAIL_VALIDATOR_SITE = https://files.pythonhosted.org/packages/48/ce/13508a1ec3f8bb981ae4ca79ea40384becc868bfae97fd1c942bb3a001b1
 PYTHON_EMAIL_VALIDATOR_SETUP_TYPE = setuptools
 PYTHON_EMAIL_VALIDATOR_LICENSE = Unlicense
 PYTHON_EMAIL_VALIDATOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
