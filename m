Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C59FC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB85460F0A;
	Mon,  5 Feb 2024 13:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB85460F0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BVGUkjrzgrjf; Mon,  5 Feb 2024 13:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DDC660F1A;
	Mon,  5 Feb 2024 13:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DDC660F1A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 032AB1BF95D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0C628230D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0C628230D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yv11deZ9qGVF for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2460A8213C
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2460A8213C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 114DC86C7F; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 14:28:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d8d458ec6f9a5b8aba2fa3f2252965f59c66caf
X-Git-Newrev: cd5546c0465e1abe3f83b6540e09e4d568409537
X-Patchwork-Hint: ignore
Message-Id: <20240205132915.114DC86C7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-security: bump to
 version 0.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd5546c0465e1abe3f83b6540e09e4d568409537
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-aiohttp-security/python-aiohttp-security.hash | 4 ++--
 package/python-aiohttp-security/python-aiohttp-security.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-security/python-aiohttp-security.hash b/package/python-aiohttp-security/python-aiohttp-security.hash
index 2c23df14d6..6a76070298 100644
--- a/package/python-aiohttp-security/python-aiohttp-security.hash
+++ b/package/python-aiohttp-security/python-aiohttp-security.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-security/json
-md5  1624f982d7a779e6ed396ef2ed20acc7  aiohttp-security-0.4.0.tar.gz
-sha256  40d4bb150454e392c2dfa3620f6eab28e140e94cf0c2d3b4bf43aef653ec9405  aiohttp-security-0.4.0.tar.gz
+md5  b34fb62c6f4dd130f3c94f74c3bdc150  aiohttp-security-0.5.0.tar.gz
+sha256  50cb724d310e1d0289798bb98ae852c3b75b77e8f51ce5159c57b7261d0638bd  aiohttp-security-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a1cc8ff7210897d55d2552fa0792340f8e59720e0160b6918699d40f9a782b1c  LICENSE
diff --git a/package/python-aiohttp-security/python-aiohttp-security.mk b/package/python-aiohttp-security/python-aiohttp-security.mk
index 9ab3b16b30..274f60423f 100644
--- a/package/python-aiohttp-security/python-aiohttp-security.mk
+++ b/package/python-aiohttp-security/python-aiohttp-security.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SECURITY_VERSION = 0.4.0
+PYTHON_AIOHTTP_SECURITY_VERSION = 0.5.0
 PYTHON_AIOHTTP_SECURITY_SOURCE = aiohttp-security-$(PYTHON_AIOHTTP_SECURITY_VERSION).tar.gz
-PYTHON_AIOHTTP_SECURITY_SITE = https://files.pythonhosted.org/packages/36/01/d85be376b7c1773b3cb7849cd56dc7d38165664df7de2d3e20af507ef5bb
+PYTHON_AIOHTTP_SECURITY_SITE = https://files.pythonhosted.org/packages/31/49/56c131fe3dead875ab5907b154dac7fb6ee727662de80b7da0ff045030d4
 PYTHON_AIOHTTP_SECURITY_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SECURITY_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SECURITY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
