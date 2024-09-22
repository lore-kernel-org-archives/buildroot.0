Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE979CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC7FC8183D;
	Sun, 22 Sep 2024 10:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bcnRpokX4vt; Sun, 22 Sep 2024 10:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D15B81A5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D15B81A5F;
	Sun, 22 Sep 2024 10:35:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF7861BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05FC3606F0
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2acUfnDOss0e for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D116606D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D116606D5
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 186DD8230F; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:30:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d55a14085a3120fd668bce6450e6235554ecedf3
X-Git-Newrev: 432cb5cd0ea64e499b253e1ccba6d93f167a5e0a
X-Patchwork-Hint: ignore
Message-Id: <20240922103442.186DD8230F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-validators: bump to version
 0.34.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=432cb5cd0ea64e499b253e1ccba6d93f167a5e0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/python-validators/validators/commit/1f5f499a3e1f1fdf1aff0a507c49f8a0e24bf816

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-validators/python-validators.hash | 6 +++---
 package/python-validators/python-validators.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
index 3682850cb3..e60f540f7d 100644
--- a/package/python-validators/python-validators.hash
+++ b/package/python-validators/python-validators.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/validators/json
-md5  e7b36d935ebafe149629146cbfe5b0c8  validators-0.22.0.tar.gz
-sha256  77b2689b172eeeb600d9605ab86194641670cdb73b60afd577142a9397873370  validators-0.22.0.tar.gz
+md5  8cae932ff53da1607ed2ca354a93ba54  validators-0.34.0.tar.gz
+sha256  647fe407b45af9a74d245b943b18e6a816acf4926974278f6dd617778e1e781f  validators-0.34.0.tar.gz
 # Locally computed sha256 checksums
-sha256  7c1bdc4712afecb46d402ec79da0ea2877811711e76dbaf1e425ee0b0e331b1f  LICENSE
+sha256  9d10adf59f4505a733162ff7de6887645dcef1fb495b8070d8b207da0f6b3a16  LICENSE.txt
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index 09ccbe6ab7..7db6d98546 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_VALIDATORS_VERSION = 0.22.0
+PYTHON_VALIDATORS_VERSION = 0.34.0
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/9b/21/40a249498eee5a244a017582c06c0af01851179e2617928063a3d628bc8f
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/64/07/91582d69320f6f6daaf2d8072608a4ad8884683d4840e7e4f3a9dbdcc639
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = MIT
-PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
+PYTHON_VALIDATORS_LICENSE_FILES = LICENSE.txt
 PYTHON_VALIDATORS_CPE_ID_VENDOR = validators_project
 PYTHON_VALIDATORS_CPE_ID_PRODUCT = validators
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
