Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40125C7EE2F
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 15:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E17A58422A;
	Sat, 10 Jun 2023 15:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E17A58422A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4M2Us4C3PM0; Sat, 10 Jun 2023 15:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2441F83B18;
	Sat, 10 Jun 2023 15:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2441F83B18
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6741BF38C
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 15:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AE67405A1
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 15:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AE67405A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QT31E337a6Xp for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 15:44:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDF4840260
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDF4840260
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 15:44:46 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout05.t-online.de (Postfix) with SMTP id 0DE17C6D9;
 Sat, 10 Jun 2023 17:44:44 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd81.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q80ld-0Y5mwz0; Sat, 10 Jun 2023 17:44:41 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:39204)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q80lc-0008LN-2d;
 Sat, 10 Jun 2023 17:44:40 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 17:44:40 +0200
Message-Id: <20230610154440.938853-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686411881-DBFFDDA8-EEFBD542/0/0 CLEAN NORMAL
X-TOI-MSGID: 6dff6103-d344-4c41-8fe2-7eb4516f78c6
Subject: [Buildroot] [PATCH 1/1] package/gnu-efi: bump version to 3.0.17
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed md5 hash, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gnu-efi/gnu-efi.hash | 3 +--
 package/gnu-efi/gnu-efi.mk   | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index 251a99e5d7..4e282f9c54 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,6 +1,5 @@
 # From http://sourceforge.net/projects/gnu-efi/files
-md5  192d94e995ddd4ebdce4903adfd06039  gnu-efi-3.0.15.tar.bz2
-sha1  40c8a4715cf8c409a093c8d2ca9f5d5b24d73058  gnu-efi-3.0.15.tar.bz2
+sha1  9715285022124b231520d58b26709f5ab338e981  gnu-efi-3.0.17.tar.bz2
 # Locally computed
 sha256  931a257b9c5c1ba65ff519f18373c438a26825f2db7866b163e96d1b168f20ea  gnu-efi-3.0.15.tar.bz2
 sha256  42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  README.efilib
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 93b5888370..b205c197d5 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 3.0.15
+GNU_EFI_VERSION = 3.0.17
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
-GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
+GNU_EFI_SITE = https://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
 GNU_EFI_LICENSE = BSD-3-Clause and/or GPL-2.0+ (gnuefi), BSD-3-Clause (efilib)
 GNU_EFI_LICENSE_FILES = README.efilib
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
