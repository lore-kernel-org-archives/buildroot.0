Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0621C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 17:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B3FA83CD5;
	Fri, 12 Jan 2024 17:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B3FA83CD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1U6dYx9w9XbV; Fri, 12 Jan 2024 17:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDCDF84606;
	Fri, 12 Jan 2024 17:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDCDF84606
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1721BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6E71436ED
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6E71436ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4alM6g2Asc6U for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 17:44:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6D3243A93
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 17:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6D3243A93
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8D6885FA4; Fri, 12 Jan 2024 17:44:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 18:36:15 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 0ff0ef16e5d7371d7773d8206629340a87b644f3
X-Git-Newrev: 99ef2d04576843e95535593bbe1c285109a3c0e3
X-Patchwork-Hint: ignore
Message-Id: <20240112174407.C8D6885FA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/freeswitch:
 security bump version to 1.10.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=99ef2d04576843e95535593bbe1c285109a3c0e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Release notes:
https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Release-Notes/FreeSWITCH-1.10.x-Release-notes_25460878/#11011-release-date-22-dec-2023
https://github.com/signalwire/freeswitch/releases/tag/v1.10.11

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5e272456d6d5a6196eab7a6a4a858b956ecefd0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 504be12090..3f16467e22 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,5 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.10.-release.tar.xz.sha256
-sha256  d2c702c7f4bd6eca539c3981cf859ad5c1846d9283829e24cd75686f2322b9df  freeswitch-1.10.10.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.11.-release.tar.xz.sha256
+sha256  7f9603a691220d9f47da42f3b19290b629b69dceb2eee56448f0a7cefcf9d1a1  freeswitch-1.10.11.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 07d436cf0b..5b9dc49c9b 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.10
+FREESWITCH_VERSION = 1.10.11
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
