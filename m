Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A748FC678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 21:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 257E760F88;
	Sat,  4 Mar 2023 21:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 257E760F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LsOtIQ_AFJXI; Sat,  4 Mar 2023 21:57:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B26960F7B;
	Sat,  4 Mar 2023 21:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B26960F7B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C66301BF859
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 21:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A02B660F7B
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 21:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A02B660F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CNF5LFbz8s4l for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 21:56:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 928C060F78
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 21:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 928C060F78
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E4EE861A3; Sat,  4 Mar 2023 21:56:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 22:56:15 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: fd0e9ac8e83ec0ce552f9fa3409b56cd8571635b
X-Git-Newrev: d9a2d19b53774d42418df21e9f3bcc4f06f21873
X-Patchwork-Hint: ignore
Message-Id: <20230304215656.7E4EE861A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 package/python-cryptography: bump to version 38.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9a2d19b53774d42418df21e9f3bcc4f06f21873
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2fe854e9fccefb10091e8df0fb3152815c47c79d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 0f6a62164b..40d217f666 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  59f77beef181a9e6643ad2c10b8c6551fc561452287bd3552bec76c86d55b774  cryptography-38.0.1.tar.gz
+sha256  cd0b4536eabc6fcb80aa03430fc2ca485d33249eea0cd23f76c1dd9da410c66c  cryptography-38.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index c0265f5bfa..69eb90d795 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 38.0.1
+PYTHON_CRYPTOGRAPHY_VERSION = 38.0.3
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/6d/0c/5e67831007ba6cd7e52c4095f053cf45c357739b0a7c46a45ddd50049019
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/13/dd/a9608b7aebe5d2dc0c98a4b2090a6b815628efa46cc1c046b89d8cd25f4c
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
