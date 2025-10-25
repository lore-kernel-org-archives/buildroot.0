Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C454CCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 21:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 593EF812E4;
	Sat, 25 Oct 2025 21:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IaOjX8cTvAhB; Sat, 25 Oct 2025 21:10:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C518812F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C518812F3;
	Sat, 25 Oct 2025 21:10:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D225976
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 21:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DC7D404CA
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 21:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPxMtp7i1tUm for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 21:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F17A84005A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F17A84005A
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 21:10:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF363878A1; Sat, 25 Oct 2025 21:10:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Oct 2025 22:36:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4016c78ea2fc7f0afb7281262c8661f26a61abb0
X-Git-Newrev: f683ffcbe1f92290c8df78be06379998f3cef689
X-Patchwork-Hint: ignore
Message-Id: <20251025211047.DF363878A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wrapt: bump to 2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f683ffcbe1f92290c8df78be06379998f3cef689
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE file changes due to copyright year update:
https://github.com/GrahamDumpleton/wrapt/commit/ad97a2aa802391e2cffd31b601801214436d7ddd

CHANGELOG: https://wrapt.readthedocs.io/en/latest/changes.html#version-2-0-0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-wrapt/python-wrapt.hash | 6 +++---
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index ae1fb94a2b..69a464ff49 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  5e7d9b1296ef5dc87339acc951a52d18  wrapt-1.17.3.tar.gz
-sha256  f66eb08feaa410fe4eebd17f2a2c8e2e46d3476e9f8c783daa8e09e0faa666d0  wrapt-1.17.3.tar.gz
+md5  bdc6d3460db4cdee3383dfe318b5c317  wrapt-2.0.0.tar.gz
+sha256  35a542cc7a962331d0279735c30995b024e852cf40481e384fd63caaa391cbb9  wrapt-2.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5974efbbc8b626b2050810d63c3a907ee21c92bf64b3740fc623ad05eb3448ab  LICENSE
+sha256  9abc41aa6b8690c07ede9b44b7c6233d014290ed1e3b5ccc37e292295b5d058f  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index d1871a7e2e..8fff0cf3fa 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 1.17.3
+PYTHON_WRAPT_VERSION = 2.0.0
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/95/8f/aeb76c5b46e273670962298c23e7ddde79916cb74db802131d49a85e4b7d
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/49/19/5e5bcd855d808892fe02d49219f97a50f64cd6d8313d75df3494ee97b1a3
 PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
