Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A93C433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 13:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61C444119A;
	Fri, 14 Oct 2022 13:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61C444119A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pD6MrXtkJuah; Fri, 14 Oct 2022 13:54:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 889B14119B;
	Fri, 14 Oct 2022 13:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 889B14119B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72E2C1C1190
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 13:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A8B460D68
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 13:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A8B460D68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTDXHXguCjtT for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 13:53:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16A796F95F
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 13:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16A796F95F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1423886CA9; Fri, 14 Oct 2022 13:53:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 15:51:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2acba99893cbe76926229f00e333b444a5570c6d
X-Git-Newrev: 7b04fcea33a809dfd60bf60c5df1fc6f89555e74
X-Patchwork-Hint: ignore
Message-Id: <20221014135307.1423886CA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/isl: bump to version 0.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b04fcea33a809dfd60bf60c5df1fc6f89555e74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://groups.google.com/g/isl-announce/c/GkHKH-nVWw8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/isl/isl.hash | 2 +-
 package/isl/isl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/isl/isl.hash b/package/isl/isl.hash
index 001fc9d115..46d8e920f3 100644
--- a/package/isl/isl.hash
+++ b/package/isl/isl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  043105cc544f416b48736fff8caf077fb0663a717d06b1113f16e391ac99ebad  isl-0.24.tar.xz
+sha256  be7b210647ccadf90a2f0b000fca11a4d40546374a850db67adb32fad4b230d9  isl-0.25.tar.xz
 sha256  3a2c398103f6bca0f50a9a9465deca9230b370b0212af5fdf31ed88a36215c30  LICENSE
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index 51e608b304..ce9aaecebc 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ISL_VERSION = 0.24
+ISL_VERSION = 0.25
 ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = https://libisl.sourceforge.io
 ISL_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
