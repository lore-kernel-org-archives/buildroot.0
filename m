Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF47E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2AFC8470A;
	Fri,  6 Sep 2024 20:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSI0fEipmZSC; Fri,  6 Sep 2024 20:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76DEC84719
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76DEC84719;
	Fri,  6 Sep 2024 20:01:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 729341BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57BA34088C
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-GUyX6s4Qa3 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E850D4091F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E850D4091F
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E33DA7FC62; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:34:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e15368ba87aeb464e33f857dfea332626929f0e
X-Git-Newrev: 33b9374d222598230802025dc3025692cc4e3653
X-Patchwork-Hint: ignore
Message-Id: <20240906195856.E33DA7FC62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-can: bump to 4.4.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=33b9374d222598230802025dc3025692cc4e3653
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tarball name prefix changed from python-can to python_can.

Changelog:
* https://github.com/hardbyte/python-can/blob/main/CHANGELOG.md#version-442

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-can/python-can.hash | 4 ++--
 package/python-can/python-can.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index 4e706519be..479935b2f0 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-can/json
-md5  a84ace55fdeca8efd50986deacfba584  python-can-4.3.1.tar.gz
-sha256  008bea1c12e31586e1aa76971126b831bf01056a900e91862a11360e011ab933  python-can-4.3.1.tar.gz
+md5  20133a1b73b58c976bba6b0af8581f32  python_can-4.4.2.tar.gz
+sha256  1c46c0935f39f7a9c3e76b03249af0580689ebf7a1844195e92f87257f009df5  python_can-4.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index c7100e3dda..b6547a4d3f 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 4.3.1
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/02/fc/d5fd33ee93f17a4eb0dcd75aebf522396e3f511bf474058e99e86ae4e33f
+PYTHON_CAN_VERSION = 4.4.2
+PYTHON_CAN_SOURCE = python_can-$(PYTHON_CAN_VERSION).tar.gz
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/a3/17/57c38abbf00993ac5ec306de0c00271685d1372ef3d907b107eb63ab13a8
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
