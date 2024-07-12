Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCABC3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7623541704;
	Fri, 12 Jul 2024 20:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUBWYEOxs83A; Fri, 12 Jul 2024 20:27:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FCE84174A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FCE84174A;
	Fri, 12 Jul 2024 20:27:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23E161BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AF0041A3E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qexP6y-H26wv for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:27:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4046841704
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4046841704
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:27:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35861861DF; Fri, 12 Jul 2024 20:27:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:25:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50049eb8a66e966f1f42fbd4494af4c4c1ec3ff3
X-Git-Newrev: 093aac9a2f0cf6b3ae97f68f4f774c0b5edd3df2
X-Patchwork-Hint: ignore
Message-Id: <20240712202704.35861861DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mokutil: bump to version 0.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=093aac9a2f0cf6b3ae97f68f4f774c0b5edd3df2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://github.com/lcp/mokutil/releases/tag/0.7.2

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mokutil/mokutil.hash | 2 +-
 package/mokutil/mokutil.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mokutil/mokutil.hash b/package/mokutil/mokutil.hash
index 86555e6f4d..4eb8414d1b 100644
--- a/package/mokutil/mokutil.hash
+++ b/package/mokutil/mokutil.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1c0bcba3d2f4ab98235b1edb5eb71b40508f79d93d3e28b1a04b7fbd4a2c1457  mokutil-0.7.1.tar.gz
+sha256  839d677c4fc9805f1565703ca32863e4652692c53da66a88ae9b9e30676f9e17  mokutil-0.7.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mokutil/mokutil.mk b/package/mokutil/mokutil.mk
index f176fa5bee..de379991ac 100644
--- a/package/mokutil/mokutil.mk
+++ b/package/mokutil/mokutil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOKUTIL_VERSION = 0.7.1
+MOKUTIL_VERSION = 0.7.2
 MOKUTIL_SITE = $(call github,lcp,mokutil,$(MOKUTIL_VERSION))
 MOKUTIL_LICENSE = GPL-3.0+
 MOKUTIL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
