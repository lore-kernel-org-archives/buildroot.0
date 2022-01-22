Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7C8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 12:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA3628318C;
	Sat, 22 Jan 2022 12:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHwxoHiGKWY6; Sat, 22 Jan 2022 12:16:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6C6A8316F;
	Sat, 22 Jan 2022 12:16:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83E421BF2AF
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D7B54017B
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8u6DvQbYZecv for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 12:16:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 901874014E
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 12:16:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D8D4A81970; Sat, 22 Jan 2022 12:09:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 13:16:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d958ae450d41ddf0d44ea5bd84209ba09face868
X-Git-Newrev: aab9cb163ece16b5e10a3e3fb14ced6c11f98913
X-Patchwork-Hint: ignore
Message-Id: <20220122120934.D8D4A81970@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xr819-xradio: bump to latest
 version to fix Linux >= 5.13 building
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

commit: https://git.buildroot.net/buildroot/commit/?id=aab9cb163ece16b5e10a3e3fb14ced6c11f98913
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pending PR is now merged[1] and it fixes Linux >= 5.13 building. So let's
bump xr819-xradio version.

[1]: https://github.com/fifteenhex/xradio/pull/15

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Tested-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xr819-xradio/xr819-xradio.hash | 4 ++--
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index efff92ab7d..4a77db0d1a 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 5900821a777b9008d7cf9b8128e0cb75a4623ecb608b45438e17c7a056cde1bf xr819-xradio-6bf0e2e21c80456e2a3d4ad1267caecde7165871.tar.gz
+sha256  06b91b1fcf98a261125b4d599ffcce2458fb9d0c1f38a4bd432a622b446f0f51  xr819-xradio-16180b6308e3c5dc42a92a663adf669028087ff7.tar.gz
 # Locally computed
-sha256 db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73 LICENSE
+sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index c1fe3295b6..5f60be887c 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 6bf0e2e21c80456e2a3d4ad1267caecde7165871
+XR819_XRADIO_VERSION = 16180b6308e3c5dc42a92a663adf669028087ff7
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
