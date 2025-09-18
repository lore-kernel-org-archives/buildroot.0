Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CD8CAC5A8
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FB558238A;
	Fri, 19 Sep 2025 12:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prg685-tz8Zk; Fri, 19 Sep 2025 12:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 584B4822D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 584B4822D6;
	Fri, 19 Sep 2025 12:43:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4164E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2E3240C14
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2FRFiKDfbsmF for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6ACF40C35
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6ACF40C35
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4EFA85E80; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 16:44:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e1615fc4bd10a83cf75c7b0b4f603252c6203413
X-Git-Newrev: c7b0a9d4caf84a315b91202a8a7a570eb8ffa3e7
X-Patchwork-Hint: ignore
Message-Id: <20250919124235.C4EFA85E80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pcre2: bump
 version to 10.45
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2161871352028781820=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2161871352028781820==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c7b0a9d4caf84a315b91202a8a7a570eb8ffa3e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes:
https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.45
https://github.com/PCRE2Project/pcre2/blob/pcre2-10.45/NEWS#L4

Changelog:
https://github.com/PCRE2Project/pcre2/blob/release/pcre2-10.45/ChangeLog#L10

LICENCE file renamed to ‎LICENCE.md.
Update hash of the ‎LICENCE.md. (Addition of details on new maintainership).

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 89c7c6b6a8019a79376b0de85e7d1c04beaf0764)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pcre2/pcre2.hash | 6 +++---
 package/pcre2/pcre2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 8b22040ba7..35b87ad854 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature:
-# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.44/pcre2-10.44.tar.bz2.sig
-sha256  d34f02e113cf7193a1ebf2770d3ac527088d485d4e047ed10e5d217c6ef5de96  pcre2-10.44.tar.bz2
+# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.45/pcre2-10.45.tar.bz2.sig
+sha256  21547f3516120c75597e5b30a992e27a592a31950b5140e7b8bfde3f192033c4  pcre2-10.45.tar.bz2
 # Locally computed
-sha256  030087e2e8dd7c1bdd26057d25d4ded8f45bbf01ad458d68665ad04b8b0fbedf  LICENCE
+sha256  9cf7ac6976099a1d856826d3ef1b093bd6b84489dc6100628ac79e740cf9885a  LICENCE.md
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 191596181a..6d2b729dfe 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.44
+PCRE2_VERSION = 10.45
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
-PCRE2_LICENSE_FILES = LICENCE
+PCRE2_LICENSE_FILES = LICENCE.md
 PCRE2_CPE_ID_VENDOR = pcre
 PCRE2_INSTALL_STAGING = YES
 PCRE2_CONFIG_SCRIPTS = pcre2-config

--===============2161871352028781820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2161871352028781820==--
