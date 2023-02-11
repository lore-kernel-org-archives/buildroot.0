Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B691C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 18:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6C49415C9;
	Sat, 11 Feb 2023 18:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6C49415C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blJCrYob47nk; Sat, 11 Feb 2023 18:22:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC7C4159D;
	Sat, 11 Feb 2023 18:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC7C4159D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A6A31BF59D
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D3D360AB5
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D3D360AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2qv8hi6nHOV for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 18:22:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C7D460AA5
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C7D460AA5
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 18:22:27 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout05.t-online.de (Postfix) with SMTP id 37E51D402
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 19:22:02 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.202.51]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pQuVd-31gyi90; Sat, 11 Feb 2023 19:22:01 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:54344)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pQuVc-0006CS-2u
 for buildroot@buildroot.org; Sat, 11 Feb 2023 19:22:00 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 19:22:00 +0100
Message-Id: <20230211182200.227946-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676139721-D53B29DF-8574E919/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b294e8d-b37c-49fc-ae5a-89939b85428d
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.2.2
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

Release notes: https://news-web.php.net/php.announce/345

Changelog: https://www.php.net/ChangeLog-8.php#8.2.2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index a9c3b7640b..869cb9b94f 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  650d3bd7a056cabf07f6a0f6f1dd8ba45cd369574bbeaa36de7d1ece212c17af  php-8.2.1.tar.xz
+sha256  bdc4aa38e652bac86039601840bae01c0c3653972eaa6f9f93d5f71953a7ee33  php-8.2.2.tar.xz
 
 # License file
 sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 372d55f68a..9ce153f4fa 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.1
+PHP_VERSION = 8.2.2
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
