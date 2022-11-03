Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B8BC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B480414CE;
	Mon,  5 Dec 2022 11:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B480414CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hsDBsQvbKKlH; Mon,  5 Dec 2022 11:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DDDA4155E;
	Mon,  5 Dec 2022 11:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DDDA4155E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 128C61BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C265405E5
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C265405E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZgeDa_XxjP4D for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 747C64056A
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 747C64056A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F71185B9B; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a17804f6e32e73d7cc40822ab2721dfc69c0c502
X-Git-Newrev: bdf1fdba0d72bdde79c2bc45914f6f2b831997c3
X-Patchwork-Hint: ignore
Message-Id: <20221205112605.6F71185B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setproctitle: bump to
 version 1.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdf1fdba0d72bdde79c2bc45914f6f2b831997c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date update:
https://github.com/dvarrazzo/py-setproctitle/commit/42831ad1dc71c7678f0492977f32b341df7f1a1a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setproctitle/python-setproctitle.hash | 6 +++---
 package/python-setproctitle/python-setproctitle.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
index 88e4453277..ac8fed986a 100644
--- a/package/python-setproctitle/python-setproctitle.hash
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setproctitle/json
-md5  9898587a1668f1c53f6699ca5d35256d  setproctitle-1.2.2.tar.gz
-sha256  7dfb472c8852403d34007e01d6e3c68c57eb66433fb8a5c77b13b89a160d97df  setproctitle-1.2.2.tar.gz
+md5  fa9771540422a59a8dee1331ad6fd3a9  setproctitle-1.3.2.tar.gz
+sha256  b9fb97907c830d260fa0658ed58afd48a86b2b88aac521135c352ff7fd3477fd  setproctitle-1.3.2.tar.gz
 # Locally computed
-sha256  85bd836337aa702e0a4e2a54676c6ae046ffb357dbf4a990189595a60fcd1648  COPYRIGHT
+sha256  4ace14d0836da75079088cfc5cef6f2ddc8ce16f600609b36ee1bf10f8101f61  COPYRIGHT
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index 13e9e261be..7055920c08 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETPROCTITLE_VERSION = 1.2.2
+PYTHON_SETPROCTITLE_VERSION = 1.3.2
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
-PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/a1/7f/a1d4f4c7b66f0fc02f35dc5c85f45a8b4e4a7988357a29e61c14e725ef86
+PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/b5/47/ac709629ddb9779fee29b7d10ae9580f60a4b37e49bce72360ddf9a79cdc
 PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
 PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
 PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
