Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64DCEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EF71408B6;
	Wed, 12 Jul 2023 19:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EF71408B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LHGzROg-5RZd; Wed, 12 Jul 2023 19:50:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB3341F0E;
	Wed, 12 Jul 2023 19:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DB3341F0E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EAD61BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB739408A1
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB739408A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zVkFppV6pCZ5 for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:49:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB4964007B
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB4964007B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4E6286EFC; Wed, 12 Jul 2023 19:49:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 21:48:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c337d25c05951b9bc8858b568203078e008d882
X-Git-Newrev: fb4cf1cbe8f83df4811b71fb9c5ff567b5c68924
X-Patchwork-Hint: ignore
Message-Id: <20230712194945.C4E6286EFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/icu: bump to version 73-2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fb4cf1cbe8f83df4811b71fb9c5ff567b5c68924
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/icu/icu.hash | 2 +-
 package/icu/icu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 77d5a9269c..0948bf495e 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a457431de164b4aa7eca00ed134d00dfbf88a77c6986a10ae7774fc076bb8c45  icu4c-73_1-src.tgz
+sha256  818a80712ed3caacd9b652305e01afc7fa167e6f2e94996da44b90c2ab604ce1  icu4c-73_2-src.tgz
 sha256  f3005e195ff74d8812cc1f182a1c446fab678d70a10e3dada497585befee5416  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 96ac5cef61..d4be2e4e8f 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 73-1
+ICU_VERSION = 73-2
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
