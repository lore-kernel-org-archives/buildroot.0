Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69833C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10CDD81435;
	Wed, 28 Dec 2022 19:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10CDD81435
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V8Ub_oIu2pu9; Wed, 28 Dec 2022 19:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ED688142E;
	Wed, 28 Dec 2022 19:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ED688142E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44C741BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29D2E401FF
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29D2E401FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exmzGpOYg0ni for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:54:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5001740106
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 19:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5001740106
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DBF186F51; Wed, 28 Dec 2022 19:54:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 20:54:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef3052674a7104990037b7da60cbbcb9d316e764
X-Git-Newrev: be69066d8fee8b30dad8317bb4aad425bc005623
X-Patchwork-Hint: ignore
Message-Id: <20221228195445.3DBF186F51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop ucl
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

commit: https://git.buildroot.net/buildroot/commit/?id=be69066d8fee8b30dad8317bb4aad425bc005623
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 85c5af46ad6c18841576c0f7abe241a617a44cb7 forgot to drop ucl from
DEVELOPERS file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 48e7e08b3a..0eea9c33d9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1091,7 +1091,6 @@ F:	package/libsodium/
 F:	package/php-amqp/
 F:	package/python-cherrypy/
 F:	package/sane-backends/
-F:	package/ucl/
 F:	package/upx/
 F:	package/zxing-cpp/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
