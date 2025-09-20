Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C85CAC5A7
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 19:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A144A41764;
	Sat, 20 Sep 2025 19:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfCPUuDuRVDp; Sat, 20 Sep 2025 19:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B531D41728
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B531D41728;
	Sat, 20 Sep 2025 19:39:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C903CD3
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 19:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA1CA6165F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 19:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPgpcXxftrCm for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 19:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8DDD60905
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8DDD60905
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 19:39:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAEDB85FEC; Sat, 20 Sep 2025 19:39:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Sep 2025 21:31:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35f7279ad355ab0760588f3bc850895db2a20521
X-Git-Newrev: d6c3257e931ed256e3ebcd78938f6146bba8586f
X-Patchwork-Hint: ignore
Message-Id: <20250920193947.BAEDB85FEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atf: bump to version 0.23
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d6c3257e931ed256e3ebcd78938f6146bba8586f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/freebsd/atf/releases/tag/atf-0.23

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/atf/atf.hash | 2 +-
 package/atf/atf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atf/atf.hash b/package/atf/atf.hash
index 5b4bbeb8e2..6cd2323ab0 100644
--- a/package/atf/atf.hash
+++ b/package/atf/atf.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  92bc64180135eea8fe84c91c9f894e678767764f6dbc8482021d4dde09857505  atf-0.21.tar.gz
+sha256  a64e2427d021297f25b3f2e1798f8ec4dc3061ffb01a1cd3f66cc4cee486b10f  atf-0.23.tar.gz
 sha256  2a15172ddf6386297734c9800c899e6e8dc16c5a03931dcf95a9ab321a24cfe4  COPYING
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
index 9630cf1a33..27c25c8b27 100644
--- a/package/atf/atf.mk
+++ b/package/atf/atf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATF_VERSION = 0.21
+ATF_VERSION = 0.23
 ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
 ATF_INSTALL_STAGING = YES
 ATF_LICENSE = BSD-2-Clause, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
