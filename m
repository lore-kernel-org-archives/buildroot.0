Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5F6C5472D
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 16:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81B4E40340;
	Sat, 24 Aug 2024 16:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9a5K1zwFeZOf; Sat, 24 Aug 2024 16:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BD124034E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BD124034E;
	Sat, 24 Aug 2024 16:41:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A9BB1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 16:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3822A402E7
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 16:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRnGQmHsrWhZ for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 16:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF55402D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DF55402D5
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 16:41:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95663860C8; Sat, 24 Aug 2024 16:41:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 18:40:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 786484e631d34f9630baaa74006a8398aa19ad7d
X-Git-Newrev: 5dae8cddeecf16c791f3c138542ec51c4e627d75
X-Patchwork-Hint: ignore
Message-Id: <20240824164103.95663860C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dovecot-pigeonhole: bump version
 to 0.5.21.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5dae8cddeecf16c791f3c138542ec51c4e627d75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release note of this bugfix release:
https://dovecot.org/mailman3/hyperkitty/list/dovecot-news@dovecot.org/thread/4KDY5GDGPVG5ZMXKTBEKPKK764LT56WU/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 8cd3356dce..247f74fdba 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256  1ca71d2659076712058a72030288f150b2b076b0306453471c5261498d3ded27  dovecot-2.3-pigeonhole-0.5.21.tar.gz
+sha256  0377db284b620723de060431115fb2e7791e1df4321411af718201d6925c4692  dovecot-2.3-pigeonhole-0.5.21.1.tar.gz
 sha256  fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 679fd4db98..4d21ebd395 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.21
+DOVECOT_PIGEONHOLE_VERSION = 0.5.21.1
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
