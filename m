Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6758BE71060
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 13:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 179C080C16;
	Thu, 21 Sep 2023 13:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 179C080C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id avJeWjvR6BvM; Thu, 21 Sep 2023 13:04:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5598280BE4;
	Thu, 21 Sep 2023 13:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5598280BE4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E16231BF990
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 13:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9CDD40B12
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 13:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9CDD40B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9K3y_AnW8dVA for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 13:04:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7C1040AF0
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 13:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7C1040AF0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C35658748F; Thu, 21 Sep 2023 13:04:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 14:58:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1defedaf0bfdab6da63b52f4fd9b38cd19af19a4
X-Git-Newrev: 8f9d6e07f2f333ee3feb5bf1e6966a83ef36f40f
X-Patchwork-Hint: ignore
Message-Id: <20230921130413.C35658748F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-minimalmodbus: bump to
 version 2.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f9d6e07f2f333ee3feb5bf1e6966a83ef36f40f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-minimalmodbus/python-minimalmodbus.hash | 2 +-
 package/python-minimalmodbus/python-minimalmodbus.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-minimalmodbus/python-minimalmodbus.hash b/package/python-minimalmodbus/python-minimalmodbus.hash
index b29e83773b..635090fae7 100644
--- a/package/python-minimalmodbus/python-minimalmodbus.hash
+++ b/package/python-minimalmodbus/python-minimalmodbus.hash
@@ -1,4 +1,4 @@
 # sha256 from https://pypi.org/project/minimalmodbus
-sha256  cf873a2530be3f4b86467c3e4d47b5f69fd345d47451baca4adbf59e2ac36d00  minimalmodbus-2.0.1.tar.gz
+sha256  c3f5a56e107d537e4bb420f7e735841ab2939c8ca6fb528f5fe4124571315b64  minimalmodbus-2.1.1.tar.gz
 # Hash for license file
 sha256  abe787d472ae2069e935c84eb13fd770518dfb08b92d5f190f3cd7ff6d1f6f32  LICENSE
diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk b/package/python-minimalmodbus/python-minimalmodbus.mk
index b463cf9ffe..5a6e7733be 100644
--- a/package/python-minimalmodbus/python-minimalmodbus.mk
+++ b/package/python-minimalmodbus/python-minimalmodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MINIMALMODBUS_VERSION = 2.0.1
+PYTHON_MINIMALMODBUS_VERSION = 2.1.1
 PYTHON_MINIMALMODBUS_SOURCE = minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
-PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/78/99/8cd22b4465e697bae2b02fd06aaccd4c5cdfbb18945d728db99f23d71df9
+PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/37/fc/8a58f7bcdece751f16a4a9aac780acd1288aa8ac6adbffdd764c88fb71c6
 PYTHON_MINIMALMODBUS_SETUP_TYPE = setuptools
 PYTHON_MINIMALMODBUS_LICENSE = Apache-2.0
 PYTHON_MINIMALMODBUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
