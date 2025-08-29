Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A760CA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1537417A9;
	Fri, 29 Aug 2025 08:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5ORFmOIkvF9; Fri, 29 Aug 2025 08:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3091A41792
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3091A41792;
	Fri, 29 Aug 2025 08:44:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DA5FD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6414B6153F
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giz3hrwpnaAs for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0ACD61506
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0ACD61506
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBE6287D03; Fri, 29 Aug 2025 08:44:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 10:43:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ef62f8121932381635a1addada1f073e09ec2bbc
X-Git-Newrev: 4dc68655682388c34339abcd76192718cf0786da
X-Patchwork-Hint: ignore
Message-Id: <20250829084455.BBE6287D03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/acpica: bump to
 version 20250807
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4dc68655682388c34339abcd76192718cf0786da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log since 20241212, see:
https://github.com/acpica/acpica/blob/20250807/documents/changes.txt

License file hash is changed after a year update in upstream commit:
https://github.com/acpica/acpica/commit/53553c302b5fc57afe55dd3d96ce3aa861dea1df

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpica/acpica.hash | 4 ++--
 package/acpica/acpica.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 9972e34b3b..e88107e9c7 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  9dca83cfee390b710485fbdf787048370049c05723b10cc220cfef6e13c31961  acpica-unix-20241212.tar.gz
-sha256  b28f54dc421531bbe269afd8c28bf6fdfd6affbe50c2831464f777ec1766d4a5  source/include/acpi.h
+sha256  eaca4c0248db872a055ab38b0deab4f5f577d1a0cada0fcbc0d80955e2a98e33  acpica-unix-20250807.tar.gz
+sha256  dbfa87ff77586ffd8da1185981a9695e80db09b114b3b00c194a9bcc2292a95e  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 2c97c04367..e236a81ed0 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20241212
+ACPICA_VERSION = 20250807
 ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://github.com/user-attachments/files/18117992
+ACPICA_SITE = https://github.com/user-attachments/files/21674610
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
