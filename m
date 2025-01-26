Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9095C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C37E857DD;
	Fri, 28 Feb 2025 17:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dO1ViafmlgA; Fri, 28 Feb 2025 17:05:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96C4C857DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96C4C857DE;
	Fri, 28 Feb 2025 17:05:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F6B31DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3654642EBA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdqrPBXyDCXJ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5625142EC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5625142EC6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E9DB87A09; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 20:55:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9dce30cf6a8914dc6ad9122376be5cf741452981
X-Git-Newrev: 455ef44d26f027abc1936ba9041427a4b2e86f42
X-Patchwork-Hint: ignore
Message-Id: <20250228163021.4E9DB87A09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-evdev: bump to
 version 1.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=455ef44d26f027abc1936ba9041427a4b2e86f42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to date update:
https://github.com/gvalkov/python-evdev/commit/2e3b843f37f79a9404da4541bbf9cf96dc5a4d57

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-evdev/python-evdev.hash | 6 +++---
 package/python-evdev/python-evdev.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-evdev/python-evdev.hash b/package/python-evdev/python-evdev.hash
index afa74c792b..d31e236989 100644
--- a/package/python-evdev/python-evdev.hash
+++ b/package/python-evdev/python-evdev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/evdev/json
-md5  c20a623d2d05fd87c1f46d736ee9c3cc  evdev-1.7.1.tar.gz
-sha256  0c72c370bda29d857e188d931019c32651a9c1ea977c08c8d939b1ced1637fde  evdev-1.7.1.tar.gz
+md5  a38ac9e2297940430bb27cea41be964e  evdev-1.8.0.tar.gz
+sha256  45598eee1ae3876a3122ca1dc0ec8049c01931672d12478b5c610afc24e47d75  evdev-1.8.0.tar.gz
 # Locally computed sha256 checksums
-sha256  55fd76d7b3f90d312f161d318631b93c58a0e69d662d07c4f5aca2c6c9ecc85e  LICENSE
+sha256  d4554960d6496150c88c1fd02d7973121a9a57b961ea58fe349fbf8ada3816b2  LICENSE
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
index 269b290dca..f465aff933 100644
--- a/package/python-evdev/python-evdev.mk
+++ b/package/python-evdev/python-evdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EVDEV_VERSION = 1.7.1
+PYTHON_EVDEV_VERSION = 1.8.0
 PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
-PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/12/bb/f622a8a5e64d46ca83020a761877c0ead19140903c9aaf1431f3c531fdf6
+PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/4c/eb/b8900082a13a47bb9f69f415174d03cbf12ce95d07345722e1f4ef0e2093
 PYTHON_EVDEV_SETUP_TYPE = setuptools
 PYTHON_EVDEV_LICENSE = Revised BSD License
 PYTHON_EVDEV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
