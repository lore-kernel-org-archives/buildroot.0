Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8051C0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 11:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89D9244625;
	Sat,  1 Feb 2025 11:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kFupFBFVQPw; Sat,  1 Feb 2025 11:54:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE94143D00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE94143D00;
	Sat,  1 Feb 2025 11:54:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E1A417D
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 11:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6EDE4027D
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 11:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3kWPhwFk8nu for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 11:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAEC240012
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAEC240012
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 11:54:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C50D886550; Sat,  1 Feb 2025 11:54:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 1 Feb 2025 12:52:13 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5382f887a0fe1a1ac120e8fed3a5724cd3d89bfd
X-Git-Newrev: 88084a7a6cd24977873aaf617ceafe5e7e0408f0
X-Patchwork-Hint: ignore
Message-Id: <20250201115438.C50D886550@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/acpica: bump to
 version 20240321
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

commit: https://git.buildroot.net/buildroot/commit/?id=88084a7a6cd24977873aaf617ceafe5e7e0408f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

For change log since 20230628, see [1].

License file hash changed in [2], due to year update.

The upstream download page also changed the published hash from sha1
to sha256. This change is reflected in the hash file.

[1] https://github.com/acpica/acpica/blob/G20240322/documents/changes.txt
[2] https://github.com/acpica/acpica/commit/c18edfb1abfb50521a363f811bc8e1e64213bd00

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 05a4e5d5a5a4c6f9fabcf65bb1b46840dc305e29)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpica/acpica.hash | 5 ++---
 package/acpica/acpica.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index dd9f8a1d22..4170587f3a 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,5 +1,4 @@
 # From: https://www.intel.com/content/www/us/en/download/776303/acpi-component-architecture-downloads-unix-format-source-code-and-build-environment-with-an-intel-license.html
-sha1  3b893fb771cf3fbd3531de3036e1a5bfc624c9d2  acpica-unix-20230628.tar.gz
+sha256  54a299487925fd3e0551c95f9d5cee4f4984930273983eff67aa5cd46f8f338b  acpica-unix-20240321.tar.gz
 # locally computed hash
-sha256  86876a745e3d224dcfd222ed3de465b47559e85811df2db9820ef09a9dff5cce  acpica-unix-20230628.tar.gz
-sha256  905d6f191f3c29aa673602d9c66eb8df00f7e1b35064a081e0de81284ff17ee6  source/include/acpi.h
+sha256  b28f54dc421531bbe269afd8c28bf6fdfd6affbe50c2831464f777ec1766d4a5  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index bbabd9de69..a3d682257d 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20230628
+ACPICA_VERSION = 20240321
 ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://downloadmirror.intel.com/783534
+ACPICA_SITE = https://downloadmirror.intel.com/819451
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
