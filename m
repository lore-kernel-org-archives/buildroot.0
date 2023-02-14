Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC6BC05027
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 17:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D7A140BB2;
	Tue, 14 Feb 2023 17:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D7A140BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H47wiXHjg9-2; Tue, 14 Feb 2023 17:09:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 584B040BBF;
	Tue, 14 Feb 2023 17:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 584B040BBF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 520301BF94D
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BF4960F1C
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BF4960F1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6MMlzSjz102A for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C4B560C28
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C4B560C28
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CA4885E19; Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 17:59:00 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a3bc915b74ffecb71c53367f7daaec6a573b0417
X-Git-Newrev: a206365859d6c23ead253b8836f21f3e71318ce9
X-Patchwork-Hint: ignore
Message-Id: <20230214170848.5CA4885E19@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sofia-sip: bump
 version to 1.13.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=a206365859d6c23ead253b8836f21f3e71318ce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6c33056fff080dd1795bcfb543b87e7b70ac455c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sofia-sip/sofia-sip.hash | 2 +-
 package/sofia-sip/sofia-sip.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index ae2b3e725c..776136bb15 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  ebd006a98a7dff6e7f4d8357c5ebeee1d3bee3ac29ff213a4909e845f230fcbe  sofia-sip-1.13.8-756ab9b5c9.tar.gz
+sha256  daf75c41408c559c2d58a8fd4d39be4a8ff5144bc1db220d4dbc28deeed6670a  sofia-sip-1.13.9-f6ee306084.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 80e59057c4..9071d964e4 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.8
-SOFIA_SIP_SOURCE = sofia-sip-$(SOFIA_SIP_VERSION)-756ab9b5c9.tar.gz
+SOFIA_SIP_VERSION = 1.13.9
+SOFIA_SIP_SOURCE = sofia-sip-$(SOFIA_SIP_VERSION)-f6ee306084.tar.gz
 SOFIA_SIP_SITE = https://files.freeswitch.org/downloads/libs/sofia-sip
 SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
