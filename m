Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6484BCD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DFC760848;
	Tue,  3 Sep 2024 19:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSKSC_esySln; Tue,  3 Sep 2024 19:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A5F5608C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A5F5608C3;
	Tue,  3 Sep 2024 19:35:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55D861BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38C6D80BB9
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qv90cI59j2Ba for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A37B980B6A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A37B980B6A
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:35:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9158B86BB2; Tue,  3 Sep 2024 19:35:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:06:15 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9586e77dc80bcb6bae4b4805a87f727e12d12738
X-Git-Newrev: 3952b976a3a84c0ceb34d4fefbc7e7b62f7c3f7d
X-Patchwork-Hint: ignore
Message-Id: <20240903193519.9158B86BB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: assign Adrian
 Perez for sysprof
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

commit: https://git.buildroot.net/buildroot/commit/?id=3952b976a3a84c0ceb34d4fefbc7e7b62f7c3f7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 03505e34570d65ead565e13b0998b05a12ab95ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1945e1fb37..edd3c75cca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -52,6 +52,7 @@ F:	package/libepoxy/
 F:	package/libmanette/
 F:	package/libpsl/
 F:	package/libwpe/
+F:	package/sysprof/
 F:	package/webkitgtk/
 F:	package/wlroots/
 F:	package/woff2/
@@ -3172,7 +3173,6 @@ N:	Will Newton <will.newton@gmail.com>
 F:	package/enchant/
 F:	package/erlang/
 F:	package/libmicrohttpd/
-F:	package/sysprof/
 F:	package/time/
 
 N:	Will Wagner <will_wagner@carallon.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
