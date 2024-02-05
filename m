Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B914BC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75B6F60F0B;
	Mon,  5 Feb 2024 13:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75B6F60F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJgJ6jIV6i8G; Mon,  5 Feb 2024 13:30:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B054A60FF7;
	Mon,  5 Feb 2024 13:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B054A60FF7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 565D61BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 285C84049A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 285C84049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MfaSVE6K5t07 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CD6F40111
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CD6F40111
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06EC986C7E; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 14:28:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06cdc02ef2d0124972448c4b0ffda3da2530bb23
X-Git-Newrev: 9d8d458ec6f9a5b8aba2fa3f2252965f59c66caf
X-Patchwork-Hint: ignore
Message-Id: <20240205132915.06EC986C7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aioconsole: bump to version
 0.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d8d458ec6f9a5b8aba2fa3f2252965f59c66caf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index b8237ed76c..b52140cca5 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  0f7e4db85113d1ffdc5f0fa1dc0a37de  aioconsole-0.6.2.tar.gz
-sha256  bac11286f1062613d2523ceee1ba81c676cd269812b865b66b907448a7b5f63e  aioconsole-0.6.2.tar.gz
+md5  e8cb2e4dc434e20a3e75acb54d89bdf3  aioconsole-0.7.0.tar.gz
+sha256  c702d24406378d37d9873f91e03ce71520bac503d5ab03f81d8b563ff010bd54  aioconsole-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e1c0ad728983d8a57335e52cf1064f1affd1d454173d8cebd3ed8b4a72b48704  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 602564c290..b109d8e358 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.6.2
+PYTHON_AIOCONSOLE_VERSION = 0.7.0
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/5f/14/e5c634fad6a95ffd602fbbd1aa107f05a8ffb79d33ec0d0477f3b137f8a9
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/85/da/6a238a72274fa338b2ff20007f026944a6721245fa65d3bd4adeb83be419
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
