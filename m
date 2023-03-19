Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673AEC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 16:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19B1381B3E;
	Sun, 19 Mar 2023 16:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19B1381B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SB-XAhYz7QiK; Sun, 19 Mar 2023 16:48:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AE358149C;
	Sun, 19 Mar 2023 16:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AE358149C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDCE41BF2F8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8335401CD
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8335401CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVhZKcthA4Ao for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 16:48:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA94F401CA
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 16:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA94F401CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D4AE874D0; Sun, 19 Mar 2023 16:48:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 17:47:49 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: cb1e96e55162116948e0d48e26ab696900cd9169
X-Git-Newrev: 08ef726a3a2c926c77e850c60ad7ab26a4425107
X-Patchwork-Hint: ignore
Message-Id: <20230319164820.9D4AE874D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: Add entry for
 Bagas Sanjaya as Buildroot developer for git
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

commit: https://git.buildroot.net/buildroot/commit/?id=08ef726a3a2c926c77e850c60ad7ab26a4425107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Bagas is keen to maintain git package for Buildroot. However, due to
limited resources available, he can only do testing as far as
build testing. Other developers are needed to help him maintain the
package.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 562cf1fbdba54ba87b9cf630675c5865843d5c4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6dc0d4a01d..cecd6cb52f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -262,6 +262,9 @@ F:	package/orbit/
 N:	Attila Wagner <attila.wagner@onyxinsight.com>
 F:	package/python-canopen/
 
+N:	Bagas Sanjaya <bagasdotme@gmail.com>
+F:	package/git/
+
 N:	Bartosz Bilas <b.bilas@grinn-global.com>
 F:	board/stmicroelectronics/stm32mp157a-dk1/
 F:	configs/stm32mp157a_dk1_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
