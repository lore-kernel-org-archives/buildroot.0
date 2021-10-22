Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C6FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:51:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 856F66103E
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 856F66103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61D6680ED8;
	Fri, 22 Oct 2021 18:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q2k0_oY4dyq3; Fri, 22 Oct 2021 18:51:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCCB780EAD;
	Fri, 22 Oct 2021 18:51:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F53A1BF29D
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C2974069F
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QZKyk7XGSOkm for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 18:49:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D5AC40520
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 18:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 28642884A5; Fri, 22 Oct 2021 18:46:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 20:48:06 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 0bfff7d2446b917a1342a02973a402b9f2f82e0f
X-Git-Newrev: 5bf02b7755cfd27f404fb81f3a1b9e6dd36458f5
X-Patchwork-Hint: ignore
Message-Id: <20211022184640.28642884A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libva-utils: bump
 version to 2.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bf02b7755cfd27f404fb81f3a1b9e6dd36458f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Release notes: https://github.com/intel/libva-utils/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eb6e35e304b00cdf4b0cb2ecef26cae11b88d181)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva-utils/libva-utils.hash | 6 +++---
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 967c350373..18a078dc1c 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva-utils/releases/download/2.12.0/libva-utils-2.12.0.tar.bz2.sha1sum
-sha1  734ad8d4e39bf90b5670224272489f1745024ae2  libva-utils-2.12.0.tar.bz2
+# From https://github.com/intel/libva-utils/releases/download/2.13.0/libva-utils-2.13.0.tar.bz2.sha1sum
+sha1  7ab945cf232387f762891f9e4f7a6cb41e0766e8  libva-utils-2.13.0.tar.bz2
 # Locally computed
-sha256  bbe49e68fbdf379acc769e4c1680a76be3e2b48020ca320edafaf7235b62cc44  libva-utils-2.12.0.tar.bz2
+sha256  db3ae0bd63c2a3f6ef498450c29ffc99c387ce611e1eb5db6a8da1f88845d612  libva-utils-2.13.0.tar.bz2
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index c75091c7c7..e6e31df8bd 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.12.0
+LIBVA_UTILS_VERSION = 2.13.0
 LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
 LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
