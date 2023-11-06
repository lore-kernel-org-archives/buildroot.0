Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD356C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8662D41ECA;
	Mon,  6 Nov 2023 21:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8662D41ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIPl6VQa8HYn; Mon,  6 Nov 2023 21:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C58A41FB0;
	Mon,  6 Nov 2023 21:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C58A41FB0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7712A1BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C76B82664
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C76B82664
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ClegnWMwYzbc for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:09:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79D03829A9
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79D03829A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6806586A27; Mon,  6 Nov 2023 21:09:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:09:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39eba02fd72c8ffe721ef48902f8136c7550f8ef
X-Git-Newrev: b898022e767f48cbdad96d6699233743ee25f7a7
X-Patchwork-Hint: ignore
Message-Id: <20231106210936.6806586A27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-canopen: bump to version
 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b898022e767f48cbdad96d6699233743ee25f7a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file hash changed because CRLF line endings were removed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-canopen/python-canopen.hash | 6 +++---
 package/python-canopen/python-canopen.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-canopen/python-canopen.hash b/package/python-canopen/python-canopen.hash
index e6485e72f0..fc3668bc6c 100644
--- a/package/python-canopen/python-canopen.hash
+++ b/package/python-canopen/python-canopen.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/canopen/json
-md5  d51443bdc8a55faea63c9da82196dd47  canopen-2.1.0.tar.gz
-sha256  bc126bb1dcb62e3b34d8a12e38a07b5aa8319c17457c9bfe208f0bbbda90ff61  canopen-2.1.0.tar.gz
+md5  2a757a6996f896d2e6afbf2bcf598df2  canopen-2.2.0.tar.gz
+sha256  5f18651b9df6e4769b9882e969f934ae773ef24a45aabc3334b586982048d08c  canopen-2.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  d9035caf7b8b135899da92a2730e2ac2e9f5ae3220dc98bd661be18045fcf689  LICENSE.txt
+sha256  0740d30978affcd91c0fc817b7cf942a332381bf0380fe17e60c6a0b377c6e0d  LICENSE.txt
diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
index a0f5220ded..963c4ab801 100644
--- a/package/python-canopen/python-canopen.mk
+++ b/package/python-canopen/python-canopen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CANOPEN_VERSION = 2.1.0
+PYTHON_CANOPEN_VERSION = 2.2.0
 PYTHON_CANOPEN_SOURCE = canopen-$(PYTHON_CANOPEN_VERSION).tar.gz
-PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/29/d1/54462c949c384b1a9a2bd260143a8ec6f4259a18d119bd122e8f8a791b50
+PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/49/55/67e555f6f4ea51d6d966e998a77881c1bd726c6e8cc602fd04852772ce87
 PYTHON_CANOPEN_SETUP_TYPE = setuptools
 PYTHON_CANOPEN_LICENSE = MIT
 PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
