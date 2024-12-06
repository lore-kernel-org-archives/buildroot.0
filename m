Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585CFE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 19:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1974D61335;
	Fri,  6 Dec 2024 19:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMVtJgrnQgvI; Fri,  6 Dec 2024 19:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB06F6133C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB06F6133C;
	Fri,  6 Dec 2024 19:55:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00B9CED2
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D530340118
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1brJqsBuGBRr for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 19:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEC1B401B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEC1B401B7
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:55:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCBEB86A8C; Fri,  6 Dec 2024 19:55:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 20:50:00 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6c060f3d1adfd1157b337b023919ab8146b1b467
X-Git-Newrev: 598f53731639dc96fa1fd8fb520e6af37e34f33c
X-Patchwork-Hint: ignore
Message-Id: <20241206195529.DCBEB86A8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: remove myself
 as maintainer of package/{intel-gmmlib, intel-mediadriver, intel-mediasdk}
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=598f53731639dc96fa1fd8fb520e6af37e34f33c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Louis-Paul CORDIER <lpdev@cordier.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0fd5860280c2172da28aec50dfd29b7a080f6c6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 948a30b8c7..c352a348b2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1987,11 +1987,6 @@ F:	package/python-huepy/
 F:	package/python-tqdm/
 F:	package/rtl8189es/
 
-N:	Louis-Paul Cordier <lpdev@cordier.org>
-F:	package/intel-gmmlib/
-F:	package/intel-mediadriver/
-F:	package/intel-mediasdk/
-
 N:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 F:	board/olimex/a20_olinuxino/
 F:	board/zynq/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
