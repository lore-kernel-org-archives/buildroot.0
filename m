Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCDDC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:24:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2874E61B40
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2874E61B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2A2340545;
	Sun,  3 Oct 2021 08:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEMhe9bKGe73; Sun,  3 Oct 2021 08:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1EFA40536;
	Sun,  3 Oct 2021 08:24:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABD221BF95A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5261848CD
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1SGN4T2Xglr6 for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEC318486A
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5BA638DB44; Sun,  3 Oct 2021 08:20:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 10:22:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 956058791cf26fc4c2401f2b5beefba0ce260be4
X-Git-Newrev: c2fd6d7a13ee6137786699b7583aefb3742fe337
X-Patchwork-Hint: ignore
Message-Id: <20211003082055.5BA638DB44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqliteschema: bump to
 version 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2fd6d7a13ee6137786699b7583aefb3742fe337
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-sqliteschema/python-sqliteschema.hash | 6 +++---
 package/python-sqliteschema/python-sqliteschema.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sqliteschema/python-sqliteschema.hash b/package/python-sqliteschema/python-sqliteschema.hash
index b25b0ae17a..310e56ab32 100644
--- a/package/python-sqliteschema/python-sqliteschema.hash
+++ b/package/python-sqliteschema/python-sqliteschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqliteschema/json
-md5	175afa008a628f6dc32392a72d4c6b74  sqliteschema-0.16.2.tar.gz
-sha256	023a443abdc12796928c04441fabbbe12e1fe8608f562b4650ae1f9a19504139  sqliteschema-0.16.2.tar.gz
+md5  ca70006e289f1d506124de779ed73d64  sqliteschema-1.2.0.tar.gz
+sha256  4c18f141239c58b6dbdc69130be41ed9740d8209a7ab6d529ba982a8b79c071a  sqliteschema-1.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256	7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
+sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-sqliteschema/python-sqliteschema.mk b/package/python-sqliteschema/python-sqliteschema.mk
index 890bfb9dc7..e4fd0de2fb 100644
--- a/package/python-sqliteschema/python-sqliteschema.mk
+++ b/package/python-sqliteschema/python-sqliteschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLITESCHEMA_VERSION = 0.16.2
+PYTHON_SQLITESCHEMA_VERSION = 1.2.0
 PYTHON_SQLITESCHEMA_SOURCE = sqliteschema-$(PYTHON_SQLITESCHEMA_VERSION).tar.gz
-PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/91/b6/87a9218d37afd061a8b26c0ec058299b85c3f859f1c80aff10752188e056
+PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/5c/d3/0c2e4c989a8d45f9443e431d7cbf89af4aba719fb0647b5f722716ef3990
 PYTHON_SQLITESCHEMA_SETUP_TYPE = setuptools
 PYTHON_SQLITESCHEMA_LICENSE = MIT
 PYTHON_SQLITESCHEMA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
