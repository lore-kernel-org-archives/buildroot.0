Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEA0C3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CA0461480;
	Fri, 25 Aug 2023 13:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CA0461480
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIsV9bcxiIKS; Fri, 25 Aug 2023 13:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 871CC61487;
	Fri, 25 Aug 2023 13:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 871CC61487
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFDF1BF995
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB18F6145A
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB18F6145A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id npyFd7TqJn6g for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:13:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A02136146E
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A02136146E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DB168630C; Fri, 25 Aug 2023 13:13:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 15:03:24 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7cc57e0b73ca7687ce3dfbe417d5207c7486ce60
X-Git-Newrev: 12c76f9be582264aa60172a4c45ea32cce006492
X-Patchwork-Hint: ignore
Message-Id: <20230825131356.8DB168630C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] DEVELOPERS: Remove
 Michael Rommel
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

commit: https://git.buildroot.net/buildroot/commit/?id=12c76f9be582264aa60172a4c45ea32cce006492
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Removal requested via email:

could you somehow please remove me as maintainer from this package.
I am since many years not using builtroot anymore and have no longer
systems with which I could do patch requests.
I am going into retirement.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 10dbb664e50e75ce7df2732d3cb483817147ffbf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6da1be8b48..adbf85ab17 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2057,11 +2057,6 @@ F:	package/protobuf/
 F:	package/re2/
 F:	package/spdlog/
 
-N:	Michael Rommel <rommel@layer-7.net>
-F:	package/knock/
-F:	package/python-crc16/
-F:	package/python-pyzmq/
-
 N:	Michael Trimarchi <michael@amarulasolutions.com>
 F:	board/bsh/
 F:	configs/imx8mn_bsh_smm_s2_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
