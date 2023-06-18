Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B010AEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 619EF60067;
	Sun, 18 Jun 2023 13:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 619EF60067
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrbdUPqAdj2F; Sun, 18 Jun 2023 13:10:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 907F460F8F;
	Sun, 18 Jun 2023 13:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 907F460F8F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 965061BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70FE781E35
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70FE781E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SS4ubQcGw7nD for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:10:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BE9D81E34
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BE9D81E34
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C35183D3E; Sun, 18 Jun 2023 13:10:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 15:08:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f50a8cad0efb5783e9d93d62d932e0f114bf346
X-Git-Newrev: c46b025420ff4f5dd399ddfcb7f0a789e95c503b
X-Patchwork-Hint: ignore
Message-Id: <20230618131009.8C35183D3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-selenium: bump to version
 4.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c46b025420ff4f5dd399ddfcb7f0a789e95c503b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-selenium/python-selenium.hash | 4 ++--
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index d462abc62b..03a9683a21 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/selenium/json
-md5  e9054eb95920bb2a1d594090f0773f61  selenium-4.8.0.tar.gz
-sha256  fee36724d6cf0b18c73781bb8ec7be4a35ab1e2564e64e64e64da75e50e052af  selenium-4.8.0.tar.gz
+md5  02404033a10b2b29aa098f50503c0a1a  selenium-4.9.1.tar.gz
+sha256  3444f4376321530c36ce8355b6b357d8cf4a7d588ce5cf772183465930bbed0e  selenium-4.9.1.tar.gz
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index 6dbea6fb7e..d59a16a57d 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.8.0
+PYTHON_SELENIUM_VERSION = 4.9.1
 PYTHON_SELENIUM_SOURCE = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE = https://files.pythonhosted.org/packages/2e/3d/492cf1a6823c48369328572c6bc63b7a957ba25c0009ee6bdb507cd9a6a4
+PYTHON_SELENIUM_SITE = https://files.pythonhosted.org/packages/fd/e2/0e5bee6762a7bf7852b47a79c5b12f9e526e6962958dbb9719fa490ba24c
 PYTHON_SELENIUM_SETUP_TYPE = setuptools
 PYTHON_SELENIUM_LICENSE = Apache-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
