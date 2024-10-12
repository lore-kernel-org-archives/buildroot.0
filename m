Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA448CF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98DDF614FF;
	Sat, 12 Oct 2024 15:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDVYMo1-wMzu; Sat, 12 Oct 2024 15:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84D8661501
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84D8661501;
	Sat, 12 Oct 2024 15:04:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58C261BF47E
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC1F181ED7
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZBes3p4zwCS for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E504D81F62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E504D81F62
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:02:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E202F85E1E; Sat, 12 Oct 2024 15:02:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:10 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: eaac12e842dd1767e912c0011766c8355b74cc6d
X-Git-Newrev: 606d7566298c583d3201e53d767cf37884d82126
X-Patchwork-Hint: ignore
Message-Id: <20241012150252.E202F85E1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/slirp: fix typos
 in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=606d7566298c583d3201e53d767cf37884d82126
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 6183d8f494632cc64ae0ff6b2fffd05d0ceb9784)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/slirp/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slirp/Config.in b/package/slirp/Config.in
index 38fd5277af..57058dcd3b 100644
--- a/package/slirp/Config.in
+++ b/package/slirp/Config.in
@@ -12,8 +12,8 @@ config BR2_PACKAGE_SLIRP
 
 	  NOTE:
 	  This package has some history of a unique kind:
-	    - originally developped as 'slirp' by Danny Gasparovski, and
-	      seemingly abandonned (developper /disapeared/)
+	    - originally developed as 'slirp' by Danny Gasparovski, and
+	      seemingly abandoned (developer /disappeared/)
 	    - then re-maintained at sourceforge by "Kelly", up to some
 	      time around 2009: http://slirp.sourceforge.net/
 	    - during that period, QEMU (Fabrice BELLARD) forked the code
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
