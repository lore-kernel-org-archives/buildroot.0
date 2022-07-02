Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333D6C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Jul 2022 13:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D77B1415AE;
	Sat,  2 Jul 2022 13:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D77B1415AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1lAB5ATLDU1; Sat,  2 Jul 2022 13:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79E134154D;
	Sat,  2 Jul 2022 13:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79E134154D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 693FF1BF5A1
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18A3C40390
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18A3C40390
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Gf0DUIEzt-1 for <buildroot@lists.busybox.net>;
 Sat,  2 Jul 2022 13:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D443404B3
 for <buildroot@buildroot.org>; Sat,  2 Jul 2022 13:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D443404B3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2E6E887876; Sat,  2 Jul 2022 13:39:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Jul 2022 15:48:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06ac43e7cc06133e9014882d7cef3040b1c818c1
X-Git-Newrev: 83548c33faf5f671d52090af94e366e765395e04
X-Patchwork-Hint: ignore
Message-Id: <20220702133939.2E6E887876@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 9.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=83548c33faf5f671d52090af94e366e765395e04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 2e259c1caf..ff23ed6299 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  a9ebd39b3482993474872757d317e26f  Pillow-9.1.0.tar.gz
-sha256  f401ed2bbb155e1ade150ccc63db1a4f6c1909d3d378f7d1235a44e90d75fb97  Pillow-9.1.0.tar.gz
+md5  f0d347298e72b403fbc3198677f394bb  Pillow-9.1.1.tar.gz
+sha256  7502539939b53d7565f3d11d87c78e7ec900d3c72945d4ee0e2f250d598309a0  Pillow-9.1.1.tar.gz
 
 # Locally computed sha256 checksums
 sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 2abe5e04ef..8c9cb86863 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.1.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/4b/83/090146d7871d90a2643d469c319c1d014e41b315ab5cf0f8b4b6a764ef31
+PYTHON_PILLOW_VERSION = 9.1.1
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/43/6e/59853546226ee6200f9ba6e574d11604b60ad0754d2cbd1c8f3246b70418
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
