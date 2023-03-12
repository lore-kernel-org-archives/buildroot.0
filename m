Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61682C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 21:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 042DE40491;
	Sun, 12 Mar 2023 21:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 042DE40491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2HXIyvwIpD22; Sun, 12 Mar 2023 21:52:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE44940986;
	Sun, 12 Mar 2023 21:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE44940986
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 302421BF863
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC53D41626
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC53D41626
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bosylgRAT_vW for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B45C415FE
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B45C415FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1328587008; Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 10:09:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ecff27df15c2c22f7b9d8f7554119bc0346ff5b
X-Git-Newrev: da3ef3e8b828cc99f49c95ad6bef39c55f87e512
X-Patchwork-Hint: ignore
Message-Id: <20230312214624.1328587008@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lsof: bump to version 4.98.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=da3ef3e8b828cc99f49c95ad6bef39c55f87e512
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 4.96.5, see:
- https://github.com/lsof-org/lsof/releases/tag/4.97.0
- https://github.com/lsof-org/lsof/releases/tag/4.98.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lsof/lsof.hash | 2 +-
 package/lsof/lsof.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index 29cf443a24..b6a29b3cea 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e9030af1123ff052ab69e12ef55b8a17dc47ac4bccfba85ee1ca1f31acf29607  lsof-4.96.5.tar.gz
+sha256  80308a614508814ac70eb2ae1ed2c4344dcf6076fa60afc7734d6b1a79e62b16  lsof-4.98.0.tar.gz
 sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index fd5887141b..66911dddb9 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.96.5
+LSOF_VERSION = 4.98.0
 LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
