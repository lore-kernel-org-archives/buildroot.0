Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50B0C3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 21:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64AC7607DE;
	Tue,  3 Jan 2023 21:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64AC7607DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CYBrjnvopTD; Tue,  3 Jan 2023 21:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A784A60FC7;
	Tue,  3 Jan 2023 21:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A784A60FC7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5ED6E1BF95E
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 21:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4815481EDC
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 21:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4815481EDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifR2N4CgxdCm for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 21:26:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D4B681ED8
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 21:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D4B681ED8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D457873A6; Tue,  3 Jan 2023 21:26:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Jan 2023 22:22:27 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 05e4d7c2ebc09c290b4870ad5da5010e63cf3ba3
X-Git-Newrev: dee3398566f4311b30d0843b8ca844eccb39a8ed
X-Patchwork-Hint: ignore
Message-Id: <20230103212635.6D457873A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 board/freescale/imx6ulevk/readme.txt: update broken url
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

commit: https://git.buildroot.net/buildroot/commit/?id=dee3398566f4311b30d0843b8ca844eccb39a8ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

http://freescale.com/ urls are all redirected to the NXP homepage
https://www.nxp.com/

Even if the link is not broken in the sense of a 404 http error, the
pointed resource is not found.

This commit updates the old freescale link to the correct nxp.com
location.

Note: the link now requires a free registration to be accessed.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 01a3cb0f6eac48150c4bd246402025c0790e2625)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/freescale/imx6ulevk/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/imx6ulevk/readme.txt b/board/freescale/imx6ulevk/readme.txt
index 5bc03771f2..5a5b4ae5a3 100644
--- a/board/freescale/imx6ulevk/readme.txt
+++ b/board/freescale/imx6ulevk/readme.txt
@@ -71,4 +71,4 @@ Enjoy!
 
 References
 ==========
-[1] http://cache.freescale.com/files/32bit/doc/quick_start_guide/IMX6ULTRALITEQSG.pdf
+[1] https://www.nxp.com/webapp/Download?colCode=IMX6ULTRALITEQSG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
