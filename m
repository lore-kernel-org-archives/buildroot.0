Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEEDC7EE29
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 16:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B1D442668;
	Sat, 10 Jun 2023 16:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B1D442668
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1LJL1GAXeV9; Sat, 10 Jun 2023 16:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F11B42649;
	Sat, 10 Jun 2023 16:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F11B42649
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6FC1BF32E
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 16:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9A4B60F53
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 16:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9A4B60F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1wzXomtd9bNK for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 16:29:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8ADE60F4D
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8ADE60F4D
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 16:29:48 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout06.t-online.de (Postfix) with SMTP id 76C2722F88
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 18:29:45 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd78.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q81TB-4ONlb70; Sat, 10 Jun 2023 18:29:41 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:52826)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q81TB-0007g8-0K
 for buildroot@buildroot.org; Sat, 10 Jun 2023 18:29:41 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 18:29:41 +0200
Message-Id: <20230610162941.1013899-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686414581-097C5714-DF877A9C/0/0 CLEAN NORMAL
X-TOI-MSGID: 4bae193c-ddb9-41d4-8dc2-2b2945116d4e
Subject: [Buildroot] [PATCH 1/1] package/icu: bump version to 73-1
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
