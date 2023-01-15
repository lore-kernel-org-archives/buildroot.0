Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F73C63797
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9442D41477;
	Sun, 15 Jan 2023 11:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9442D41477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1T1yS9uhAgJE; Sun, 15 Jan 2023 11:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7904941296;
	Sun, 15 Jan 2023 11:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7904941296
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7E451BF8C7
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B0B841591
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B0B841591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANTTaIKW5Vne for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:06:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8807641295
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8807641295
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75268870D1; Sun, 15 Jan 2023 11:06:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:00:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59461ec52ef6d70d08d0e68cd24a6a3db2dbb7fc
X-Git-Newrev: c35f2393327abab5d21a9155d468067482af383b
X-Patchwork-Hint: ignore
Message-Id: <20230115110627.75268870D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aioblescan: bump to version
 0.2.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=c35f2393327abab5d21a9155d468067482af383b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-aioblescan/python-aioblescan.hash | 4 ++--
 package/python-aioblescan/python-aioblescan.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioblescan/python-aioblescan.hash b/package/python-aioblescan/python-aioblescan.hash
index 9a40ca4560..c754325fb1 100644
--- a/package/python-aioblescan/python-aioblescan.hash
+++ b/package/python-aioblescan/python-aioblescan.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioblescan/json
-md5  0601cf9335e5d89166a88f53597c79bf  aioblescan-0.2.13.tar.gz
-sha256  28632e32c8180ea4b792f4cf9b88968dd100f4d3cee0cf16d27c193cf954422a  aioblescan-0.2.13.tar.gz
+md5  10014cfd24b8f9f54099bbf7e2ea528a  aioblescan-0.2.14.tar.gz
+sha256  3a47c5292186ee87fc49cb076a5271c766510f44749b93ac4a32bbb4cb5258a0  aioblescan-0.2.14.tar.gz
 # Locally computed sha256 checksums
 sha256  c2066cd44079e0c706234001af18cb6ad4b62fc68d0d08d29fdc7319916647e0  LICENSE.txt
diff --git a/package/python-aioblescan/python-aioblescan.mk b/package/python-aioblescan/python-aioblescan.mk
index f0e277d528..7e0cde6c85 100644
--- a/package/python-aioblescan/python-aioblescan.mk
+++ b/package/python-aioblescan/python-aioblescan.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOBLESCAN_VERSION = 0.2.13
+PYTHON_AIOBLESCAN_VERSION = 0.2.14
 PYTHON_AIOBLESCAN_SOURCE = aioblescan-$(PYTHON_AIOBLESCAN_VERSION).tar.gz
-PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/bd/04/c6798c76704d57da22f19c2e47485821d4b23144ef75f9c0e18dbfe47565
+PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/45/15/faf503083bc5a2d81f1b17fbbe30d15f35217b6c5e944c771c8760354d59
 PYTHON_AIOBLESCAN_SETUP_TYPE = setuptools
 PYTHON_AIOBLESCAN_LICENSE = MIT
 PYTHON_AIOBLESCAN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
