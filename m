Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAE1EC873B
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 886DE813E8;
	Thu,  7 Sep 2023 15:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 886DE813E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tgh5GCn7D6IU; Thu,  7 Sep 2023 15:38:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC3AA813F7;
	Thu,  7 Sep 2023 15:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC3AA813F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22B981BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A02141E36
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A02141E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMIilcW20BRe for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF80141E47
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF80141E47
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8B00869E0; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 23:28:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8332e66b4f063eb842bb934e4806a26f3cacfd2
X-Git-Newrev: a1f351a8db1bbf20c6b766bc4dacdf3eca767e45
X-Patchwork-Hint: ignore
Message-Id: <20230907145133.A8B00869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzip: bump to version 1.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1f351a8db1bbf20c6b766bc4dacdf3eca767e45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Release note libzip 1.10.1:
https://libzip.org/news/release-1.10.1.html
- Release note libzip 1.10.0:
https://libzip.org/news/release-1.10.0.html
- API changes between 1.9.x to 1.10.x:
https://github.com/nih-at/libzip/blob/v1.10.1/API-CHANGES.md

Signed-off-by: Charlie LEGER <c.leger@borea-dental.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libzip/libzip.hash | 2 +-
 package/libzip/libzip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index 26c038e4b6..93dcb49042 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c93e9852b7b2dc931197831438fee5295976ee0ba24f8524a8907be5c2ba5937  libzip-1.9.2.tar.xz
+sha256  dc3c8d5b4c8bbd09626864f6bcf93de701540f761d76b85d7c7d710f4bd90318  libzip-1.10.1.tar.xz
 sha256  01c022eca6d566e2e8792fd0f091a28653b2a608319922bcd4de91c49d1438e1  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 0c9d66d877..cf85bfa8ce 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.9.2
+LIBZIP_VERSION = 1.10.1
 LIBZIP_SITE = https://libzip.org/download
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
