Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE92C10F1B
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 17:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E22B360BA8;
	Wed, 21 Dec 2022 17:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E22B360BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yLn5GXMYugdy; Wed, 21 Dec 2022 17:42:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DEB060B01;
	Wed, 21 Dec 2022 17:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DEB060B01
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95DCA1BF94D
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 17:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D068418A0
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 17:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D068418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsWG-e_IUriT for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 17:41:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B18441893
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 17:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B18441893
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3027E86C2E; Wed, 21 Dec 2022 17:41:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 18:10:52 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 33482a73b98b30ca1c864325e1d74d2283463fc8
X-Git-Newrev: 316b26ecbe4f8a7539d49622d47987712f801892
X-Patchwork-Hint: ignore
Message-Id: <20221221174143.3027E86C2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] DEVELOPERS: add Christian
 Stewart to balena-engine package
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

commit: https://git.buildroot.net/buildroot/commit/?id=316b26ecbe4f8a7539d49622d47987712f801892
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fc644ed3be1ae52bf883f93083fc96f9fe1f2ee4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d63fe6250..48a24c4cea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -531,6 +531,7 @@ N:	Christian Kellermann <christian.kellermann@solectrix.de>
 F:	package/python-pylibftdi/
 
 N:	Christian Stewart <christian@paral.in>
+F:	package/balena-engine/
 F:	package/batman-adv/
 F:	package/catatonit/
 F:	package/cni-plugins/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
