Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920B9C32773
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 06:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 205E9408A6;
	Tue, 16 Aug 2022 06:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 205E9408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lO1a42p2kdUe; Tue, 16 Aug 2022 06:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3660640607;
	Tue, 16 Aug 2022 06:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3660640607
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50DFD1BF9B9
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 06:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A9C760EE4
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 06:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A9C760EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJ2q27-oNZxu for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 06:43:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7979860E7B
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 06:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7979860E7B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 77AE3876BE; Tue, 16 Aug 2022 06:28:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 08:38:49 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 3068edf19d34bc5e3fa0b2396af281024b94fcdf
X-Git-Newrev: 6a7e7e2016c75c196a0023bc9f2df08ec97ee043
X-Patchwork-Hint: ignore
Message-Id: <20220816062850.77AE3876BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libkrb5: fix
 LICENSE list
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a7e7e2016c75c196a0023bc9f2df08ec97ee043
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The NOTICE file contains a long list of licenses. A few of them are MIT,
BSD-2-Clause, BSD-3-Clause, or BSD-4-Clause. And then there are many
that are somewhat similar but not exactly.

Mention all the "known" licenses in LIBKRB5_LICENSE, and add "others" to
indicate that there is more.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 3cffd1d68bfeb30c2e4aa826550d5f5aeb7b4678)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libkrb5/libkrb5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index bd751d9c77..ea2d71a8cc 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -9,7 +9,7 @@ LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).4
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
-LIBKRB5_LICENSE = MIT
+LIBKRB5_LICENSE = MIT, BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, others
 LIBKRB5_LICENSE_FILES = NOTICE
 LIBKRB5_CPE_ID_VENDOR = mit
 LIBKRB5_CPE_ID_PRODUCT = kerberos_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
