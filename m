Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BACC6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 22:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E49240B60;
	Tue, 14 Mar 2023 22:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E49240B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TwrCcq8fqg9u; Tue, 14 Mar 2023 22:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 673BE40B58;
	Tue, 14 Mar 2023 22:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 673BE40B58
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54E6E1BF3A4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 22:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B263813F5
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 22:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B263813F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9CwMKH0RRIHe for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 22:26:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 779AB813E9
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 22:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 779AB813E9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64C8387349; Tue, 14 Mar 2023 22:26:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 23:26:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 998f3e17da8658f983dcd8c3d565bfa7e4914f20
X-Git-Newrev: 562cf1fbdba54ba87b9cf630675c5865843d5c4c
X-Patchwork-Hint: ignore
Message-Id: <20230314222613.64C8387349@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Add entry for Bagas Sanjaya as
 Buildroot developer for git
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=562cf1fbdba54ba87b9cf630675c5865843d5c4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bagas is keen to maintain git package for Buildroot. However, due to
limited resources available, he can only do testing as far as
build testing. Other developers are needed to help him maintain the
package.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b49491da7a..b6d288c54f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -273,6 +273,9 @@ F:	package/orbit/
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
