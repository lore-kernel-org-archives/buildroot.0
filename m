Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B12C54E67
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 14:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6AE140797;
	Tue, 26 Mar 2024 14:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7AQS-1l34ry; Tue, 26 Mar 2024 14:35:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ADF4407B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ADF4407B9;
	Tue, 26 Mar 2024 14:35:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE20F1BF4E2
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB5C56082F
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ba-QGt5MzGu for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 14:35:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 260FE607B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 260FE607B9
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 14:35:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D1BF8422F; Tue, 26 Mar 2024 14:35:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 15:29:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef745432107e980f085ed3638c07f267fc2c1a96
X-Git-Newrev: e8fcd9876d9e0d0fff8b8aca2462d89d69b0601b
X-Patchwork-Hint: ignore
Message-Id: <20240326143538.1D1BF8422F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove David Bachelart
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8fcd9876d9e0d0fff8b8aca2462d89d69b0601b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

David's e-mail is bouncing:

<david.bachelart@bbright.com>: host aspmx.l.google.com[2a00:1450:400c:c0c::1a]
    said: 550-5.1.1 The email account that you tried to reach does not exist.
    Please try 550-5.1.1 double-checking the recipient's email address for
    typos or 550-5.1.1 unnecessary spaces. For more information, go to 550
    5.1.1  https://support.google.com/mail/?p=NoSuchUser
    n19-20020a05600c4f9300b00414111d4396si2497070wmq.117 - gsmtp (in reply to
    RCPT TO command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 884edfe149..313fc16b9d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -773,15 +773,6 @@ N:	Dario Binacchi <dariobin@libero.it>
 F:	package/uboot-bootcount/
 F:	package/libmnl/
 
-N:	David Bachelart <david.bachelart@bbright.com>
-F:	package/ccrypt/
-F:	package/dos2unix/
-F:	package/ipmiutil/
-F:	package/jsmn/
-F:	package/python-daemon/
-F:	package/sslh/
-F:	package/udpxy/
-
 N:	David Bender <codehero@gmail.com>
 F:	package/benejson/
 F:	package/cgic/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
