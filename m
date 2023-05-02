Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0745AC77B7E
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 07:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABCD9416A7;
	Tue,  2 May 2023 07:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABCD9416A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clekgGdg0hht; Tue,  2 May 2023 07:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B306541755;
	Tue,  2 May 2023 07:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B306541755
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8011BF400
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03BA7811F3
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03BA7811F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1qac8Lq6Y70 for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 07:28:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BF2480EA8
 for <buildroot@buildroot.org>; Tue,  2 May 2023 07:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF2480EA8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B63E85697; Tue,  2 May 2023 07:28:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 2 May 2023 08:01:23 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9543cb3285232174e3ef77adb052b180dc6770f2
X-Git-Newrev: b825bbd1007e58837d1b50666ad651e03bb3cae9
X-Patchwork-Hint: ignore
Message-Id: <20230502072850.3B63E85697@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] DEVELOPERS: update email
 address
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

commit: https://git.buildroot.net/buildroot/commit/?id=b825bbd1007e58837d1b50666ad651e03bb3cae9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This patch updates my email address in the DEVELOPERS file.

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e538824692822cab06c44e6b70e9ae3b92d4c920)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ef47a60c8..bab2ededed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -538,7 +538,7 @@ F:	package/syslog-ng/
 N:	Christian Kellermann <christian.kellermann@solectrix.de>
 F:	package/python-pylibftdi/
 
-N:	Christian Stewart <christian@paral.in>
+N:	Christian Stewart <christian@aperture.us>
 F:	package/balena-engine/
 F:	package/batman-adv/
 F:	package/catatonit/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
