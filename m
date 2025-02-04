Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB97C02197
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE2D08115D;
	Tue,  4 Feb 2025 15:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eks32WGc0nt; Tue,  4 Feb 2025 15:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 077D58118E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 077D58118E;
	Tue,  4 Feb 2025 15:01:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41ABC185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26CBF811A2
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pv7dtL4QJMFt for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 437158115D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 437158115D
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:01:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EF7D86B95; Tue,  4 Feb 2025 15:01:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 15:57:17 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 07c2958106ea0cf6c408a0ab299d3a1811f05aad
X-Git-Newrev: 51991994564c0ae5bcac159c42031238b755cc71
X-Patchwork-Hint: ignore
Message-Id: <20250204150110.2EF7D86B95@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/busybox: fix
 patch 0009 formatting
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

commit: https://git.buildroot.net/buildroot/commit/?id=51991994564c0ae5bcac159c42031238b755cc71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

As it is, patch 0009 cannot be applied with "git am", so fix its
format.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c29f6393ab37d0c8816d70bf21b118ed778f790d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...onfig-gcc-failing-saying-ncurses-is-not-found.patch | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
index 4651d8c2c9..f4a926ae37 100644
--- a/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
+++ b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
@@ -1,6 +1,6 @@
-From ctxnop@gmail.com  Sun Jul 21 12:10:52 2024
-From: ctxnop@gmail.com (Nop)
-Date: Sun, 21 Jul 2024 14:10:52 +0200
+From 32949508fe566aee8988cb6d8ee101ecc5e49a65 Mon Sep 17 00:00:00 2001
+From: ctxnop <ctxnop@gmail.com>
+Date: Sun, 26 Jan 2025 20:59:20 +0100
 Subject: [PATCH] menuconfig: GCC failing saying ncurses is not found
 
 Newer GCC increased diagnostics levels resulting in considering the
@@ -17,13 +17,12 @@ Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
  scripts/kconfig/lxdialog/check-lxdialog.sh | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh
-b/scripts/kconfig/lxdialog/check-lxdialog.sh
-index 5075ebf2d..c644d1d48 100755
+diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
+index 5075ebf2d..08e4da3de 100755
 --- a/scripts/kconfig/lxdialog/check-lxdialog.sh
 +++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
 @@ -45,9 +45,9 @@ trap "rm -f $tmp" 0 1 2 3 15
-
+ 
  # Check if we can link to ncurses
  check() {
 -        $cc -x c - -o $tmp 2>/dev/null <<'EOF'
@@ -34,5 +33,6 @@ index 5075ebf2d..c644d1d48 100755
  EOF
  	if [ $? != 0 ]; then
  	    echo " *** Unable to find the ncurses libraries or the"       1>&2
---
-2.45.2
+-- 
+2.47.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
