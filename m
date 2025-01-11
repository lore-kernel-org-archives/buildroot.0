Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4731AC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D81864F3DE;
	Fri, 28 Feb 2025 16:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVgQVrw4BLvO; Fri, 28 Feb 2025 16:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85D1E50136
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85D1E50136;
	Fri, 28 Feb 2025 16:54:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 107BE1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A719A42D30
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIeUeSesXZ8U for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60D0C42D2A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60D0C42D2A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 514C187A8B; Fri, 28 Feb 2025 16:30:04 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 18:03:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b74c633319fdfa9e6beed0a3b5989f84145f5841
X-Git-Newrev: ba6cafad2343c1fa5aa4da17deec3759f70b5b06
X-Patchwork-Hint: ignore
Message-Id: <20250228163004.514C187A8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-libusb1: bump
 to version 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba6cafad2343c1fa5aa4da17deec3759f70b5b06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-libusb1/python-libusb1.hash | 4 ++--
 package/python-libusb1/python-libusb1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
index effecd8531..cf270a2d3d 100644
--- a/package/python-libusb1/python-libusb1.hash
+++ b/package/python-libusb1/python-libusb1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/libusb1/json
-md5  7b4f094786d1dfc8d011c7649d8ccb97  libusb1-3.1.0.tar.gz
-sha256  4ee9b0a55f8bd0b3ea7017ae919a6c1f439af742c4a4b04543c5fd7af89b828c  libusb1-3.1.0.tar.gz
+md5  617502b66841e601c28c668c20c1d843  libusb1-3.2.0.tar.gz
+sha256  a11a6095e718cd49418a96329314da271cca6be7b4317a142724523371ac8961  libusb1-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
index 39fd7e40d3..7d68377f51 100644
--- a/package/python-libusb1/python-libusb1.mk
+++ b/package/python-libusb1/python-libusb1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBUSB1_VERSION = 3.1.0
+PYTHON_LIBUSB1_VERSION = 3.2.0
 PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
-PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/af/19/53ecbfb96d6832f2272d13b84658c360802fcfff7c0c497ab8f6bf15ac40
+PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/d9/b7/9e833af6cb52fa2aece1c6a1378667ca0172bead14f63ffccc3cb9862df3
 PYTHON_LIBUSB1_SETUP_TYPE = setuptools
 PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
 PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
