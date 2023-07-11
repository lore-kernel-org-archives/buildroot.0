Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76602EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 141F741E75;
	Tue, 11 Jul 2023 21:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 141F741E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1FLNlURiMY6; Tue, 11 Jul 2023 21:52:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA63E41E98;
	Tue, 11 Jul 2023 21:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA63E41E98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FA591BF95F
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2854741E75
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2854741E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ClNHmsp7S-N for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:51:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E115416AC
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E115416AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 290B486E64; Tue, 11 Jul 2023 21:51:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 23:51:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 947cf4125e87eaa193de37d3a3fc5fcb885ad531
X-Git-Newrev: 7690f005e0540f888fa4333c2b93fee8f8ad2654
X-Patchwork-Hint: ignore
Message-Id: <20230711215156.290B486E64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189es: bump version to
 2023-07-08
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

commit: https://git.buildroot.net/buildroot/commit/?id=7690f005e0540f888fa4333c2b93fee8f8ad2654
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version fixes a wrong patching for Linux 6.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8189es/rtl8189es.hash | 2 +-
 package/rtl8189es/rtl8189es.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 64f6158654..4668c3832c 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  05d839c9b7820008bf7975c2f4a3dde6265dbae0c5dc48cefcee3a79492dc377  rtl8189es-ae7b31e55526ca0e01d2a3310118530bff4f1055.tar.gz
+sha256  0d59e75977a43e614c87e783d7af9d89b84063d8d0d1926820af427eacd01837  rtl8189es-05996691a5f3a61968a83f8b368454fd2c6885ca.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index a40f656d3e..e7bc915c79 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = ae7b31e55526ca0e01d2a3310118530bff4f1055
+RTL8189ES_VERSION = 05996691a5f3a61968a83f8b368454fd2c6885ca
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
