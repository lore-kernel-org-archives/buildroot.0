Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07258C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E154408D4;
	Fri, 22 Jul 2022 07:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E154408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eg3uw2FqY2E8; Fri, 22 Jul 2022 07:47:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56531408A5;
	Fri, 22 Jul 2022 07:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56531408A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 099A21BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6AD041B88
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6AD041B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sc2sevZB0XAM for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:47:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE65941B73
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE65941B73
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D2CD184167; Fri, 22 Jul 2022 07:33:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:46:51 +0200
Subject: [git commit branch/2022.05.x] DEVELOPERS: drop Gaël Portay
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: fa3239f7c1a5efb7d352f9d7ded9de7921bd7c5b
X-Git-Newrev: 9f0e851d4991fc228838ee8590cb880878334067
X-Patchwork-Hint: ignore
Message-Id: <20220722073353.D2CD184167@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============6634914374424853262=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6634914374424853262==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9f0e851d4991fc228838ee8590cb880878334067
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
index aa18de83bc..780ec20418 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1044,11 +1044,6 @@ F: 	package/elixir/
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
 
-N:	Gaël Portay <gael.portay@collabora.com>
-F:	package/qt5/qt5virtualkeyboard/
-F:	package/qt5/qt5webengine/
-F:	package/qt5/qt5webkit/
-
 N:	Gao Xiang <hsiangkao@aol.com>
 F:	package/erofs-utils/
 

--===============6634914374424853262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6634914374424853262==--
