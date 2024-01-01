Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568CBC47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 020F54369C;
	Mon,  1 Jan 2024 21:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 020F54369C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VpHKr4MF6wX6; Mon,  1 Jan 2024 21:23:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F31824357C;
	Mon,  1 Jan 2024 21:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F31824357C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1476E1BF3F0
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF97B435C6
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF97B435C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWmYRHPg2Ztn for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:14:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92554435C3
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92554435C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79F6A83B4C; Mon,  1 Jan 2024 21:14:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 22:07:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdeaa933fbe899c515edf80602ce4128b3a3cf45
X-Git-Newrev: f8470817bdacc810d7cfc2dd6c37fd4c0c9f17fe
X-Patchwork-Hint: ignore
Message-Id: <20240101211459.79F6A83B4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/librelp: bump to version 1.11.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f8470817bdacc810d7cfc2dd6c37fd4c0c9f17fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/rsyslog/librelp/blob/v1.11.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/librelp/librelp.hash | 2 +-
 package/librelp/librelp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/librelp/librelp.hash b/package/librelp/librelp.hash
index 23ce8c15f8..8dcc502583 100644
--- a/package/librelp/librelp.hash
+++ b/package/librelp/librelp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  148db4e4d1a23e8136e9ec08810929a55faf5d45e24c2e3186d5ab34355dab31  librelp-1.10.0.tar.gz
+sha256  7719b5f31e07cbb9872289ad32b787c613b5355d407982a0a2c4d69938457fd6  librelp-1.11.0.tar.gz
 sha256  1ed76f935566e93e3c3c0d9f8fad22eb6d8bbe406e2eb8470a4a2764d9fd9685  COPYING
diff --git a/package/librelp/librelp.mk b/package/librelp/librelp.mk
index f8bbdb131c..cf2e391f34 100644
--- a/package/librelp/librelp.mk
+++ b/package/librelp/librelp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRELP_VERSION = 1.10.0
+LIBRELP_VERSION = 1.11.0
 LIBRELP_SITE = http://download.rsyslog.com/librelp
 LIBRELP_LICENSE = GPL-3.0+
 LIBRELP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
