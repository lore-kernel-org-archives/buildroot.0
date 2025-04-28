Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D138C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C62DE70A27;
	Mon, 19 May 2025 10:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5GKYA8z_p_3; Mon, 19 May 2025 10:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F56270A19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F56270A19;
	Mon, 19 May 2025 10:56:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 29566D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1854540E0A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyKLABhbnh1X for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA328412B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA328412B1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE2B18348A; Mon, 19 May 2025 10:39:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 28 Apr 2025 22:06:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 609ea9789f1b714c182424a3f18aa402c9766e80
X-Git-Newrev: 78d38611730942db4636fd8a57b71521369faa0a
X-Patchwork-Hint: ignore
Message-Id: <20250519103957.DE2B18348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ncftp: bump to version
 3.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=78d38611730942db4636fd8a57b71521369faa0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://www.ncftp.com/ncftp/doc/changelog.html

Fixes:
https://autobuild.buildroot.org/results/103b86c5473077cd95a245a762059a23f78c1a44/build-end.log

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ncftp/ncftp.hash | 2 +-
 package/ncftp/ncftp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncftp/ncftp.hash b/package/ncftp/ncftp.hash
index a9414d62f5..029e4c6d43 100644
--- a/package/ncftp/ncftp.hash
+++ b/package/ncftp/ncftp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f1108e77782376f8aec691f68297a3364a9a7c2d9bb12e326f550ff9770f47a7  ncftp-3.2.9-src.tar.gz
+sha256  7920f884c2adafc82c8e41c46d6f3d22698785c7b3f56f5677a8d5c866396386  ncftp-3.3.0-src.tar.gz
 sha256  4fe2f063d25d79c49712a272ebb68e050c703eed9c66c80108427edfe3285580  doc/LICENSE.txt
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index fa46bc3339..c56fc86848 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCFTP_VERSION = 3.2.9
+NCFTP_VERSION = 3.3.0
 NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.gz
 NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp
 NCFTP_TARGET_BINS = ncftp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
