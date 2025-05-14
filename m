Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B991EC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8996742406;
	Fri, 16 May 2025 11:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3Uvs_tMDs04; Fri, 16 May 2025 11:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB1644242B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB1644242B;
	Fri, 16 May 2025 11:23:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BC7713D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0724761263
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LoBtLjaGU96T for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42DA660B2B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42DA660B2B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E7087FDC5; Fri, 16 May 2025 11:21:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 20:58:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ea608f3cb4cbf6eb28eb3b1002a03a0eb956437b
X-Git-Newrev: ef267ae564fd531f78025d2fa8c70e0ef4871f84
X-Patchwork-Hint: ignore
Message-Id: <20250516112154.3E7087FDC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ncftp: bump to
 version 3.3.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ef267ae564fd531f78025d2fa8c70e0ef4871f84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For change log, see:
https://www.ncftp.com/ncftp/doc/changelog.html

Fixes:
https://autobuild.buildroot.org/results/103b86c5473077cd95a245a762059a23f78c1a44/build-end.log

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 78d38611730942db4636fd8a57b71521369faa0a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
