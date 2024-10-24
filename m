Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B77D1036C
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92A1981238;
	Thu, 24 Oct 2024 20:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9QyVf7jjbEo; Thu, 24 Oct 2024 20:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A85A881225
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A85A881225;
	Thu, 24 Oct 2024 20:47:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5C044960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A08E641C74
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHsxvafWSw-U for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ECBB419B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ECBB419B3
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:47:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7729B835F8; Thu, 24 Oct 2024 20:47:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 22:46:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1dc370cc9009b5362aad5e2e481703f0ca76b4a2
X-Git-Newrev: 0631d70eb1c9b47fe9c86b47b2646897d419c78e
X-Patchwork-Hint: ignore
Message-Id: <20241024204750.7729B835F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acsccid: bump to version 1.1.11
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0631d70eb1c9b47fe9c86b47b2646897d419c78e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/p/acsccid/news/2024/03/acsccid-1111-released/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acsccid/acsccid.hash | 8 ++++----
 package/acsccid/acsccid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
index 5310d78144..e5fe669ceb 100644
--- a/package/acsccid/acsccid.hash
+++ b/package/acsccid/acsccid.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.10/
-sha1  6284a693b8edb511f2f80d9069af9b4a41fd55ae  acsccid-1.1.10.tar.bz2
-md5  4d2b7f34414aed029084c96dd05a0e7d  acsccid-1.1.10.tar.bz2
+# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.11/
+sha1  75d3d17fb9d9ee7d0b291b460e2c6eb3c71654c5  acsccid-1.1.11.tar.bz2
+md5  0bbbce89a934861b7c5b003da962f1d9  acsccid-1.1.11.tar.bz2
 # Locally computed
-sha256  5ee112febdcac6656629025f3a85923f155f6ca150b2d24fd716f9043265528e  acsccid-1.1.10.tar.bz2
+sha256  2fcda6ed1f5d2f07e202b51f9a600a61c83e1a73a96f51ed0f9e4f781c9c1282  acsccid-1.1.11.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index 463f0f24d6..93cca8e09d 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACSCCID_VERSION = 1.1.10
+ACSCCID_VERSION = 1.1.11
 ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
 ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
 ACSCCID_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
