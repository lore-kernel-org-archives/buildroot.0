Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B999C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C61B340BAB;
	Sun, 11 Sep 2022 09:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C61B340BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WpEKdATDmzuX; Sun, 11 Sep 2022 09:07:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11A6B40629;
	Sun, 11 Sep 2022 09:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11A6B40629
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB9141BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B39A481947
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B39A481947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxESs9PjMiBt for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E994B8136D
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E994B8136D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DA057835E4; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 14:07:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fc91c4359eab23a9f4a655392a40fb79d482a48
X-Git-Newrev: 294339cb743b56255a209eac8a71fc68ac92e471
X-Patchwork-Hint: ignore
Message-Id: <20220911084827.DA057835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Raphael for slirp4netns
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

commit: https://git.buildroot.net/buildroot/commit/?id=294339cb743b56255a209eac8a71fc68ac92e471
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 08d24fba5c..54e1c1fe7b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2513,6 +2513,9 @@ F:	support/testing/tests/package/test_python_jmespath.py
 F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 
+N:	Raphael Pavlidis <raphael.pavlidis@googlemail.com>
+F:	package/slirp4netns/
+
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
 F:	package/paho-mqtt-cpp/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
