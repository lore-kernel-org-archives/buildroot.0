Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500E7EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 15:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DED51400A8;
	Sun, 25 Jun 2023 15:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DED51400A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3uS5mCElWCM; Sun, 25 Jun 2023 15:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DB7840998;
	Sun, 25 Jun 2023 15:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DB7840998
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 111A61BF909
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE71C40518
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE71C40518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X6NZ2Bp0Ibw8 for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 15:01:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D04F404FF
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 15:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D04F404FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E1FE84ABB; Sun, 25 Jun 2023 15:01:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 16:55:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb19d01510d285b06c7092dec4cf5383012ce0e1
X-Git-Newrev: e63078a99a54573db83627fb2df5603bd6f8d735
X-Patchwork-Hint: ignore
Message-Id: <20230625150110.0E1FE84ABB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xkeyboard-config: bump
 version to 2.38
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e63078a99a54573db83627fb2df5603bd6f8d735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 2 +-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index 08e36da1d0..3a19075ba1 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb1383a5ac4b6210d7c7302b9d6fab052abdf51c5d2c9b55f1f779997ba68c6c  xkeyboard-config-2.37.tar.xz
+sha256  0690a91bab86b18868f3eee6d41e9ec4ce6894f655443d490a2184bfac56c872  xkeyboard-config-2.38.tar.xz
 sha256  6ca90f4b67dced4062894d6d77f4cc39343df9e359fc12f5e5d3c89ef2a3ef6d  COPYING
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index b82c15a23a..7c9c814d95 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.37
+XKEYBOARD_CONFIG_VERSION = 2.38
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.xz
 XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
