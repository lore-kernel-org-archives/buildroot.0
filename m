Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE61C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 12:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92FC7404F7;
	Sun, 11 Jun 2023 12:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92FC7404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4C80EB58LaLk; Sun, 11 Jun 2023 12:31:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A76C8401AE;
	Sun, 11 Jun 2023 12:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A76C8401AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F8A71BF403
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 12:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24D33416D3
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 12:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24D33416D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJVS1AfXvQwH for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 12:31:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA23A416D2
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA23A416D2
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 12:31:12 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout03.t-online.de (Postfix) with SMTP id 7866F44341;
 Sun, 11 Jun 2023 14:31:10 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd89.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8KDs-24IxqD0; Sun, 11 Jun 2023 14:31:08 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:33660)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8KDs-0001lo-0z;
 Sun, 11 Jun 2023 14:31:08 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 14:31:08 +0200
Message-Id: <20230611123108.372959-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611123108.372959-1-bernd.kuhls@t-online.de>
References: <20230611123108.372959-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686486668-FA7EF283-1B2B6754/0/0 CLEAN NORMAL
X-TOI-MSGID: 69f82362-dcfa-47cf-a78d-14024c3e56cb
Subject: [Buildroot] [PATCH 2/2] package/icu: bump version to 73-1
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hash due to copyright year bump:
https://github.com/unicode-org/icu/commit/9e16711b54d055cad10f7dc59f19d124ca6618be

Release notes:
https://icu.unicode.org/download/71
https://icu.unicode.org/download/72
https://icu.unicode.org/download/73

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
