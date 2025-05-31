Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E861C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BC1A61769;
	Thu, 12 Jun 2025 08:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rChqOr2A9LnH; Thu, 12 Jun 2025 08:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98FCB61746
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98FCB61746;
	Thu, 12 Jun 2025 08:40:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BFA61E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B449405FE
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWQhI7Rc9u27 for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C427E420D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C427E420D4
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1ADF805F4; Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 May 2025 22:41:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c2e499343c42cd29413f0f2a4649b27ba5c3862
X-Git-Newrev: 71c8ca75784206b133f304925ad83bbbe0245172
X-Patchwork-Hint: ignore
Message-Id: <20250612083831.C1ADF805F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiomqtt: bump version to
 2.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=71c8ca75784206b133f304925ad83bbbe0245172
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Aiomqtt switched its build system to hatchling with 2.3.1, change
PYTHON_AIOMQTT_SETUP_TYPE and dependencies accordingly.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiomqtt/python-aiomqtt.hash | 4 ++--
 package/python-aiomqtt/python-aiomqtt.mk   | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-aiomqtt/python-aiomqtt.hash b/package/python-aiomqtt/python-aiomqtt.hash
index 12ea86d538..eab5a1938f 100644
--- a/package/python-aiomqtt/python-aiomqtt.hash
+++ b/package/python-aiomqtt/python-aiomqtt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiomqtt/json
-md5  e23feb8ad69a1ae3a9701fb1f3c03a3c  aiomqtt-2.3.0.tar.gz
-sha256  312feebe20bc76dc7c20916663011f3bd37aa6f42f9f687a19a1c58308d80d47  aiomqtt-2.3.0.tar.gz
+md5  9ded3fea036dc979d7855a6b3fd1dc33  aiomqtt-2.4.0.tar.gz
+sha256  ab0f18fc5b7ffaa57451c407417d674db837b00a9c7d953cccd02be64f046c17  aiomqtt-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2cdee9e997c759749069649dfb9060fdb885da82bc50c0dcb4841b1dcab0b032  LICENSE
diff --git a/package/python-aiomqtt/python-aiomqtt.mk b/package/python-aiomqtt/python-aiomqtt.mk
index 80cecea9e8..c5b932838d 100644
--- a/package/python-aiomqtt/python-aiomqtt.mk
+++ b/package/python-aiomqtt/python-aiomqtt.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_AIOMQTT_VERSION = 2.3.0
+PYTHON_AIOMQTT_VERSION = 2.4.0
 PYTHON_AIOMQTT_SOURCE = aiomqtt-$(PYTHON_AIOMQTT_VERSION).tar.gz
-PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/db/c9/168e78bd35b21d9bdbb26178db33a8f265e4a69bb4193e72434e7cb3d1cd
-PYTHON_AIOMQTT_SETUP_TYPE = poetry
+PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/45/9a/863bc34c64bc4acb9720a9950bfc77d6f324640cdf1f420bb5d9ee624975
+PYTHON_AIOMQTT_SETUP_TYPE = hatch
 PYTHON_AIOMQTT_LICENSE = BSD-3-Clause
 PYTHON_AIOMQTT_LICENSE_FILES = LICENSE
-PYTHON_AIOMQTT_DEPENDENCIES = host-python-poetry-dynamic-versioning
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
