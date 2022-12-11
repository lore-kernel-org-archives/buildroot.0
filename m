Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353C5C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA48B80D20;
	Sun, 11 Dec 2022 13:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA48B80D20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EKlbmTT5Sj2v; Sun, 11 Dec 2022 13:34:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C95080FAE;
	Sun, 11 Dec 2022 13:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C95080FAE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A64121BF5F5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 811594091F
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 811594091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DpZWasfOWjYY for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:34:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6A2F40308
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6A2F40308
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2AF1863F6; Sun, 11 Dec 2022 13:34:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:33:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84463af7c42bc0d81ea0e03de911f5b1b4ef57c9
X-Git-Newrev: 3324161873274b90b0c89e2a5ebb74e915bd6e86
X-Patchwork-Hint: ignore
Message-Id: <20221211133400.A2AF1863F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/psmisc: bump to version 23.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=3324161873274b90b0c89e2a5ebb74e915bd6e86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.com/psmisc/psmisc/-/blob/v23.5/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/psmisc/psmisc.hash | 6 +++---
 package/psmisc/psmisc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/psmisc/psmisc.hash b/package/psmisc/psmisc.hash
index 47e44f6921..fe146f90c9 100644
--- a/package/psmisc/psmisc.hash
+++ b/package/psmisc/psmisc.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/psmisc/files/psmisc/
-md5  8114cd4489b95308efe2509c3a406bbf  psmisc-23.4.tar.xz
-sha1  a4c34111e570c43967efb2bbd8a4f31d94d22e0f  psmisc-23.4.tar.xz
+md5  014f0b5d5ab32478a2c57812ad01e1fb  psmisc-23.5.tar.xz
+sha1  a16073f459a19288c1ea2b413a84e1b996cab595  psmisc-23.5.tar.xz
 # Locally computed:
-sha256  7f0cceeace2050c525f3ebb35f3ba01d618b8d690620580bdb8cd8269a0c1679  psmisc-23.4.tar.xz
+sha256  dc37ecc2f7e4a90a94956accc6e1c77adb71316b7c9cbd39b26738db0c3ae58b  psmisc-23.5.tar.xz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 8b92be11e8..3229184459 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSMISC_VERSION = 23.4
+PSMISC_VERSION = 23.5
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
 PSMISC_SOURCE = psmisc-$(PSMISC_VERSION).tar.xz
 PSMISC_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
