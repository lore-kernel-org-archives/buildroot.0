Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63396C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 09:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CAF26075A;
	Sun,  1 Sep 2024 09:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idj8SYqYql29; Sun,  1 Sep 2024 09:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0963D6073D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0963D6073D;
	Sun,  1 Sep 2024 09:04:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E46D01BF86B
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE5AB40B40
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxjpFw9hOFz7 for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 09:04:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5A5A409FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5A5A409FE
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 09:04:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1971868AC; Sun,  1 Sep 2024 09:04:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 11:03:51 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 7bf717d3226f5c440eae1c04070e61a633c527a4
X-Git-Newrev: 88f005a95cc8e54e228936cdf18fe7f86968ea93
X-Patchwork-Hint: ignore
Message-Id: <20240901090452.E1971868AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] DEVELOPERS: add Bernd
 Kuhls for openvpn
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

commit: https://git.buildroot.net/buildroot/commit/?id=88f005a95cc8e54e228936cdf18fe7f86968ea93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8f1c2ad8c66eaf2be11d6621ae414709f37d893e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 88489a99be..c19ac3cbe9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -456,6 +456,7 @@ F:	package/mpg123/
 F:	package/ntp/
 F:	package/nut/
 F:	package/onevpl-intel-gpu/
+F:	package/openvpn/
 F:	package/opus/
 F:	package/pciutils/
 F:	package/perl-crypt-openssl-guess/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
