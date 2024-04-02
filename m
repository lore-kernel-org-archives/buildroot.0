Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4A1C6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 20:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FCDD409C6;
	Tue,  2 Apr 2024 20:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZI1ejk7Mg5mK; Tue,  2 Apr 2024 20:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A10B3409B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A10B3409B3;
	Tue,  2 Apr 2024 20:02:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A3901BF369
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 20:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C13C281F57
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0MfNDFiKf3OP for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7D0481F49
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7D0481F49
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0BC78462B; Tue,  2 Apr 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Apr 2024 21:44:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a518322b3dc70e1d589d20b87c44f5fdafa25c6
X-Git-Newrev: 9689b075773edc837af9c33355f3ac34b35d5419
X-Patchwork-Hint: ignore
Message-Id: <20240402200226.D0BC78462B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinycompress: bump to version
 1.2.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=9689b075773edc837af9c33355f3ac34b35d5419
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For commit log, see:
https://github.com/alsa-project/tinycompress/commits/v1.2.11/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/tinycompress/tinycompress.hash | 2 +-
 package/tinycompress/tinycompress.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinycompress/tinycompress.hash b/package/tinycompress/tinycompress.hash
index 164f3a36c3..f86b75f346 100644
--- a/package/tinycompress/tinycompress.hash
+++ b/package/tinycompress/tinycompress.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  2f897e5112cd3bca6790b5cecfda6e0662c8bc5ee0fbab972b247a0cc620d66c  tinycompress-1.2.8.tar.bz2
+sha256  ebbe788c28328e7cca245aaf9194a5ad0dc91e9e0dc883c2cf9feb6d42c9f3fc  tinycompress-1.2.11.tar.bz2
 
 # Locally calculated
 sha256  912ea37a4435594a3b3c35f04efa4b5b7af2e68a05f5319c16c881711a31e4b7  COPYING
diff --git a/package/tinycompress/tinycompress.mk b/package/tinycompress/tinycompress.mk
index c9cfbb574b..fabd5884b2 100644
--- a/package/tinycompress/tinycompress.mk
+++ b/package/tinycompress/tinycompress.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCOMPRESS_VERSION = 1.2.8
+TINYCOMPRESS_VERSION = 1.2.11
 TINYCOMPRESS_SOURCE = tinycompress-$(TINYCOMPRESS_VERSION).tar.bz2
 TINYCOMPRESS_SITE = https://www.alsa-project.org/files/pub/tinycompress
 TINYCOMPRESS_LICENSE = BSD-3-Clause and LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
