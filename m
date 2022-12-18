Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A92BC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0643A4F046;
	Mon, 20 Feb 2023 22:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0643A4F046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqmdKchA8p48; Mon, 20 Feb 2023 22:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3ADD4F04C;
	Mon, 20 Feb 2023 22:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3ADD4F04C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3F321BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C030F416D1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C030F416D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RxpnAKQCdr4U for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE83B416D7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE83B416D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC0FB86495; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:50:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 10b329956a378f9f3806339355cd6df32133690c
X-Git-Newrev: b7963d4a5dd86e2fce9c70371d10509220d3bda2
X-Patchwork-Hint: ignore
Message-Id: <20230220205211.EC0FB86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-fire: bump to
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b7963d4a5dd86e2fce9c70371d10509220d3bda2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-fire/python-fire.hash | 4 ++--
 package/python-fire/python-fire.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fire/python-fire.hash b/package/python-fire/python-fire.hash
index d86376c52b..ce44bef96e 100644
--- a/package/python-fire/python-fire.hash
+++ b/package/python-fire/python-fire.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fire/json
-md5  799be84cbbd7df2cf159cdcb538ab6f9  fire-0.4.0.tar.gz
-sha256  c5e2b8763699d1142393a46d0e3e790c5eb2f0706082df8f647878842c216a62  fire-0.4.0.tar.gz
+md5  8b24d579bd2a1b344b4f9670fa49ebc8  fire-0.5.0.tar.gz
+sha256  a6b0d49e98c8963910021f92bba66f65ab440da2982b78eb1bbf95a0a34aacc6  fire-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a5de77b62266bca0bb97bf058992f0b0f308a83a8ca55ee10fbf6bd8ed8f7ed0  LICENSE
diff --git a/package/python-fire/python-fire.mk b/package/python-fire/python-fire.mk
index 40631fce86..7a6c31e8a4 100644
--- a/package/python-fire/python-fire.mk
+++ b/package/python-fire/python-fire.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FIRE_VERSION = 0.4.0
+PYTHON_FIRE_VERSION = 0.5.0
 PYTHON_FIRE_SOURCE = fire-$(PYTHON_FIRE_VERSION).tar.gz
-PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/11/07/a119a1aa04d37bc819940d95ed7e135a7dcca1c098123a3764a6dcace9e7
+PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/94/ed/3b9a10605163f48517931083aee8364d4d6d3bb1aa9b75eb0a4a5e9fbfc1
 PYTHON_FIRE_SETUP_TYPE = setuptools
 PYTHON_FIRE_LICENSE = Apache-2.0
 PYTHON_FIRE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
