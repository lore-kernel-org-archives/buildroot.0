Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEDDCFA474
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88E7840287;
	Wed, 23 Oct 2024 21:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIAnGa99WOiw; Wed, 23 Oct 2024 21:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 090FB40256
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 090FB40256;
	Wed, 23 Oct 2024 21:15:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E54B7972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2394605AA
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQEouBpwZ7tB for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:15:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CDC460844
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CDC460844
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:15:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16A5186454; Wed, 23 Oct 2024 21:15:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:14:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 385729e6098ef3b6c5546aa743b2105376de6377
X-Git-Newrev: 4915d6001d283d8bc325697a160385bd831bd2c5
X-Patchwork-Hint: ignore
Message-Id: <20241023211538.16A5186454@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acpica: bump to version 20240927
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=4915d6001d283d8bc325697a160385bd831bd2c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 20240321, see:
https://github.com/user-attachments/files/17171011/changes.txt

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpica/acpica.hash | 3 +--
 package/acpica/acpica.mk   | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 4170587f3a..c3e7fda340 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,4 +1,3 @@
-# From: https://www.intel.com/content/www/us/en/download/776303/acpi-component-architecture-downloads-unix-format-source-code-and-build-environment-with-an-intel-license.html
-sha256  54a299487925fd3e0551c95f9d5cee4f4984930273983eff67aa5cd46f8f338b  acpica-unix-20240321.tar.gz
 # locally computed hash
+sha256  57988fb55541e694dfa3323bd19db74b65d37e942bebef559ed51e8cd9348b43  acpica-unix-20240927.tar.gz
 sha256  b28f54dc421531bbe269afd8c28bf6fdfd6affbe50c2831464f777ec1766d4a5  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 5b1dfbbba2..a2abcf7558 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20240321
+ACPICA_VERSION = 20240927
 ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://github.com/acpica/acpica/files/14718333
+ACPICA_SITE = https://github.com/user-attachments/files/17171019
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
