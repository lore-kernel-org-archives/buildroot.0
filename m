Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611E2C54EBE
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 19:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E74160E48;
	Thu, 12 Jan 2023 19:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E74160E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4pdEGzpWmQYM; Thu, 12 Jan 2023 19:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E56160E33;
	Thu, 12 Jan 2023 19:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E56160E33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B81741BF46D
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 941ED41149
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 941ED41149
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QFR3Go4EP52 for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 19:32:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C358341139
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 19:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C358341139
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B118687AA1; Thu, 12 Jan 2023 19:32:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 20:26:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f397197b3658968931a5a4b273fcebf5fdca1569
X-Git-Newrev: 0a598dedd8090d3c7ba4ea8c323a702289586647
X-Patchwork-Hint: ignore
Message-Id: <20230112193229.B118687AA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-watchdog: bump to version
 2.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a598dedd8090d3c7ba4ea8c323a702289586647
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-watchdog/python-watchdog.hash | 4 ++--
 package/python-watchdog/python-watchdog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 3bacccf2d6..0653787110 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  d029b806814bcba26745c26769a847bc  watchdog-2.2.0.tar.gz
-sha256  83cf8bc60d9c613b66a4c018051873d6273d9e45d040eed06d6a96241bd8ec01  watchdog-2.2.0.tar.gz
+md5  04cda210c7ffd04582d2466328ee7368  watchdog-2.2.1.tar.gz
+sha256  cdcc23c9528601a8a293eb4369cbd14f6b4f34f07ae8769421252e9c22718b6f  watchdog-2.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  02c8760f988a76e92a9d6cb525456a86f7b0fd1953870dd491de5955cb974d41  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index bb9f145e16..9c058e38ad 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 2.2.0
+PYTHON_WATCHDOG_VERSION = 2.2.1
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/c3/fb/bd960970258366b0704307ccd12617d64201407bfb6d31ae412d2762ccf1
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/11/6f/0396d373e039b89c60e23a1a9025edc6dd203121fe0af7d1427e85d5ec98
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
