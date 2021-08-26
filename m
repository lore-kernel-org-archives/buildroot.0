Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBB0C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:16:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F05F60184
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F05F60184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E69A440765;
	Thu, 26 Aug 2021 22:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p6lHSLPH8lCl; Thu, 26 Aug 2021 22:16:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CAC340785;
	Thu, 26 Aug 2021 22:16:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0C21BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F4C8614AF
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id js6JdledRJ6I for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09C06614B5
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5EAE68DC52; Thu, 26 Aug 2021 22:01:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 26 Aug 2021 23:41:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7dac56b76e8b081b01ba5d979d0f842c5cfed5bc
X-Git-Newrev: e17e37bcea2a1e96bd3caf608a0265fac9e05bfa
X-Patchwork-Hint: ignore
Message-Id: <20210826220134.5EAE68DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/glibc: bump version to
 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
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

commit: https://git.buildroot.net/buildroot/commit/?id=e17e37bcea2a1e96bd3caf608a0265fac9e05bfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../glibc.hash                                                          | 2 +-
 package/glibc/glibc.mk                                                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash b/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/glibc.hash
similarity index 70%
rename from package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
rename to package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/glibc.hash
index 4b8d8297ec..595de95a58 100644
--- a/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
+++ b/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  3e2004b16ec6b79a19a88ed4736719ef9e419f9d8e7013faced654c0339e23dc  glibc-2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f.tar.gz
+sha256  1c7ed0f69ed268bd66f9754d0cb8fb65e0dafc1f9a1048ea50d1e96d60399686  glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 1eff245588..c911c29554 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -11,7 +11,7 @@ else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
+GLIBC_VERSION = 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
