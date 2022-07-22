Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7069C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BD1B60D62;
	Fri, 22 Jul 2022 07:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BD1B60D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lgI1R7ivruAi; Fri, 22 Jul 2022 07:49:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21D8260E8C;
	Fri, 22 Jul 2022 07:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21D8260E8C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDED91BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05E33605A5
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05E33605A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JQe4WusG-L7 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:47:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F93160C03
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F93160C03
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 464FB84167; Fri, 22 Jul 2022 07:33:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:46:47 +0200
Subject: [git commit branch/2022.02.x] DEVELOPERS: drop Gaël Portay
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 226e5cb4ef8a1391e9b9bd507382e315ff64be9c
X-Git-Newrev: fc8225612727894987cd328058daa3a7e6dd1825
X-Patchwork-Hint: ignore
Message-Id: <20220722073358.464FB84167@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============5062244603684376202=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5062244603684376202==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fc8225612727894987cd328058daa3a7e6dd1825
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Gaël Portay is apparently no longer at Collabora:

<gael.portay@collabora.com>: host mail.collabora.co.uk[46.235.227.172] said:
    550 5.1.1 <gael.portay@collabora.com>: Recipient address rejected: User
    unknown in local recipient table (in reply to RCPT TO command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 91562c9045eabe50b1bf78d6cde9820a34a21391)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b7a4cb64f1..27ce7a2d79 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1041,11 +1041,6 @@ F: 	package/elixir/
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
 
-N:	Gaël Portay <gael.portay@collabora.com>
-F:	package/qt5/qt5virtualkeyboard/
-F:	package/qt5/qt5webengine/
-F:	package/qt5/qt5webkit/
-
 N:	Gao Xiang <hsiangkao@aol.com>
 F:	package/erofs-utils/
 

--===============5062244603684376202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5062244603684376202==--
