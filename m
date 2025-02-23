Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9978C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D6DA50901;
	Fri, 28 Feb 2025 17:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p60vcfoG7GrI; Fri, 28 Feb 2025 17:23:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB4F050053
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB4F050053;
	Fri, 28 Feb 2025 17:23:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 047B21DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D93447A19
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTt3FDIrGI1S for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D096C483C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D096C483C3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBE8D8017D; Fri, 28 Feb 2025 16:30:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Feb 2025 21:30:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ac83fdcb29f64af79839bb8efffbaae71f0cc3cc
X-Git-Newrev: 6faa08a9e3f3ad170b70439a14bf8da6256f887e
X-Patchwork-Hint: ignore
Message-Id: <20250228163047.CBE8D8017D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-dbus-fast: bump
 to 2.33.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6faa08a9e3f3ad170b70439a14bf8da6256f887e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See [1] for changelog.

[1] https://github.com/bluetooth-devices/dbus-fast/blob/main/CHANGELOG.md

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index f3d2c95a74..6b39f6ed1a 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  6473b4bf7e12412692d464482337b58d  dbus_fast-2.30.2.tar.gz
-sha256  87296315f4a2f2416d495f48cca019ba901d046989e94df2adda84c3170da7b3  dbus_fast-2.30.2.tar.gz
+md5  a87b903c08a6320b6b4aed9f6ee48376  dbus_fast-2.33.0.tar.gz
+sha256  da2f3a2f2e10092c67a911578135c2244d04b52ec87dda80997bf65e78f79251  dbus_fast-2.33.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 92e5b661a3..4e4964891d 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 2.30.2
+PYTHON_DBUS_FAST_VERSION = 2.33.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/69/4a/c5dbb4eccb97d3dd0ec49e04e17b7e93dfae517881ad439141fa6179cb53
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/7d/42/7a6537132dc63056509fb112517a6b5a591770df1a49892aaf90864bc7db
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
