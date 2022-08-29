Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F6FC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA05640BAD;
	Sun, 11 Sep 2022 08:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA05640BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSITaSNLAYvn; Sun, 11 Sep 2022 08:57:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD4D940B8A;
	Sun, 11 Sep 2022 08:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD4D940B8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A44A31BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F61A409AC
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F61A409AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8wxdkS0IfMt for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A577409BB
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A577409BB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 884E883624; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 22:16:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b5caa2ab45d7ec01e1657b10f94c2f60c7afe8e
X-Git-Newrev: 6c24f7cb8da5651bdfbcb40da5c762e1e85a93fc
X-Patchwork-Hint: ignore
Message-Id: <20220911084828.884E883624@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/most: bump version to 5.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c24f7cb8da5651bdfbcb40da5c762e1e85a93fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The COPYRIGHT file hash has changed due to:

- Copyright (c) 1991, 1999, 2002, 2005-2018,2019 John E. Davis
+ Copyright (c) 1991, 1999, 2002, 2005-2021, 2022 John E. Davis

Signed-off-by: Sven Oliver Moll <svolli@svolli.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/most/most.hash | 6 +++---
 package/most/most.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/most/most.hash b/package/most/most.hash
index db0eb6db59..ec9da9adcd 100644
--- a/package/most/most.hash
+++ b/package/most/most.hash
@@ -1,6 +1,6 @@
 # From https://www.jedsoft.org/releases/most/
-sha1  db811669a6b22c15478c957b439b5e4483ce1c95  most-5.1.0.tar.gz
+sha1  322073ee6e8c45ce084f4fccd08d3f026aa1f66d  most-5.2.0.tar.gz
 # Locally computed
-sha256  db805d1ffad3e85890802061ac8c90e3c89e25afb184a794e03715a3ed190501  most-5.1.0.tar.gz
+sha256  9455aeb8f826fa8385c850dc22bf0f22cf9069b3c3423fba4bf2c6f6226d9903  most-5.2.0.tar.gz
 sha256  1b2a567f289f66a143c56353e7b3d4fa5862514a5e3c5cfdf8b02ee5e5aaa953  COPYING
-sha256  47ad1c3f9b94d6ec42d9bee6c5df980c5c2daa5b9d22113545ae6a3f21ca2f52  COPYRIGHT
+sha256  3d8f860532c9f202db9300375fb29a1e7b32f538c6033e7013266ad55317fc3e  COPYRIGHT
diff --git a/package/most/most.mk b/package/most/most.mk
index 28d82cddf1..24627c046a 100644
--- a/package/most/most.mk
+++ b/package/most/most.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MOST_SITE = http://www.jedsoft.org/releases/most
-MOST_VERSION = 5.1.0
+MOST_VERSION = 5.2.0
 MOST_LICENSE = GPL-2.0+
 MOST_LICENSE_FILES = COPYING COPYRIGHT
 MOST_DEPENDENCIES = slang
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
