Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22958C43334
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 17:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C66F260E78;
	Tue,  5 Jul 2022 17:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C66F260E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGatHYHpR_ft; Tue,  5 Jul 2022 17:26:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6ED260ED5;
	Tue,  5 Jul 2022 17:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6ED260ED5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 943201BF31C
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 17:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F8F381BF4
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 17:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F8F381BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQrMbwNc33tE for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 17:26:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FB2281BC6
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FB2281BC6
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 17:26:40 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout12.t-online.de (Postfix) with SMTP id E8BF61581B
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 19:26:38 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.181.254]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o8mJq-1i7VCr0; Tue, 5 Jul 2022 19:26:38 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:60928)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o8mJq-0004Hh-EK
 for buildroot@buildroot.org; Tue, 05 Jul 2022 19:26:38 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 19:26:38 +0200
Message-Id: <20220705172638.1304670-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1657041998-0143AB67-B6CCF939/0/0 CLEAN NORMAL
X-TOI-MSGID: ceba3900-1242-4a1e-a0c1-3551ba175c8c
Subject: [Buildroot] [PATCH 1/1] package/libass: bump version to 0.16.0
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

Changelog: https://github.com/libass/libass/blob/master/Changelog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libass/libass.hash | 2 +-
 package/libass/libass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index 33ed0c4fc7..b8952a4730 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1be2df9c4485a57d78bb18c0a8ed157bc87a5a8dd48c661961c625cb112832fd  libass-0.15.2.tar.xz
+sha256  5dbde9e22339119cf8eed59eea6c623a0746ef5a90b689e68a090109078e3c08  libass-0.16.0.tar.xz
 sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 93bfbe4e2e..4ba812e3fc 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.15.2
+LIBASS_VERSION = 0.16.0
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
