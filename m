Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E59DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 21:37:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C77DD610FF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 21:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C77DD610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C1A4079E;
	Wed, 20 Oct 2021 21:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69LggxRg9O1R; Wed, 20 Oct 2021 21:37:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED1E4404FD;
	Wed, 20 Oct 2021 21:37:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AD521BF2C2
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 21:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2697F83B68
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 21:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-P2VWUJvoLk for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 21:37:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6938D83B23
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 21:37:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 52722881BC; Wed, 20 Oct 2021 21:34:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 23:36:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31cfaab3c9afc300c1c76e27a72a9d7c4860d969
X-Git-Newrev: 29485de5e16f019f0a1daf1fccd3f8ac47a014d6
X-Patchwork-Hint: ignore
Message-Id: <20211020213408.52722881BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drbd-utils: bump to version 9.19.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=29485de5e16f019f0a1daf1fccd3f8ac47a014d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/LINBIT/drbd-utils/blob/v9.19.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/drbd-utils/drbd-utils.hash | 2 +-
 package/drbd-utils/drbd-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
index 47f6f6ecf5..58d282714e 100644
--- a/package/drbd-utils/drbd-utils.hash
+++ b/package/drbd-utils/drbd-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e89be59e60fc33534481a5dcae90de242e35867512d85cef2878ca757bfb074a  drbd-utils-9.15.0.tar.gz
+sha256  3827bfed6630f8784ec558a8ac3de68175d544876d897c0810ad141a61487cad  drbd-utils-9.19.0.tar.gz
 sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 6482cf70b6..2082810a37 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DRBD_UTILS_VERSION = 9.15.0
-DRBD_UTILS_SITE = http://www.linbit.com/downloads/drbd/utils
+DRBD_UTILS_VERSION = 9.19.0
+DRBD_UTILS_SITE = http://pkg.linbit.com/downloads/drbd/utils
 DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
 DRBD_UTILS_SELINUX_MODULES = drbd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
