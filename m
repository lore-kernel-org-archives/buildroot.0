Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF75C6FD1C
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 22:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A91784024;
	Wed, 22 Mar 2023 22:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A91784024
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zUhsF9hi49FR; Wed, 22 Mar 2023 22:46:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3828E84015;
	Wed, 22 Mar 2023 22:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3828E84015
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5171BF909
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A63640191
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A63640191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWLxM7bM9frI for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BFD941C78
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BFD941C78
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D82F87585; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 23:39:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fadc1876e14c1346fad50f26ab72966174a46158
X-Git-Newrev: a1e7679a38edc3d4e4e71e6aed1ffd0f4b5fe312
X-Patchwork-Hint: ignore
Message-Id: <20230322224400.4D82F87585@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp: bump to version
 3.8.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1e7679a38edc3d4e4e71e6aed1ffd0f4b5fe312
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index e59b6969e6..0f687c7827 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  642653db642be1508e50fcdeafe0f928  aiohttp-3.8.3.tar.gz
-sha256  3828fb41b7203176b82fe5d699e0d845435f2374750a44b480ea6b930f6be269  aiohttp-3.8.3.tar.gz
+md5  8208bc4b519ac4520720577f93561855  aiohttp-3.8.4.tar.gz
+sha256  bf2e1a9162c1e441bf805a1fd166e249d574ca04e03b34f97e2928769e91ab5c  aiohttp-3.8.4.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 8b0b15f13b..72fb34fd25 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.8.3
+PYTHON_AIOHTTP_VERSION = 3.8.4
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/ff/4f/62d9859b7d4e6dc32feda67815c5f5ab4421e6909e48cbc970b6a40d60b7
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/c2/fd/1ff4da09ca29d8933fda3f3514980357e25419ce5e0f689041edb8f17dab
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
