Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0CCC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 22:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 879DF4008F;
	Fri, 10 Dec 2021 22:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0MvEDt_fu4aj; Fri, 10 Dec 2021 22:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E938642844;
	Fri, 10 Dec 2021 22:07:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43C351BF3D6
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 22:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CDC040403
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 22:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id McK-HaeE-bVY for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 22:06:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7BF1418C9
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 22:06:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A40A9825DF; Fri, 10 Dec 2021 22:01:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 23:04:55 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 2d360d3f00d2cb317585628a5b5e096374fa75e0
X-Git-Newrev: e8a130a885291e732ba53dfc380ba2595721349d
X-Patchwork-Hint: ignore
Message-Id: <20211210220123.A40A9825DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mosquitto: bump
 to v2.0.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8a130a885291e732ba53dfc380ba2595721349d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This is a small bugfix release, read the announcement on
https://mosquitto.org/blog/2021/11/version-2-0-14-released/

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 98372c54447076fe9acf5dd4c9d6a465f3f88f0f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.hash | 2 +-
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 7b950208c8..24b8869d13 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
 # from https://mosquitto.org/files/source/mosquitto-2.0.13.tar.gz.asc
-sha256  9cf83a558f1588e8798edd8647b1632af88e88ef2cd45054e903c517df5bd2cd  mosquitto-2.0.13.tar.gz
+sha256  d0dde8fdb12caf6e2426b4f28081919a2fce3448773bdb8af0d3cd5fe5776925  mosquitto-2.0.14.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index b02f0c2f43..3e7a728acb 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.13
+MOSQUITTO_VERSION = 2.0.14
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
