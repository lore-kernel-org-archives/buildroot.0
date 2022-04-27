Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C468C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15062409EF;
	Wed, 27 Apr 2022 19:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6tN3voQiYjz; Wed, 27 Apr 2022 19:01:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBC55409BC;
	Wed, 27 Apr 2022 19:01:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 227501BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 300B483163
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4461uo3afqNo for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5998E8316A
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B3A7584602; Wed, 27 Apr 2022 18:47:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 20:50:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 987988cee5aa6e934df7bee0d58ec5a23fffcc5f
X-Git-Newrev: c932b7bb9092d6004837a38c6e3562c1b10bba23
X-Patchwork-Hint: ignore
Message-Id: <20220427184726.B3A7584602@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpri: bump to version 1.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c932b7bb9092d6004837a38c6e3562c1b10bba23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

http://downloads.asterisk.org/pub/telephony/libpri/releases/libpri-1.6.0-summary.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libpri/libpri.hash | 4 ++--
 package/libpri/libpri.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpri/libpri.hash b/package/libpri/libpri.hash
index 47c4a00307..77985df96a 100644
--- a/package/libpri/libpri.hash
+++ b/package/libpri/libpri.hash
@@ -1,6 +1,6 @@
 # sha1 and sha256 from http://downloads.asterisk.org/pub/telephony/libpri/releases/
-sha1    63536f3300fb007dfd5fe8064406992ca938bd9a                          libpri-1.5.0.tar.gz
-sha256  ee224bc4aa65c54546bd09675c3f0b71817ce9e277332bce86989d8dcd556a24  libpri-1.5.0.tar.gz
+sha1  8440007477ebf131020afb00f57672b108b4db2c  libpri-1.6.0.tar.gz
+sha256  7225ea7ec334a115f9dc08e71f55589c38cb4e00b13964cd2f08cc4e6123e3f6  libpri-1.6.0.tar.gz
 
 # License files, locally calculated
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
diff --git a/package/libpri/libpri.mk b/package/libpri/libpri.mk
index 34d84393c4..48a1019210 100644
--- a/package/libpri/libpri.mk
+++ b/package/libpri/libpri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPRI_VERSION = 1.5.0
+LIBPRI_VERSION = 1.6.0
 LIBPRI_SITE = http://downloads.asterisk.org/pub/telephony/libpri/releases
 
 LIBPRI_LICENSE = GPL-2.0 with OpenH323 exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
