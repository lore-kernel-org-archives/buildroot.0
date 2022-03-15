Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54976C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A59B80A4B;
	Tue, 15 Mar 2022 21:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDvNxADNiDCD; Tue, 15 Mar 2022 21:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 483A4813CE;
	Tue, 15 Mar 2022 21:23:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BDFD1BF9B6
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42F48405A4
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2ggr242svBT for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:21:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E171C40580
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EF4F88408B; Tue, 15 Mar 2022 21:12:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:10:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5783a418f4b30931068b81f850fc06cd8d3d9732
X-Git-Newrev: a9c7e517e4b2e17d4a244da9268b4b0071bddc4a
X-Patchwork-Hint: ignore
Message-Id: <20220315211222.EF4F88408B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libss7: bump to version 2.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9c7e517e4b2e17d4a244da9268b4b0071bddc4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://downloads.asterisk.org/pub/telephony/libss7/releases/libss7-2.0.1-summary.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libss7/libss7.hash | 4 ++--
 package/libss7/libss7.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libss7/libss7.hash b/package/libss7/libss7.hash
index 8e1d6635db..442422fcd9 100644
--- a/package/libss7/libss7.hash
+++ b/package/libss7/libss7.hash
@@ -1,6 +1,6 @@
 # Hashes from http://downloads.asterisk.org/pub/telephony/libss7/releases/
-sha1    7112a0717293fc273d5d488e1387ad28abe4e9b3  libss7-2.0.0.tar.gz
-sha256  5af00853cfb2bc6bcf050947804db132ae6872db0cd2ab24b5378828f78eda52  libss7-2.0.0.tar.gz
+sha1  301fd3eff4387db6407cbc72c3fec9aed5bc3860  libss7-2.0.1.tar.gz
+sha256  091f1c14dcf13a094021334218cde363041816fa5b5037caee38719e4e6891c7  libss7-2.0.1.tar.gz
 
 # License file, locally calculated
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
diff --git a/package/libss7/libss7.mk b/package/libss7/libss7.mk
index 151b6a61b5..faa147c78e 100644
--- a/package/libss7/libss7.mk
+++ b/package/libss7/libss7.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSS7_VERSION = 2.0.0
+LIBSS7_VERSION = 2.0.1
 LIBSS7_SITE = http://downloads.asterisk.org/pub/telephony/libss7/releases
 
 LIBSS7_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
