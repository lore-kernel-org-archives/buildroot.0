Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC78C4167D
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 13:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B662240084;
	Mon,  6 Nov 2023 13:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B662240084
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-TsNH0lZZDH; Mon,  6 Nov 2023 13:20:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA25D41FAB;
	Mon,  6 Nov 2023 13:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA25D41FAB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F78A1BF3C1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DDDB820C3
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DDDB820C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipEozLyiV44v for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31CCE82239
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31CCE82239
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 228B68690D; Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 13:55:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce2bf7b96b9dba57bb31aca583283736af27afcc
X-Git-Newrev: 167f4c834e3f6b9b44a96b56cacba9723099245e
X-Patchwork-Hint: ignore
Message-Id: <20231106131914.228B68690D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-blinker: bump to version
 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=167f4c834e3f6b9b44a96b56cacba9723099245e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-blinker/python-blinker.hash | 4 ++--
 package/python-blinker/python-blinker.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-blinker/python-blinker.hash b/package/python-blinker/python-blinker.hash
index 28416d9fe2..e0c1d600eb 100644
--- a/package/python-blinker/python-blinker.hash
+++ b/package/python-blinker/python-blinker.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/blinker/json
-md5  1c7375d100a67ba368d9cde0ab2d8cfa  blinker-1.6.2.tar.gz
-sha256  4afd3de66ef3a9f8067559fb7a1cbe555c17dcbe15971b05d1b625c3e7abe213  blinker-1.6.2.tar.gz
+md5  0306b831281e9918ffb0ac6e3e18b47f  blinker-1.7.0.tar.gz
+sha256  e6820ff6fa4e4d1d8e2747c2283749c3f547e4fee112b98555cdcdae32996182  blinker-1.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9eb73a1f38597a4aa17025d2ae1be3839624c795e985d4f0e9769ce29faca467  LICENSE.rst
diff --git a/package/python-blinker/python-blinker.mk b/package/python-blinker/python-blinker.mk
index 6af0f811cb..234126a500 100644
--- a/package/python-blinker/python-blinker.mk
+++ b/package/python-blinker/python-blinker.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLINKER_VERSION = 1.6.2
+PYTHON_BLINKER_VERSION = 1.7.0
 PYTHON_BLINKER_SOURCE = blinker-$(PYTHON_BLINKER_VERSION).tar.gz
-PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/e8/f9/a05287f3d5c54d20f51a235ace01f50620984bc7ca5ceee781dc645211c5
+PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/a1/13/6df5fc090ff4e5d246baf1f45fe9e5623aa8565757dfa5bd243f6a545f9e
 PYTHON_BLINKER_SETUP_TYPE = setuptools
 PYTHON_BLINKER_LICENSE = MIT
 PYTHON_BLINKER_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
