Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5DDEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 20:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D742404A5;
	Mon, 10 Jul 2023 20:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D742404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0WfTUl1O_e2; Mon, 10 Jul 2023 20:12:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 808CE40A65;
	Mon, 10 Jul 2023 20:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 808CE40A65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1FA1BF399
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7E3441794
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7E3441794
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQGw4S829Jb0 for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 20:12:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA51B4177F
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 20:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA51B4177F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D862C86D2D; Mon, 10 Jul 2023 20:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 22:11:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84da7d929113881aad6a4f57ba1f21c54554b3e7
X-Git-Newrev: 43d4947fc28de3a57e4bbf0220daa85241548f0e
X-Patchwork-Hint: ignore
Message-Id: <20230710201248.D862C86D2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/icu: bump version to 73-1
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

commit: https://git.buildroot.net/buildroot/commit/?id=43d4947fc28de3a57e4bbf0220daa85241548f0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to copyright year bump:
https://github.com/unicode-org/icu/commit/9e16711b54d055cad10f7dc59f19d124ca6618be

Release notes:
https://icu.unicode.org/download/71
https://icu.unicode.org/download/72
https://icu.unicode.org/download/73

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/icu/icu.hash | 4 ++--
 package/icu/icu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 56a0a5dd53..77d5a9269c 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8d205428c17bf13bb535300669ed28b338a157b1c01ae66d31d0d3e2d47c3fd5  icu4c-70_1-src.tgz
-sha256  861671f8c712aa046f8f5ac89239e6c33821636516c5d0cc8c4e1973085f27a6  LICENSE
+sha256  a457431de164b4aa7eca00ed134d00dfbf88a77c6986a10ae7774fc076bb8c45  icu4c-73_1-src.tgz
+sha256  f3005e195ff74d8812cc1f182a1c446fab678d70a10e3dada497585befee5416  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 8107796ae9..96ac5cef61 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 70-1
+ICU_VERSION = 73-1
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
