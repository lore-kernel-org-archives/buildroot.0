Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0CDC678D5
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 19:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89FC4416CD;
	Sat,  4 Mar 2023 19:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89FC4416CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8dhoA06dWII; Sat,  4 Mar 2023 19:51:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E83A416B5;
	Sat,  4 Mar 2023 19:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E83A416B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4FF61BF337
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAB9981E95
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAB9981E95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIRAIpPyVsuV for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 19:51:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4AAA80B29
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 19:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4AAA80B29
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D33F186162; Sat,  4 Mar 2023 19:51:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 20:38:04 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: aac7940dd920514e19a81be53f455a0889b99cee
X-Git-Newrev: 34a3f617815ff2fbfd98379b2880f4848c9a99fd
X-Patchwork-Hint: ignore
Message-Id: <20230304195132.D33F186162@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] DEVELOPERS: remove Shyam
 Saini
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

commit: https://git.buildroot.net/buildroot/commit/?id=34a3f617815ff2fbfd98379b2880f4848c9a99fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Shyam's email address at Savoir Faire Linux is bouncing, so drop it
from the DEVELOPERS file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bd351c4e933e48f380cc8924d1659b220d13b70c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c1fb3704f..8da3db127b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2524,9 +2524,6 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
-N:	Shyam Saini <shyam.saini@savoirfairelinux.com>
-F:	package/cukinia/
-
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
