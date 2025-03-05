Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42B1C282EC
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 22:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD0596073C;
	Wed,  5 Mar 2025 22:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4aRQnJw3cYNz; Wed,  5 Mar 2025 22:04:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADEB860EDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADEB860EDB;
	Wed,  5 Mar 2025 22:04:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F49DE2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 22:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5D2280B9F
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 22:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1m8sImorW_Fg for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 22:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2742880B98
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2742880B98
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 22:04:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10E0D87E91; Wed,  5 Mar 2025 22:04:26 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Mar 2025 22:56:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7a0725723b80ebf5fb0984410f7b4b665f9ee49d
X-Git-Newrev: 2a33198c47aa1d9567b29ea751406504fb6b30d6
X-Patchwork-Hint: ignore
Message-Id: <20250305220426.10E0D87E91@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-dbus-fast: bump
 to 2.34.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2a33198c47aa1d9567b29ea751406504fb6b30d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See [1] for changelog.

[1] https://github.com/Bluetooth-Devices/dbus-fast/blob/v2.34.0/CHANGELOG.md

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
[Julien: update changelog link on 2.34.0 tag]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 6b39f6ed1a..40b09eff0a 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  a87b903c08a6320b6b4aed9f6ee48376  dbus_fast-2.33.0.tar.gz
-sha256  da2f3a2f2e10092c67a911578135c2244d04b52ec87dda80997bf65e78f79251  dbus_fast-2.33.0.tar.gz
+md5  b8c9e11eb30efee1a5832bb606264e45  dbus_fast-2.34.0.tar.gz
+sha256  32aa03b4b102e7ad8caf39c708e3c263ef73121a4bb64f3f877c5cf0bad91e45  dbus_fast-2.34.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 4e4964891d..c2dccd073c 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 2.33.0
+PYTHON_DBUS_FAST_VERSION = 2.34.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/7d/42/7a6537132dc63056509fb112517a6b5a591770df1a49892aaf90864bc7db
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/0c/bc/a124a2bcd99063bd07e035b8d82437f152334a459c2497d06f77963f7b95
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
