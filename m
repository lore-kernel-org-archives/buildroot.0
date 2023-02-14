Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07B0C05027
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 17:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9930B40BDA;
	Tue, 14 Feb 2023 17:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9930B40BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmY1MBqXQQxu; Tue, 14 Feb 2023 17:10:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAB6640BA2;
	Tue, 14 Feb 2023 17:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAB6640BA2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F45B1BF94D
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7489B80E48
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7489B80E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAjzpwjjk_eG for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7666880E46
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7666880E46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66F3F85E1A; Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 17:59:00 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a206365859d6c23ead253b8836f21f3e71318ce9
X-Git-Newrev: ab94614e7d5b2076433aef665bc0186e4e477df9
X-Patchwork-Hint: ignore
Message-Id: <20230214170848.66F3F85E1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sofia-sip: bump
 version to 1.13.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab94614e7d5b2076433aef665bc0186e4e477df9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Switch to github helper due to lack of upstream-provided tarball.

Needed for upcoming bump of freeswitch to version 1.10.9.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8bb962724e3a76112b7c374ae6a1c4521f97cc65)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sofia-sip/sofia-sip.hash | 2 +-
 package/sofia-sip/sofia-sip.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index 776136bb15..4617725571 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  daf75c41408c559c2d58a8fd4d39be4a8ff5144bc1db220d4dbc28deeed6670a  sofia-sip-1.13.9-f6ee306084.tar.gz
+sha256  03dda8653367501b7b1188a6b6513416902372e27475553de9318ee89ac390ff  sofia-sip-1.13.12.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 9071d964e4..59c365365b 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.9
-SOFIA_SIP_SOURCE = sofia-sip-$(SOFIA_SIP_VERSION)-f6ee306084.tar.gz
-SOFIA_SIP_SITE = https://files.freeswitch.org/downloads/libs/sofia-sip
+SOFIA_SIP_VERSION = 1.13.12
+SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
 SOFIA_SIP_INSTALL_STAGING = YES
+# Fetched from github, no pre-generated configure script provided
+SOFIA_SIP_AUTORECONF = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
 SOFIA_SIP_LICENSE = LGPL-2.1+
 SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
