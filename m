Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E40CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 16:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B83FF60706;
	Sun, 22 Sep 2024 16:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRYC0NF1em0z; Sun, 22 Sep 2024 16:23:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4D8060716
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D8060716;
	Sun, 22 Sep 2024 16:23:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2447D1BF403
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DC8A60706
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WILrVimcWiwu for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 16:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E246F60657
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E246F60657
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 16:23:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0CDC84295; Sun, 22 Sep 2024 16:23:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 18:04:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dcf632f10477938c0c63030a2996d0bdf62d430b
X-Git-Newrev: e2cbac15053b66be76dd99e49fedffeb11b974e0
X-Patchwork-Hint: ignore
Message-Id: <20240922162313.D0CDC84295@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-greenlet: bump to version
 3.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2cbac15053b66be76dd99e49fedffeb11b974e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-greenlet/python-greenlet.hash | 4 ++--
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index 59be4fbff9..7ed4ff13a3 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  9ff064be5bce917f9a60b609ca65f54b  greenlet-3.1.0.tar.gz
-sha256  b395121e9bbe8d02a750886f108d540abe66075e61e22f7353d9acb0b81be0f0  greenlet-3.1.0.tar.gz
+md5  13a71396abdf249280fa25d258acf435  greenlet-3.1.1.tar.gz
+sha256  4ce3ac6cdb6adf7946475d7ef31777c26d94bccc377e070a7986bd2d5c515467  greenlet-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 6e041d5ffe..5575ddaff5 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 3.1.0
+PYTHON_GREENLET_VERSION = 3.1.1
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/65/1b/3d91623c3eff61c11799e7f3d6c01f6bfa9bd2d1f0181116fd0b9b108a40
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/2f/ff/df5fede753cc10f6a5be0931204ea30c35fa2f2ea7a35b25bdaf4fe40e46
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
