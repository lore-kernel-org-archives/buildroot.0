Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B83AC43334
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 06:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3774740AA6;
	Sat, 25 Jun 2022 06:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3774740AA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRuPegB2tAs5; Sat, 25 Jun 2022 06:48:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C50E410AE;
	Sat, 25 Jun 2022 06:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C50E410AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 967861BF2C6
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83B4E42640
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83B4E42640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbylYJBM7z5J for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8800B4263C
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8800B4263C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 59E1787560; Sat, 25 Jun 2022 06:34:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 25 Jun 2022 08:43:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e51d503bcd9fabba539f3adb7df4000248b10400
X-Git-Newrev: aca69596a8463772912b5f28815d8bca71157401
X-Patchwork-Hint: ignore
Message-Id: <20220625063418.59E1787560@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/git-crypt: bump to version 0.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=aca69596a8463772912b5f28815d8bca71157401
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/AGWA/git-crypt/blob/0.7.0/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git-crypt/git-crypt.hash | 6 +++---
 package/git-crypt/git-crypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/git-crypt/git-crypt.hash b/package/git-crypt/git-crypt.hash
index 973432d7d0..5957a0273d 100644
--- a/package/git-crypt/git-crypt.hash
+++ b/package/git-crypt/git-crypt.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 6d30fcd99442d50f4b3c8d554067ff1d980cdf9f3120ee774131172dba98fd6f  git-crypt-0.6.0.tar.gz
+sha256  50f100816a636a682404703b6c23a459e4d30248b2886a5cf571b0d52527c7d8  git-crypt-0.7.0.tar.gz
 # Locally calculated
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256 506657e7a381165550e6c33e35b3b03bbef3e1feb68ba5529e264bd75ed2dc64  parse_options.hpp
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  506657e7a381165550e6c33e35b3b03bbef3e1feb68ba5529e264bd75ed2dc64  parse_options.hpp
diff --git a/package/git-crypt/git-crypt.mk b/package/git-crypt/git-crypt.mk
index 37e3d885a9..d562522485 100644
--- a/package/git-crypt/git-crypt.mk
+++ b/package/git-crypt/git-crypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_CRYPT_VERSION = 0.6.0
+GIT_CRYPT_VERSION = 0.7.0
 GIT_CRYPT_SITE = https://www.agwa.name/projects/git-crypt/downloads
 GIT_CRYPT_DEPENDENCIES = host-pkgconf openssl
 GIT_CRYPT_LICENSE = GPL-3.0+, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
