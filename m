Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADAFC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEAEE81403;
	Mon,  5 Dec 2022 11:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEAEE81403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fpw0yuJnYDpm; Mon,  5 Dec 2022 11:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CDC781BC6;
	Mon,  5 Dec 2022 11:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CDC781BC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B6841BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83541415F4
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83541415F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZAszJGKTERk7 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8563A41607
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8563A41607
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FDBD85BA2; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e6461c51f07e04cd42708843cf45583108f37ac
X-Git-Newrev: 303b98a1991e2bc1b7b416f180d0e5e291655290
X-Patchwork-Hint: ignore
Message-Id: <20221205112603.7FDBD85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-networkx: bump to version
 2.8.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=303b98a1991e2bc1b7b416f180d0e5e291655290
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/networkx/networkx/commit/922d587d8c556f87b664281109fefd7fc66d813f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-networkx/python-networkx.hash | 6 +++---
 package/python-networkx/python-networkx.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index ace5c6721a..d166f0b8d8 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  407eb28c54e08725559754ca7ab185e0  networkx-2.6.3.tar.gz
-sha256  c0946ed31d71f1b732b5aaa6da5a0388a345019af232ce2f49c766e2d6795c51  networkx-2.6.3.tar.gz
+md5  22139ab5a47818fa00cbaa91eb126381  networkx-2.8.8.tar.gz
+sha256  230d388117af870fce5647a3c52401fcf753e94720e6ea6b4197a5355648885e  networkx-2.8.8.tar.gz
 # Locally computed sha256 checksums
-sha256  f9c25c92ced5a264a3fe857231205d5eb625ae367935aaf8d61cdd5087dfb90e  LICENSE.txt
+sha256  aae9f809fb1a1592ed72e9f52df10cfad8fe226b8d4d28385f90dd4341ce7119  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index 1908ed8f93..f097671d66 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 2.6.3
+PYTHON_NETWORKX_VERSION = 2.8.8
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/97/ae/7497bc5e1c84af95e585e3f98585c9f06c627fac6340984c4243053e8f44
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/cd/16/c44e8550012735b8f21b3df7f39e8ba5a987fb764ac017ad5f3589735889
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
