Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51E4C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 13:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B34440025;
	Sun, 12 Mar 2023 13:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B34440025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qAc2d3EW18zM; Sun, 12 Mar 2023 13:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56E41404DF;
	Sun, 12 Mar 2023 13:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E41404DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 757A91BF339
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 13:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F70B815AD
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 13:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F70B815AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vt0Ky1lSbgCb for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 13:14:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D6A281518
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 13:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D6A281518
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D99A86EEF; Sun, 12 Mar 2023 13:14:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 14:13:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f69c972ae613719c0ebc5395ba3084c408023102
X-Git-Newrev: f1c5671ffef3d68979f6514a687815abd4c1f357
X-Patchwork-Hint: ignore
Message-Id: <20230312131449.1D99A86EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ola: bump to version
 0.10.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1c5671ffef3d68979f6514a687815abd4c1f357
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://github.com/OpenLightingProject/ola/releases/tag/0.10.9

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ola/ola.hash | 2 +-
 package/ola/ola.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ola/ola.hash b/package/ola/ola.hash
index 7565adabde..a1a5577ed3 100644
--- a/package/ola/ola.hash
+++ b/package/ola/ola.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  102aa3114562a2a71dbf7f77d2a0fb9fc47acc35d6248a70b6e831365ca71b13  ola-0.10.8.tar.gz
+sha256  44073698c147fe641507398253c2e52ff8dc7eac8606cbf286c29f37939a4ebf  ola-0.10.9.tar.gz
 
 # License files (locally computed)
 sha256  e6b95dd336a57abb343e2988ac22b7e21b35c5b86003e6eb9e066ffbeeff9da7  COPYING
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 82615e8155..efaa5b6e3e 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OLA_VERSION = 0.10.8
+OLA_VERSION = 0.10.9
 OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VERSION)
 OLA_LICENSE = LGPL-2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = COPYING GPL LGPL LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
