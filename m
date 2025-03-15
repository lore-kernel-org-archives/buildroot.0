Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DCEC28B2F
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0569832D1;
	Tue, 18 Mar 2025 15:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wY9Hu15_x_h7; Tue, 18 Mar 2025 15:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4CE9831DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4CE9831DB;
	Tue, 18 Mar 2025 15:07:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4718D5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C3BE40DF8
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73b6W8PU56Jc for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 760FE409DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 760FE409DE
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70D7E880EF; Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 15:06:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13a8275c2a9c8f9adc5f9d65e66673f070c4a2a0
X-Git-Newrev: 2522130175e5d8ec5c779335b9d6f237b278df56
X-Patchwork-Hint: ignore
Message-Id: <20250318150244.70D7E880EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-fm-ucode: bump version to
 lf-6.6.52-2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2522130175e5d8ec5c779335b9d6f237b278df56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package is unchanged; a new tag was added to match other NXP QorIQ package versions.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Reviewed-by: Brandon Maier <brandon.maier@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash | 2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
index 67efd675cc..bf494b177b 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c994367c74dd2ff6cd70ea269cf1bc775c5f4e11294a8db414491ce6c2eb9dc3  qoriq-fm-ucode-lf-6.6.23-2.0.0.tar.gz
+sha256  6b9e2a5c383fb9288db1459821fc696f3abfeddd080b04c11cf9f712f0d36470  qoriq-fm-ucode-lf-6.6.52-2.2.0.tar.gz
 sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
index 84360533eb..71904e5b13 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_FM_UCODE_VERSION = lf-6.6.23-2.0.0
+QORIQ_FM_UCODE_VERSION = lf-6.6.52-2.2.0
 QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
 QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
 QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
