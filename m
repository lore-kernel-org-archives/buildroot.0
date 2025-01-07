Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930B6E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 20:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32FAA40200;
	Tue,  7 Jan 2025 20:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7v_T37ys_vo; Tue,  7 Jan 2025 20:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED82540207
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED82540207;
	Tue,  7 Jan 2025 20:46:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94EED7AA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 20:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7666C6059E
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 20:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPc1XU7QdwmA for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 20:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE8E66059A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE8E66059A
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 20:46:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6E3983CB6; Tue,  7 Jan 2025 20:46:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Jan 2025 21:43:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5f0794d155d2d0b982604a4103287e04bec0966
X-Git-Newrev: e9007bc74ed571234bb938c1fdc4cc99d6571bfc
X-Patchwork-Hint: ignore
Message-Id: <20250107204617.A6E3983CB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/msmtp: bump version to 1.8.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9007bc74ed571234bb938c1fdc4cc99d6571bfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes since 1.8.25:
- https://marlam.de/msmtp/news/msmtp-1-8-26/
- https://marlam.de/msmtp/news/msmtp-1-8-27/

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
[Julien: add link to 1.8.26 release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index ba4ef02746..eb80029626 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.25.tar.xz.sig
+# https://marlam.de/msmtp/releases/msmtp-1.8.27.tar.xz.sig
 # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
-sha256  2dfe1dbbb397d26fe0b0b6b2e9cd2efdf9d72dd42d18e70d7f363ada2652d738  msmtp-1.8.25.tar.xz
+sha256  94030580a63a747faa0a3b9b1b264ae355aad33a4d94b832bfeb5b21633c965e  msmtp-1.8.27.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index b964970bfa..f3543bff1b 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.25
+MSMTP_VERSION = 1.8.27
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
