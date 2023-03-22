Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ADBC6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 22:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43E1E84043;
	Wed, 22 Mar 2023 22:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E1E84043
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XIcN_2Ee8ZkI; Wed, 22 Mar 2023 22:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92A1C83FC3;
	Wed, 22 Mar 2023 22:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A1C83FC3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A2261BF95F
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EB2B41C8A
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EB2B41C8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y631z3KiwLfT for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4498541C76
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4498541C76
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42D7487581; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 23:39:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e307992f4b2272759789f9cc218827f2467407d7
X-Git-Newrev: fadc1876e14c1346fad50f26ab72966174a46158
X-Patchwork-Hint: ignore
Message-Id: <20230322224400.42D7487581@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-jinja2: bump to
 version 1.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=fadc1876e14c1346fad50f26ab72966174a46158
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash | 4 ++--
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
index fbf244e470..0a7b7cc058 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-jinja2/json
-md5  50f74689fd60a5bc0b0a74545277e9bc  aiohttp-jinja2-1.5.tar.gz
-sha256  7c3ba5eac060b691f4e50534af2d79fca2a75712ebd2b25e6fcb1295859f910b  aiohttp-jinja2-1.5.tar.gz
+md5  8f72451a7da006b4b91ef18ec6f75885  aiohttp-jinja2-1.5.1.tar.gz
+sha256  8d149b2a57d91f794b33a394ea5bc66b567f38c74a5a6a9477afc2450f105c01  aiohttp-jinja2-1.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d9d867affaeac220a60381cc544681dcd37c668ed6ea5ddbf9948617f828889a  LICENSE
diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
index 371b4f0b3e..17f9a4018a 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_JINJA2_VERSION = 1.5
+PYTHON_AIOHTTP_JINJA2_VERSION = 1.5.1
 PYTHON_AIOHTTP_JINJA2_SOURCE = aiohttp-jinja2-$(PYTHON_AIOHTTP_JINJA2_VERSION).tar.gz
-PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/15/d7/8bdbdb65e2926de332d3c430839d655db61d30a7b5a4a9b2edafbeb3aa20
+PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/4e/4c/fadbfcc1269fa79e69fcdb29027840ab022a91471a5aeaa8fd8b27cc5406
 PYTHON_AIOHTTP_JINJA2_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_JINJA2_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_JINJA2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
