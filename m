Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE54CECAAD5
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 21:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 358AB409EB;
	Sat, 27 Aug 2022 21:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 358AB409EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 62hT1XHCU8Ua; Sat, 27 Aug 2022 21:12:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CACC3409E5;
	Sat, 27 Aug 2022 21:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CACC3409E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A2631BF479
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 21:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E0F760E0A
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 21:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E0F760E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJVPSgffEGe5 for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 21:12:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9670160E09
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 21:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9670160E09
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2FCCF87E53; Sat, 27 Aug 2022 20:57:47 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 23:03:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 204002f672a7acb9af326b3ad4e378246cdc65ca
X-Git-Newrev: 7b70be7e936982706c0a7f8abb360133d05695c6
X-Patchwork-Hint: ignore
Message-Id: <20220827205747.2FCCF87E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: Add qt6base hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b70be7e936982706c0a7f8abb360133d05695c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hash file with just the qt6base tarball hash

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/qt6/qt6base/qt6base.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
new file mode 100644
index 0000000000..31ed2494af
--- /dev/null
+++ b/package/qt6/qt6base/qt6base.hash
@@ -0,0 +1,2 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtbase-everywhere-src-6.3.1.tar.xz.sha256
+sha256  0a64421d9c2469c2c48490a032ab91d547017c9cc171f3f8070bc31888f24e03  qtbase-everywhere-src-6.3.1.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
