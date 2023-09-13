Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0B1CA5500
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 07:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45BD141AEF;
	Wed, 13 Sep 2023 07:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45BD141AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id st1Y-Kqf5PNd; Wed, 13 Sep 2023 07:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B38941B35;
	Wed, 13 Sep 2023 07:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B38941B35
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C9BB1BF980
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCDDB405AA
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCDDB405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C3IFKFytbqH1 for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 07:44:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B107F41C25
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 07:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B107F41C25
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A090786DB7; Wed, 13 Sep 2023 07:44:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 09:40:23 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 4e02baaf5141ec647a257d8d2b923b4a2ccc8915
X-Git-Newrev: e95a26d6c5c0c3b87a1255b6943b1723a18b40f3
X-Patchwork-Hint: ignore
Message-Id: <20230913074434.A090786DB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/freeswitch:
 security bump version to 1.10.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=e95a26d6c5c0c3b87a1255b6943b1723a18b40f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Release notes:
https://github.com/signalwire/freeswitch/releases/tag/v1.10.10
"This is a major release containing critical security fixes, adding
 Debian 12 Bookworm, OpenSSL 3 and FFmpeg5 support."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b9a864d03d66b1132f484060f3724182f51cdfbc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 3497a3283f..504be12090 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,5 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.9.-release.tar.xz.sha256
-sha256  f649d53af7beccb59c1d03864cd8f2d287e4ea26ef652b5c4969d29121ced063  freeswitch-1.10.9.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.10.-release.tar.xz.sha256
+sha256  d2c702c7f4bd6eca539c3981cf859ad5c1846d9283829e24cd75686f2322b9df  freeswitch-1.10.10.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 7497cc4964..07d436cf0b 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.9
+FREESWITCH_VERSION = 1.10.10
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
