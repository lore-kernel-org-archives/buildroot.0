Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E64C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9FAF40173;
	Tue, 21 Feb 2023 00:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9FAF40173
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D74ayg7r-9nM; Tue, 21 Feb 2023 00:48:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950B44EEF6;
	Tue, 21 Feb 2023 00:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 950B44EEF6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A84CF1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ADE96FB85
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ADE96FB85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oiOuy78ccMsh for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A1986FB58
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A1986FB58
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43095828C8; Mon, 20 Feb 2023 20:52:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:00:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d31937ab88097a9ed3a34bf05fa07278abed77ae
X-Git-Newrev: f29c7f18d6267e65863aedb6d0c515cf8f9404f1
X-Patchwork-Hint: ignore
Message-Id: <20230220205234.43095828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-dbus-fast: bump
 to version 1.84.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f29c7f18d6267e65863aedb6d0c515cf8f9404f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index f0dceeb43d..e9a3992f8e 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  eebf2c558dd1af0f8f32b361e91f2fa3  dbus_fast-1.61.1.tar.gz
-sha256  bda4a7d559047b74f409eda278f68f610a418e86ad3efa0368fa2ed240daa6b6  dbus_fast-1.61.1.tar.gz
+md5  21e3675168e3dbe807c6c8a29267241f  dbus_fast-1.84.0.tar.gz
+sha256  d64f1b68c1c81268e846471caeb9264a9306a6c6ad356c30d5cdf7d1ecc251a1  dbus_fast-1.84.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index de7049ba22..9dd88f613f 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 1.61.1
+PYTHON_DBUS_FAST_VERSION = 1.84.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/dd/f4/a280d46b119d59f6a3d84abf474452ae76651558b0963ab8c48ae13b5a44
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/81/67/a83522d6692a72911c3586e2fcd2363ce22d1522a7e17e1012f255a6083b
 PYTHON_DBUS_FAST_SETUP_TYPE = setuptools
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
