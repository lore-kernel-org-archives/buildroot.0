Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621EAC5475B
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 14:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30672405F9;
	Fri,  8 Mar 2024 14:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4SxC7uCiGZr; Fri,  8 Mar 2024 14:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CF3541CAF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CF3541CAF;
	Fri,  8 Mar 2024 14:43:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1681BF279
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 14:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7640982CEC
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 14:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FrLIINjmvhn5 for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 14:43:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7186827D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7186827D9
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 14:43:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B03D88820F; Fri,  8 Mar 2024 14:43:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Mar 2024 15:43:16 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c020b922b312ac7e68a94bba4ca8c59a536e3ed0
X-Git-Newrev: f9b38b93c1737ebc9d0e6a4c84408ab569133349
X-Patchwork-Hint: ignore
Message-Id: <20240308144342.B03D88820F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] DEVELOPERS: update Sen
 Hastings email
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9b38b93c1737ebc9d0e6a4c84408ab569133349
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

phobosdpl is an old work email I don't really use anymore, so I'm
changing it to my personal email.

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 622fec1bb39fb1ca6aa9c5a9df2f93b3246be4a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7b7c233c42..cb850cb943 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2567,7 +2567,7 @@ F:	package/libbson/
 F:	package/lua-resty-http/
 F:	package/mpir/
 
-N:	Sen Hastings <sen@phobosdpl.com>
+N:	Sen Hastings <sen@hastings.org>
 F:	package/systemd
 F:	support/scripts/pkg-stats
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
