Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EF1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 17:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC4A6832AA;
	Thu, 23 Dec 2021 17:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cH38ulIoECSw; Thu, 23 Dec 2021 17:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4423383268;
	Thu, 23 Dec 2021 17:45:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 889D91BF2E5
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7541A400C4
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k2tVP0DckBIP for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 17:45:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E021400D8
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 17:45:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1829581D36; Thu, 23 Dec 2021 17:40:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 23 Dec 2021 18:45:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7056bc60fa9c2e03c40e044f98c31828ae9ae62
X-Git-Newrev: d9721168b3b0970f9d2985c09e97274d0f429dfc
X-Patchwork-Hint: ignore
Message-Id: <20211223174019.1829581D36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-apcu: fix license hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9721168b3b0970f9d2985c09e97274d0f429dfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix license hash which is wrong since the addition of the package in
commit 8ddeeffa186d8bce875ac713c1e71483c618842a

While at it, update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/0829e7f1f7a18976363b3e3f79ac9865cd099df4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-apcu/php-apcu.hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/php-apcu/php-apcu.hash b/package/php-apcu/php-apcu.hash
index 8b286d5ae3..3aae4120d2 100644
--- a/package/php-apcu/php-apcu.hash
+++ b/package/php-apcu/php-apcu.hash
@@ -1,2 +1,3 @@
-sha256 b99d40fafec06f4d132fcee53e7526ddbfc1d041ea6e04e17389dfad28f9c390  apcu-5.1.20.tgz
-sha256 c48761c645c6fa42b57af0e65d893217dc69bcd8d879ace74d6abbf1c5f73a8f  LICENSE
+# Locally computed:
+sha256  b99d40fafec06f4d132fcee53e7526ddbfc1d041ea6e04e17389dfad28f9c390  apcu-5.1.20.tgz
+sha256  ecc8b74820c32fb82ddee80446205408585d75d1632ac959fb3cdf8eaf3877b5  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
