Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08994C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 22:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C495561355;
	Fri, 10 Dec 2021 22:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UngMQx5IgUhe; Fri, 10 Dec 2021 22:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3990F61345;
	Fri, 10 Dec 2021 22:06:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31D551BF3D6
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 22:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA1E16134C
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 22:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJGklyrs1qZ1 for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 22:06:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D50F61355
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 22:06:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 98D70825AC; Fri, 10 Dec 2021 22:01:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 23:05:31 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 2205f813ce1f084d720ee4002f4645961dc1e0f2
X-Git-Newrev: 0e4c8db58e1dad6812bb53e2ee335de297caa397
X-Patchwork-Hint: ignore
Message-Id: <20211210220118.98D70825AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] linux: fix typo in
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH in the help text
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
Content-Type: multipart/mixed; boundary="===============5785915621093116963=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5785915621093116963==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0e4c8db58e1dad6812bb53e2ee335de297caa397
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

"Path to to out-of-tree..." -> "Path to the out-of-tree..."

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8f3e2a6678e173782748e3981a4bcfb06fb7f980)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 078ef56cc4..3e7fc0b567 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -411,7 +411,7 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Out-of-tree Device Tree Source file paths"
 	help
-	  Path to to out-of-tree device tree source files.
+	  Path to the out-of-tree device tree source files.
 	  You can provide a list of dts paths to copy and
 	  build, separated by spaces.
 

--===============5785915621093116963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5785915621093116963==--
