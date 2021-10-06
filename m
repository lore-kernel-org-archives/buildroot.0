Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DC1C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:42:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E7E361056
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E7E361056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F924405BE;
	Wed,  6 Oct 2021 15:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXdk3lC8hnfo; Wed,  6 Oct 2021 15:42:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B243B405A4;
	Wed,  6 Oct 2021 15:42:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0EFF1BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBDF04011C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQzYOJR2Q7hh for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:41:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDA13400C1
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:41:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AA5B6928EE; Wed,  6 Oct 2021 15:39:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 17:41:36 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 1f56d6fc7377ddf1b00fceaf0bd8108f3a8a0f0f
X-Git-Newrev: ee1f32cb8f544359328c229f9138ff8693b5dc38
X-Patchwork-Hint: ignore
Message-Id: <20211006153923.AA5B6928EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/dash: bump to
 version 0.5.11.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee1f32cb8f544359328c229f9138ff8693b5dc38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 71e99d573c2b00e352ff0e82c97553aafce51d17)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dash/dash.hash | 4 ++--
 package/dash/dash.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 24cc7318bd..1803bcdb2c 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,4 +1,4 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.2.tar.gz.sha256sum
-sha256  62b9f1676ba6a7e8eaec541a39ea037b325253240d1f378c72360baa1cbcbc2a  dash-0.5.11.3.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.5.tar.gz.sha512sum
+sha512  5387e213820eeb44d812bb4697543023fd4662b51a9ffd52a702810fed8b28d23fbe35a7f371e6686107de9f81902eff109458964b4622f4c5412d60190a66bf  dash-0.5.11.5.tar.gz
 # Locally calculated
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 1712dcf599..fed3a99551 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.11.3
+DASH_VERSION = 0.5.11.5
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
