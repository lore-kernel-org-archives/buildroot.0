Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4B9CCD19F
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 10:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5397240B3B;
	Sat, 18 Oct 2025 10:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1me2oQug2gtC; Sat, 18 Oct 2025 10:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6524A40AC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6524A40AC5;
	Sat, 18 Oct 2025 10:52:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A0C01CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EF4C83C03
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCZSOGfZCVNj for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 10:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62B3083C0A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62B3083C0A
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:52:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 530CA872FB; Sat, 18 Oct 2025 10:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 12:48:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c31a86ebf66cc322212f1045cb2625cde1b83dc5
X-Git-Newrev: 11cb3d3328bfe6c393d0302263e486f4dcfeeced
X-Patchwork-Hint: ignore
Message-Id: <20251018105242.530CA872FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jc: bump to version 1.25.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=11cb3d3328bfe6c393d0302263e486f4dcfeeced
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes: https://github.com/kellyjonbrazil/jc/releases/tag/v1.25.6

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index 6e80024639..d2eb47d41c 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  40bc4d9fa71e3809c236954a1bd2354f  jc-1.25.5.tar.gz
-sha256  f8ac0e4bc427b0ee8a3bdb07a254cc9df6b6036cd440f6c425e2e519cdbda78a  jc-1.25.5.tar.gz
+md5  f3fbc012843d192e446462e45ab2ebe1  jc-1.25.6.tar.gz
+sha256  27f58befc7ae0a4c63322926c5f1ec892e3eac4a065eff3b07cfe420a6924a07  jc-1.25.6.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index 16bdc05895..0404275277 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.25.5
+PYTHON_JC_VERSION = 1.25.6
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/1b/da/f6ec6a79f8dea70671f41d7162cfefdfe97e9c5b6c2227c1737183c05cd6
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/7c/fa/f174bfb1ecfd3bdc6259b2de32052f09cccba11c9a1b733aedf618fadd05
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
