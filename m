Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E66C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:39:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E4B061269
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E4B061269
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D7EF60BF1;
	Tue,  5 Oct 2021 19:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ujdyy6zJnP-E; Tue,  5 Oct 2021 19:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B0E96068B;
	Tue,  5 Oct 2021 19:39:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62DAE1BF983
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B912408C1
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id whpUO-177DLq for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94046408C5
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 56E3B91216; Tue,  5 Oct 2021 19:34:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe90272b5128987ee7492fff950660e05324838d
X-Git-Newrev: c4e6ff7a395313ba22feabd6a6ce0e6c6eefcc99
X-Patchwork-Hint: ignore
Message-Id: <20211005193451.56E3B91216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/autoconf-archive: bump to version
 2021.02.19
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4e6ff7a395313ba22feabd6a6ce0e6c6eefcc99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://git.savannah.gnu.org/cgit/autoconf-archive.git/tree/NEWS?h=v2021.02.19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/autoconf-archive/autoconf-archive.hash | 6 +++---
 package/autoconf-archive/autoconf-archive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
index 3ef98f2f14..79ee5ff68a 100644
--- a/package/autoconf-archive/autoconf-archive.hash
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -1,4 +1,4 @@
 # Computed locally
-sha256 17195c833098da79de5778ee90948f4c5d90ed1a0cf8391b4ab348e2ec511e3f  autoconf-archive-2019.01.06.tar.xz
-sha256 e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYING
-sha256 23ed0b84fa023bfa33433b498192cd08a3bfb1f4864a8ed791a84f3eb48b2dd2  COPYING.EXCEPTION
+sha256  e8a6eb9d28ddcba8ffef3fa211653239e9bf239aba6a01a6b7cfc7ceaec69cbd  autoconf-archive-2021.02.19.tar.xz
+sha256  e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYING
+sha256  23ed0b84fa023bfa33433b498192cd08a3bfb1f4864a8ed791a84f3eb48b2dd2  COPYING.EXCEPTION
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 3f1f0a5b3c..bd4a09d96d 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_ARCHIVE_VERSION = 2019.01.06
+AUTOCONF_ARCHIVE_VERSION = 2021.02.19
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPL-3.0+ with exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
