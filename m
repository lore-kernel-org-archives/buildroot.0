Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84B1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:27:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F11260F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F11260F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AB7A60A35;
	Tue,  3 Aug 2021 23:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15yO6QPd9oCz; Tue,  3 Aug 2021 23:27:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA1FD6066F;
	Tue,  3 Aug 2021 23:27:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B36541BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 591114068C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tt9tMVECy4P6 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CF3E40E4C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8EE8E82A39; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 13 Jul 2021 22:27:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c928abbed3762709dc5accb476340cf91e84a3a6
X-Git-Newrev: 99eb95fb47d220a2904eff86348ac3a0f6486ce9
X-Patchwork-Hint: ignore
Message-Id: <20210803211001.8EE8E82A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libdvdread: bump
 version to 6.1.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=99eb95fb47d220a2904eff86348ac3a0f6486ce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://code.videolan.org/videolan/libdvdread/-/blob/master/NEWS

Removed md5 hash, reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libdvdread/libdvdread.hash | 12 +++++-------
 package/libdvdread/libdvdread.mk   |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index 00066619ce..de9afcfa30 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,9 +1,7 @@
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.1/libdvdread-6.1.1.tar.bz2.md5
-md5 09c7423568fb679279fd2a2bc6b10b6e libdvdread-6.1.1.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.1/libdvdread-6.1.1.tar.bz2.sha1
-sha1 d2e5056de89fb5fed478c0af5a72e8b781d0c396 libdvdread-6.1.1.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.1/libdvdread-6.1.1.tar.bz2.sha256
-sha256 3e357309a17c5be3731385b9eabda6b7e3fa010f46022a06f104553bf8e21796 libdvdread-6.1.1.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.1.2/libdvdread-6.1.2.tar.bz2.sha1
+sha1  789d0780fbdcd7d6dadf0fda3d4a4b6198c16393  libdvdread-6.1.2.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.1.2/libdvdread-6.1.2.tar.bz2.sha256
+sha256  cc190f553758ced7571859e301f802cb4821f164d02bfacfd320c14a4e0da763  libdvdread-6.1.2.tar.bz2
 
 # Hash for license file:
-sha256	d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572	COPYING
+sha256  d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572  COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index aa91d3162a..9ddb6721c7 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 6.1.1
+LIBDVDREAD_VERSION = 6.1.2
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
 LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
