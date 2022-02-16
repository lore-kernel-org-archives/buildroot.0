Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFB2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 22:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 424C2409FC;
	Wed, 16 Feb 2022 22:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6f-gp5OPfZZ; Wed, 16 Feb 2022 22:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A4EE40157;
	Wed, 16 Feb 2022 22:19:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A65A1BF59C
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 22:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6731260B4B
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 22:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BowFGJgmeiCY for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 22:18:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0BDF60D94
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 22:18:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C2EC683787; Wed, 16 Feb 2022 22:11:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 23:18:26 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: c060023e10786641e7d9d9994ddc65ac88e756a2
X-Git-Newrev: 8d79accf96a135bef77875949a3e33e8c92a8033
X-Patchwork-Hint: ignore
Message-Id: <20220216221116.C2EC683787@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x]
 package/python-sqliteschema: bump to version 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d79accf96a135bef77875949a3e33e8c92a8033
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

https://github.com/thombashi/sqliteschema/releases/tag/v1.2.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5eff46a6c97203e7874edc931c4180f606f08275)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-sqliteschema/python-sqliteschema.hash | 4 ++--
 package/python-sqliteschema/python-sqliteschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqliteschema/python-sqliteschema.hash b/package/python-sqliteschema/python-sqliteschema.hash
index 310e56ab32..e60bd64325 100644
--- a/package/python-sqliteschema/python-sqliteschema.hash
+++ b/package/python-sqliteschema/python-sqliteschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqliteschema/json
-md5  ca70006e289f1d506124de779ed73d64  sqliteschema-1.2.0.tar.gz
-sha256  4c18f141239c58b6dbdc69130be41ed9740d8209a7ab6d529ba982a8b79c071a  sqliteschema-1.2.0.tar.gz
+md5  4fb0130e7cc60d92be468091fbfc3d51  sqliteschema-1.2.1.tar.gz
+sha256  dde195bd7bc70d5841bc01dff20ec23bd43be87d760d2dfc7c7f2e5fd3808ef3  sqliteschema-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-sqliteschema/python-sqliteschema.mk b/package/python-sqliteschema/python-sqliteschema.mk
index e4fd0de2fb..5c52e35111 100644
--- a/package/python-sqliteschema/python-sqliteschema.mk
+++ b/package/python-sqliteschema/python-sqliteschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLITESCHEMA_VERSION = 1.2.0
+PYTHON_SQLITESCHEMA_VERSION = 1.2.1
 PYTHON_SQLITESCHEMA_SOURCE = sqliteschema-$(PYTHON_SQLITESCHEMA_VERSION).tar.gz
-PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/5c/d3/0c2e4c989a8d45f9443e431d7cbf89af4aba719fb0647b5f722716ef3990
+PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/85/f8/be54d4bebf551cb533d1dea11c3bf165a1a408c2a1cceb1f9724aadd9967
 PYTHON_SQLITESCHEMA_SETUP_TYPE = setuptools
 PYTHON_SQLITESCHEMA_LICENSE = MIT
 PYTHON_SQLITESCHEMA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
