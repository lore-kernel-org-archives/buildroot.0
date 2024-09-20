Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF4CCF3968
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5911C4040B;
	Fri, 20 Sep 2024 10:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hl4FLMco4IXL; Fri, 20 Sep 2024 10:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB16A405B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB16A405B5;
	Fri, 20 Sep 2024 10:34:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B665C1BF982
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5C6684C42
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEfB_cShHENT for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA37E84BF7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA37E84BF7
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A53437FF41; Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:57 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 278be2f2a81ffecd44480e12e816190bcf05eec2
X-Git-Newrev: f86b0d6d2a976d4242b928e969558f0b6c0fafbc
X-Patchwork-Hint: ignore
Message-Id: <20240920103451.A53437FF41@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/linux-zigbee: fix
 these typo in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=f86b0d6d2a976d4242b928e969558f0b6c0fafbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1789b5feb66f909486cba40a9f0be44d9706b3d0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-zigbee/0001-test-serial-Remove-test-serial.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-zigbee/0001-test-serial-Remove-test-serial.patch b/package/linux-zigbee/0001-test-serial-Remove-test-serial.patch
index 8cd9d754c0..95e52b3c95 100644
--- a/package/linux-zigbee/0001-test-serial-Remove-test-serial.patch
+++ b/package/linux-zigbee/0001-test-serial-Remove-test-serial.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] test-serial: Remove test-serial
 
 This folders only contains python tests scripts which would force us to
 enable a dependency to host-python which seems kind of silly since
-theses are only tests scripts.
+these are only tests scripts.
 
 Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
