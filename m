Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1891C71150
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 11:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B32C260823;
	Sun, 15 Jun 2025 11:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFiS0loJqAo0; Sun, 15 Jun 2025 11:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D489760833
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D489760833;
	Sun, 15 Jun 2025 11:03:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AB8C151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CC44809A6
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B45vCDjPKVw1 for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 11:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B986807F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B986807F2
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 11:03:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A6E5838AA; Sun, 15 Jun 2025 11:03:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 13:00:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 760412d4bfa71c6c9cc7e2c5fbd1506d9ff2f5dd
X-Git-Newrev: f2a4e7f7adaeda8a9dc2fda361e002556e8a1b32
X-Patchwork-Hint: ignore
Message-Id: <20250615110312.4A6E5838AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/znc: bump version to 1.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2a4e7f7adaeda8a9dc2fda361e002556e8a1b32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/znc/znc/blob/znc-1.10.0/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: modified change log URL to use release tag]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 7bac128af9..985849acf8 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e8a7cf80e19aad510b4e282eaf61b56bc30df88ea2e0f64fadcdd303c4894f3c  znc-1.9.1.tar.gz
+sha256  be65ad9b62ef545a7e9486f2f74134edc53ba513ad43a69d9d8b476605336b19  znc-1.10.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index ec6287e6de..c0614f3e87 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.9.1
+ZNC_VERSION = 1.10.0
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
