Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B584C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A11641B49;
	Fri, 10 Nov 2023 21:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A11641B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4ny9NoC6KL5; Fri, 10 Nov 2023 21:20:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AB61402D6;
	Fri, 10 Nov 2023 21:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AB61402D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF15E1BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92E9C41A2C
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92E9C41A2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id doB2WALCQH17 for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:19:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71BA640A43
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71BA640A43
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D01887004; Fri, 10 Nov 2023 21:19:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:17:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26b8b6c7cf4e57f5ecf197d66bbc3246b0ab6ae8
X-Git-Newrev: d8ae2986a0cc438063f138d556dbef3851c57304
X-Patchwork-Hint: ignore
Message-Id: <20231110211928.5D01887004@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-libusb1: bump to version
 3.1.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d8ae2986a0cc438063f138d556dbef3851c57304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-libusb1/python-libusb1.hash | 4 ++--
 package/python-libusb1/python-libusb1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
index 86dea08c89..effecd8531 100644
--- a/package/python-libusb1/python-libusb1.hash
+++ b/package/python-libusb1/python-libusb1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/libusb1/json
-md5  ffbb02bf9aa49f973a6a58112aed7b06  libusb1-3.0.0.tar.gz
-sha256  5792a9defee40f15d330a40d9b1800545c32e47ba7fc66b6f28f133c9fcc8538  libusb1-3.0.0.tar.gz
+md5  7b4f094786d1dfc8d011c7649d8ccb97  libusb1-3.1.0.tar.gz
+sha256  4ee9b0a55f8bd0b3ea7017ae919a6c1f439af742c4a4b04543c5fd7af89b828c  libusb1-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
index 48a0b1dea3..39fd7e40d3 100644
--- a/package/python-libusb1/python-libusb1.mk
+++ b/package/python-libusb1/python-libusb1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBUSB1_VERSION = 3.0.0
+PYTHON_LIBUSB1_VERSION = 3.1.0
 PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
-PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/f4/83/59bf75e74e0c4859ea63eae0c7da660c1dcb78b31667d4a5f735d52f5974
+PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/af/19/53ecbfb96d6832f2272d13b84658c360802fcfff7c0c497ab8f6bf15ac40
 PYTHON_LIBUSB1_SETUP_TYPE = setuptools
 PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
 PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
