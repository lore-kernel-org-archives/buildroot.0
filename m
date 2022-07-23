Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33191C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D15BE83E2D;
	Sat, 23 Jul 2022 15:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D15BE83E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ee4UQsV0qtaN; Sat, 23 Jul 2022 15:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E22FE832B0;
	Sat, 23 Jul 2022 15:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E22FE832B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B56791BF859
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FC2860D58
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FC2860D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nV7Xqvb29LsM for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:03:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB15A60A6F
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB15A60A6F
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C184984624; Sat, 23 Jul 2022 14:49:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:00:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab00df55f05990962b64ee20ee67fee8ec4fa59e
X-Git-Newrev: 1097580de7a9489065a0c53e3fc87f822badd37b
X-Patchwork-Hint: ignore
Message-Id: <20220723144950.C184984624@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Sen Hastings for systemd
 and pkg-stats
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

commit: https://git.buildroot.net/buildroot/commit/?id=1097580de7a9489065a0c53e3fc87f822badd37b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 301ca3e281..afd2e1ca12 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2581,6 +2581,10 @@ F:	package/libbson/
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
