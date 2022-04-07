Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FC1C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 08:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7A2641955;
	Thu,  7 Apr 2022 08:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k81J-Cka6BzU; Thu,  7 Apr 2022 08:36:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F34E40282;
	Thu,  7 Apr 2022 08:36:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE9351BF3A1
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 08:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D720783ED6
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 08:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQhkNihG6x8U for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 08:36:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD76F83ED3
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 08:36:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7A6BF836B9; Thu,  7 Apr 2022 08:27:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Apr 2022 10:33:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac91235797fe9b234fb820c0112f21c26be1349f
X-Git-Newrev: 19e12a006470c41b8ea9d67642fd17f26373c4a1
X-Patchwork-Hint: ignore
Message-Id: <20220407082723.7A6BF836B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.02.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=19e12a006470c41b8ea9d67642fd17f26373c4a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ef68ba43d965528bd5c622407dfb9a5e3b343493)
[Peter: drop Makefile/Vagrantfile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/CHANGES b/CHANGES
index 370f89aa6f..e37c6d0fe7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -803,6 +803,17 @@
 	#13751: libopenssl (static): huge drop in performance in newer ..
 	#13771: package htop has undeclared dependency on host python
 
+2021.02.12, released April 6th, 2022
+
+	Important / security related fixes.
+
+	pkg-stats: Limit memory use for CPE matching
+
+	Updated/fixed packages: gdk-pixbuf, jack2, libzlib, matio,
+	nbd, netatalk, opus, python-paramiko, python-treq,
+	python-twisted, spidev_test, unbound, urandom-scripts, vim,
+	wireshark, zlib-ng, zziplib
+
 2021.02.11, released March 25th, 2022
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
