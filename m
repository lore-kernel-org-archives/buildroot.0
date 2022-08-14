Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A14C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54B5040A02;
	Sun, 14 Aug 2022 19:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54B5040A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2YknHanq5afl; Sun, 14 Aug 2022 19:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 241A4409FD;
	Sun, 14 Aug 2022 19:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 241A4409FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0411BF96B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCCA4400AC
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCCA4400AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VT3WqMIYZY-w for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:21:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23DE940025
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23DE940025
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 70C4C87542; Sun, 14 Aug 2022 19:06:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:56:43 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 740c08f94028040561963c0e6c9b8b414f3d44fb
X-Git-Newrev: 9efe1989b697095ae43ff56b9b137a85354000e7
X-Patchwork-Hint: ignore
Message-Id: <20220814190648.70C4C87542@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: add Sen
 Hastings for systemd and pkg-stats
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

commit: https://git.buildroot.net/buildroot/commit/?id=9efe1989b697095ae43ff56b9b137a85354000e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1097580de7a9489065a0c53e3fc87f822badd37b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 27ce7a2d79..b4ea33adf1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2526,6 +2526,10 @@ F:	package/libbson/
 F:	package/lua-resty-http/
 F:	package/mpir/
 
+N:	Sen Hastings <sen@phobosdpl.com>
+F:	package/systemd
+F:	support/scripts/pkg-stats
+
 N:	Sergey Bobrenok <bobrofon@gmail.com>
 F:	package/sdbus-cpp/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
