Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF8EECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C635408F0;
	Tue, 30 Aug 2022 16:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C635408F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2eg19x0-MP0G; Tue, 30 Aug 2022 16:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D3D640024;
	Tue, 30 Aug 2022 16:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D3D640024
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E78AD1C113E
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C314D813AB
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C314D813AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_jbKbsGfhXF for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 060FB813A3
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 060FB813A3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 43C0387E6A; Tue, 30 Aug 2022 16:00:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 18:01:28 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: dad9c68a2e71a0ef53bd576511401ee455c491d9
X-Git-Newrev: 01a26c5d706c5a8f173c0bde031623d91bf3137f
X-Patchwork-Hint: ignore
Message-Id: <20220830160007.43C0387E6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: drop myself
 from Pulseaudio
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

commit: https://git.buildroot.net/buildroot/commit/?id=01a26c5d706c5a8f173c0bde031623d91bf3137f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

I am not using this package anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9912d438afdd388d580ee094b8e1b1eb4bb6c53b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4682005fb3..16fe7602d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -431,7 +431,6 @@ F:	package/php/
 F:	package/pixman/
 F:	package/pngquant/
 F:	package/pound/
-F:	package/pulseaudio/
 F:	package/pure-ftpd/
 F:	package/python-couchdb/
 F:	package/python-cssutils/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
