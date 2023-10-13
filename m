Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7266CDB483
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 15:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E046F5C8;
	Fri, 13 Oct 2023 15:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E046F5C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q5uR11hJy2Rg; Fri, 13 Oct 2023 15:22:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 532E360F0B;
	Fri, 13 Oct 2023 15:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 532E360F0B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 725EA1BF37E
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5797E81BD9
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5797E81BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DcLNMuYTmztR for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 15:21:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E7FC81CA7
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 15:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E7FC81CA7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BA53848AE; Fri, 13 Oct 2023 15:21:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 17:18:33 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: ddf9ad1065b11c387d9d43e00675c11425dbc51c
X-Git-Newrev: 1f2a2b833830e91a5d8f4ce7cc908038e637927b
X-Patchwork-Hint: ignore
Message-Id: <20231013152134.2BA53848AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/efl: bump to
 version 1.26.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f2a2b833830e91a5d8f4ce7cc908038e637927b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

This is a bug-fix release.

See: https://www.enlightenment.org/news/2022-09-16-efl-1.26.3

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6037f9387a108f2dfc0add56a07073ee96f5f240)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 8d50400eb7..72ff3199d0 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,5 +1,5 @@
-# From https://www.enlightenment.org/news/2022-01-03-efl-1.26.1
-sha256  86a9677e3d48dd0c13a399ebb417bd417bd8d150d6b06cc491bc92275c88a642  efl-1.26.1.tar.xz
+# From https://www.enlightenment.org/news/2022-09-16-efl-1.26.3
+sha256  d9f83aa0fd9334f44deeb4e4952dc0e5144683afac786feebce6030951617d15  efl-1.26.3.tar.xz
 
 sha256  d666b6b2df9f5b791f85c299c65516cb55528b02a807603de246f65f4918ae22  COMPLIANCE
 sha256  5bceb52d65debe420bc520f2992807740dc928b7fdc3c2e9a74b5889177ddf4c  COPYING
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index d4a16475e5..29b3b1955a 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.26.1
+EFL_VERSION = 1.26.3
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = https://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
