Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5A8CCD195
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0072D61306;
	Tue, 14 Oct 2025 18:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFCOlEP-UQwz; Tue, 14 Oct 2025 18:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E66D6131F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E66D6131F;
	Tue, 14 Oct 2025 18:46:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 114CC294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A50C612EB
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpTIlyx03AK7 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 627906130B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 627906130B
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 610BD870C5; Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:44:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 853e3609c148452e3daa66f301638d8474c138ef
X-Git-Newrev: b550f7145072d987960e16c670dc28518b9f517c
X-Patchwork-Hint: ignore
Message-Id: <20251014184551.610BD870C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-email-validator: bump
 version to 2.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b550f7145072d987960e16c670dc28518b9f517c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-email-validator/python-email-validator.hash | 4 ++--
 package/python-email-validator/python-email-validator.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-email-validator/python-email-validator.hash b/package/python-email-validator/python-email-validator.hash
index f7a7ed8a33..16fb9518f9 100644
--- a/package/python-email-validator/python-email-validator.hash
+++ b/package/python-email-validator/python-email-validator.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/email-validator/json
-md5  593073eca56ac1e947d47b9b314f2f11  email_validator-2.2.0.tar.gz
-sha256  cb690f344c617a714f22e66ae771445a1ceb46821152df8e165c5f9a364582b7  email_validator-2.2.0.tar.gz
+md5  379aa34f196a66e16c5c0dd0c2abb2da  email_validator-2.3.0.tar.gz
+sha256  9fc05c37f2f6cf439ff414f8fc46d917929974a82244c20eb10231ba60c54426  email_validator-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  672179752e109134a3fb2bdd0780b29fdb7a03974f0f586a13aead5129562d4c  LICENSE
diff --git a/package/python-email-validator/python-email-validator.mk b/package/python-email-validator/python-email-validator.mk
index 35881c13a3..e54387869b 100644
--- a/package/python-email-validator/python-email-validator.mk
+++ b/package/python-email-validator/python-email-validator.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EMAIL_VALIDATOR_VERSION = 2.2.0
+PYTHON_EMAIL_VALIDATOR_VERSION = 2.3.0
 PYTHON_EMAIL_VALIDATOR_SOURCE = email_validator-$(PYTHON_EMAIL_VALIDATOR_VERSION).tar.gz
-PYTHON_EMAIL_VALIDATOR_SITE = https://files.pythonhosted.org/packages/48/ce/13508a1ec3f8bb981ae4ca79ea40384becc868bfae97fd1c942bb3a001b1
+PYTHON_EMAIL_VALIDATOR_SITE = https://files.pythonhosted.org/packages/f5/22/900cb125c76b7aaa450ce02fd727f452243f2e91a61af068b40adba60ea9
 PYTHON_EMAIL_VALIDATOR_SETUP_TYPE = setuptools
 PYTHON_EMAIL_VALIDATOR_LICENSE = Unlicense
 PYTHON_EMAIL_VALIDATOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
