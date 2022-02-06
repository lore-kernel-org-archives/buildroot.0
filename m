Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C054C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C46A40301;
	Sun,  6 Feb 2022 14:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5pSUb6M7bQY; Sun,  6 Feb 2022 14:27:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B868402F8;
	Sun,  6 Feb 2022 14:27:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4AD21BF976
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEC06400C1
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CUVef8OkL91v for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:26:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2126400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:26:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5F16A82BCD; Sun,  6 Feb 2022 14:19:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 15:24:03 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 72f648703e41ffc1268a57985e113a53fabc65e2
X-Git-Newrev: fad154253deb5b5399ea52a19ed6608dcd00ee4d
X-Patchwork-Hint: ignore
Message-Id: <20220206141931.5F16A82BCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: add entry for
 libqmi and libqrtr-glib to Yegor Yefremov
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

commit: https://git.buildroot.net/buildroot/commit/?id=fad154253deb5b5399ea52a19ed6608dcd00ee4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 73ce754531b5e45bd42b56c58718fbacc754406f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bd1d2eca6b..7ec36e2185 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2753,6 +2753,8 @@ F:	package/libical/
 F:	package/libmbim/
 F:	package/libndp/
 F:	package/libnftnl/
+F:	package/libqmi/
+F:	package/libqrtr-glib/
 F:	package/libsoc/
 F:	package/libsocketcan/
 F:	package/libubox/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
