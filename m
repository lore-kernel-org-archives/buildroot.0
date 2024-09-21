Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0877ECF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6070607C3;
	Sat, 21 Sep 2024 21:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSP9n3zxM48U; Sat, 21 Sep 2024 21:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 172976077B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 172976077B;
	Sat, 21 Sep 2024 21:08:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FD701BF869
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2222F404D4
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6so1h_GiN5zW for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE3D8403C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE3D8403C3
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAB43835FF; Sat, 21 Sep 2024 21:07:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:52:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f34b6153194271dd442ad2be6f1b2b7d6c82d56
X-Git-Newrev: 687fb917378bfb1102107114d24809f84253a337
X-Patchwork-Hint: ignore
Message-Id: <20240921210741.BAB43835FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pefile: bump to version
 2024.8.26
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

commit: https://git.buildroot.net/buildroot/commit/?id=687fb917378bfb1102107114d24809f84253a337
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date update:
https://github.com/erocarrera/pefile/commit/4b3b1e2e568a88d4f1897d694d684f23d9e270c4

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pefile/python-pefile.hash | 6 +++---
 package/python-pefile/python-pefile.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pefile/python-pefile.hash b/package/python-pefile/python-pefile.hash
index af2288487d..2174b7afd2 100644
--- a/package/python-pefile/python-pefile.hash
+++ b/package/python-pefile/python-pefile.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pefile/json
-md5  fa0eba7c91f4e696771ddbfacdca25e4  pefile-2023.2.7.tar.gz
-sha256  82e6114004b3d6911c77c3953e3838654b04511b8b66e8583db70c65998017dc  pefile-2023.2.7.tar.gz
+md5  f511b370db4c80137aadf457a905fa53  pefile-2024.8.26.tar.gz
+sha256  3ff6c5d8b43e8c37bb6e6dd5085658d658a7a0bdcd20b6a07b1fcfc1c4e9d632  pefile-2024.8.26.tar.gz
 # Locally computed sha256 checksums
-sha256  bfd4b5e4f8a99c961fd6f94d708e38396cc146bfe8fbc5d2a86e63aa29fb4208  LICENSE
+sha256  b44409c067c6da52bfb54bb6624fb11a7b52157c3a13ae1400232f8196e86ad3  LICENSE
diff --git a/package/python-pefile/python-pefile.mk b/package/python-pefile/python-pefile.mk
index c65f1deb60..e04db7a116 100644
--- a/package/python-pefile/python-pefile.mk
+++ b/package/python-pefile/python-pefile.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PEFILE_VERSION = 2023.2.7
+PYTHON_PEFILE_VERSION = 2024.8.26
 PYTHON_PEFILE_SOURCE = pefile-$(PYTHON_PEFILE_VERSION).tar.gz
-PYTHON_PEFILE_SITE = https://files.pythonhosted.org/packages/78/c5/3b3c62223f72e2360737fd2a57c30e5b2adecd85e70276879609a7403334
+PYTHON_PEFILE_SITE = https://files.pythonhosted.org/packages/03/4f/2750f7f6f025a1507cd3b7218691671eecfd0bbebebe8b39aa0fe1d360b8
 PYTHON_PEFILE_SETUP_TYPE = setuptools
 PYTHON_PEFILE_LICENSE = MIT
 PYTHON_PEFILE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
