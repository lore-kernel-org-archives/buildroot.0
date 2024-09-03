Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B24CD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3719B40A02;
	Tue,  3 Sep 2024 18:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-BLHCcak9hS; Tue,  3 Sep 2024 18:44:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4004140A78
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4004140A78;
	Tue,  3 Sep 2024 18:44:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11AC41BF97A
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0004D80E83
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38dTvLzTkReX for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3406280E84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3406280E84
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:44:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3119786B0B; Tue,  3 Sep 2024 18:44:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 20:35:06 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1a9e19cd7b7bbfed58e63c9a9409ebfcccf6318d
X-Git-Newrev: 7b5bc0d1db8bb9864629fdba3d13e636645187c8
X-Patchwork-Hint: ignore
Message-Id: <20240903184428.3119786B0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/swaybg: bump to
 version 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b5bc0d1db8bb9864629fdba3d13e636645187c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

See also: https://github.com/swaywm/swaybg/releases/tag/v1.2.1

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2143e8f8351c177d7fce87ccacba042afea94f93)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swaybg/swaybg.hash | 5 +++--
 package/swaybg/swaybg.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/swaybg/swaybg.hash b/package/swaybg/swaybg.hash
index 62bf048d61..e528349db9 100644
--- a/package/swaybg/swaybg.hash
+++ b/package/swaybg/swaybg.hash
@@ -1,3 +1,4 @@
-# Locally computed, tarball verified with GPG signature
-sha256  c0205b34f1fad94553b6cb2c2b983cc33186018026058cad0b841a00bc3087e3  swaybg-1.2.0.tar.gz
+# Locally calculated after checking pgp signature:
+# https://github.com/swaywm/swaybg/releases/download/v1.2.1/swaybg-1.2.1.tar.gz.sig
+sha256  6af1fdf0e57b1cc5345febed786b761fea0e170943a82639f94cfaed7df84f8f  swaybg-1.2.1.tar.gz
 sha256  95224d118a325daf31828afcca98cd958d53f0a7cdd856b50b1be8ac44832faf  LICENSE
diff --git a/package/swaybg/swaybg.mk b/package/swaybg/swaybg.mk
index 90a8cb5d80..87374e035e 100644
--- a/package/swaybg/swaybg.mk
+++ b/package/swaybg/swaybg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWAYBG_VERSION = 1.2.0
+SWAYBG_VERSION = 1.2.1
 SWAYBG_SITE = https://github.com/swaywm/swaybg/releases/download/v$(SWAYBG_VERSION)
 SWAYBG_LICENSE = MIT
 SWAYBG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
