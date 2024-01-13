Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA46C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77A6F400E4;
	Sat, 13 Jan 2024 13:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77A6F400E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wSwIOVDcqQt; Sat, 13 Jan 2024 13:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B597F41FC1;
	Sat, 13 Jan 2024 13:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B597F41FC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 348F41BF867
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0152A41817
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0152A41817
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u03x5j4OT8pG for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 439F641822
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 439F641822
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41B0285FD8; Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 14:18:40 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 135dfcdb951c81197d4ceaff25f74f956f9ce69d
X-Git-Newrev: 9127d414894fb59da31a0c6f6cf951ff6df53961
X-Patchwork-Hint: ignore
Message-Id: <20240113135200.41B0285FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/glibc: drop extra
 ')' in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=9127d414894fb59da31a0c6f6cf951ff6df53961
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

No functional change.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1d97f8c41e18534cefbb4604a80e9ad687bf74d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 29411c58e2..596697bb8f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -20,7 +20,7 @@ GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
 GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
 GLIBC_CPE_ID_VENDOR = gnu
 
-# Extract the base version (e.g. 2.38) from GLIBC_VERSION) in order to
+# Extract the base version (e.g. 2.38) from GLIBC_VERSION in order to
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
