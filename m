Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DD1C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD4A540189;
	Tue,  6 Feb 2024 16:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD4A540189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFX-GfJ92k7I; Tue,  6 Feb 2024 16:04:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB9EC416DD;
	Tue,  6 Feb 2024 16:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB9EC416DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3AA1BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D30A60C17
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D30A60C17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mtz3avxyRayx for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C19AA60E58
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C19AA60E58
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD36E8711C; Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 17:02:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21d89a5b86f550958b4e23262b33e8497842b8dd
X-Git-Newrev: fb4d03c6a3637c3ab219a93640df3ed33d956555
X-Patchwork-Hint: ignore
Message-Id: <20240206160322.AD36E8711C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/support.html: document how to
 join irc channel from matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb4d03c6a3637c3ab219a93640df3ed33d956555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/website/support.html | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 9be816f836..13d63b13a9 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -21,7 +21,9 @@
 		<div class="col-sm-11">
 		  <p>The Buildroot IRC channel is <a href="irc://irc.oftc.net/#buildroot">
 		      #buildroot</a>, hosted on OFTC. If you do not have an IRC client, you can
-		    use the <a href="https://www.oftc.net/WebChat/">OFTC web interface</a>.
+		    use the <a href="https://www.oftc.net/WebChat/">OFTC web interface</a>. The
+		    channel is also bridged to matrix as <a href="https://matrix.to/#/#_oftc_#buildroot:matrix.org">
+		      #_oftc_#buildroot:matrix.org</a>.
 		    When asking for help on IRC, share relevant logs or pieces of code using a code
 		    sharing website.</p>
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
