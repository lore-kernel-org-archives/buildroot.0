Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5BCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FC6460F2D;
	Sat, 12 Feb 2022 13:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gi_K0ZlVuwty; Sat, 12 Feb 2022 13:13:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D34F960746;
	Sat, 12 Feb 2022 13:13:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93BAF1BF954
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 830B561B89
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lm9ylRoYMIny for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:13:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D884E60592
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:13:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DF42482210; Sat, 12 Feb 2022 13:06:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 14:05:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e031008ce489dea29073c5750f5773c2e4b13cd
X-Git-Newrev: 1ddced072abefa001a10df56b9820e96db1b2b6f
X-Patchwork-Hint: ignore
Message-Id: <20220212130602.DF42482210@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/thermald: update URL in the docs
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ddced072abefa001a10df56b9820e96db1b2b6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Old project homepage was removed, so switch to github, already in use to
download the sources.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/thermald/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/thermald/Config.in b/package/thermald/Config.in
index 6d74a164b6..e5e15b9b8d 100644
--- a/package/thermald/Config.in
+++ b/package/thermald/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_THERMALD
 	  reaches a certain threshold, the Linux daemon activates
 	  various cooling methods to try to cool the system.
 
-	  https://01.org/linux-thermal-daemon
+	  https://github.com/intel/thermal_daemon
 
 comment "thermald needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_i386 || BR2_x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
