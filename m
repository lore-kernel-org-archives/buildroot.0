Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6520CCF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BB04606D5;
	Sat, 12 Oct 2024 15:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwvUIKjpccXb; Sat, 12 Oct 2024 15:03:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5782460701
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5782460701;
	Sat, 12 Oct 2024 15:03:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FB3D1BF47E
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB83B60628
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uimV3E6lnaC for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2C7160638
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2C7160638
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:02:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED1FB85E1F; Sat, 12 Oct 2024 15:02:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:02 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: e0467347ed39b01c09cee6cd405bd8e24e21b7f5
X-Git-Newrev: d1b3a69a87dd8749bd00d4fe76aa2bfa85fd1229
X-Patchwork-Hint: ignore
Message-Id: <20241012150251.ED1FB85E1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/qt5base: fix
 'from' typo in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1b3a69a87dd8749bd00d4fe76aa2bfa85fd1229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 53e265522ff758f45839b43d6685e54693b3c91c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...id-breaking-compilation-for-obscure-EGLNativeDisplayType-types.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/0005-eglfs-avoid-breaking-compilation-for-obscure-EGLNativeDisplayType-types.patch b/package/qt5/qt5base/0005-eglfs-avoid-breaking-compilation-for-obscure-EGLNativeDisplayType-types.patch
index 3621cdb2d3..9e89d8a5cf 100644
--- a/package/qt5/qt5base/0005-eglfs-avoid-breaking-compilation-for-obscure-EGLNativeDisplayType-types.patch
+++ b/package/qt5/qt5base/0005-eglfs-avoid-breaking-compilation-for-obscure-EGLNativeDisplayType-types.patch
@@ -27,7 +27,7 @@ It is to be noted, though, that in some ABIs (like x32), the size of a
 nativeDisplay that is not already a pointer, might be bigger than that
 of a pointer. There is not much we can do here anyway, since there would
 be no way to fit that in a void* to begin with, and the build will still
-fail for those situations. Those types of ABIs are far frome being
+fail for those situations. Those types of ABIs are far from being
 widespread, the most prominent one, x32, even being retired...
 
 To be noted further: a more usual solution (as suggested in QTBUG-72567
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
