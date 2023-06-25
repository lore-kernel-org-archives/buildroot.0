Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3675EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 15:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E7D540998;
	Sun, 25 Jun 2023 15:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E7D540998
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XKgxaEtD8Sps; Sun, 25 Jun 2023 15:01:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 401DD415A6;
	Sun, 25 Jun 2023 15:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 401DD415A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3229A1BF947
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BF2860BCA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BF2860BCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCUWAnI9TWD8 for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 15:01:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE90D60A8C
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 15:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE90D60A8C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAD8F84ABB; Sun, 25 Jun 2023 15:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 16:40:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15886f2761e358a884d6a70bc30889bc69742c5f
X-Git-Newrev: db45cc593e66598b4d345dd348b0bfe2b388b557
X-Patchwork-Hint: ignore
Message-Id: <20230625150109.AAD8F84ABB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-dummy:
 bump version to 0.4.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=db45cc593e66598b4d345dd348b0bfe2b388b557
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-May/003394.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash    | 6 +++---
 package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
index eed28d3fde..6d7d0b4bc2 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003155.html
-sha256  e78ceae5c8c0588c7cb658f2afc3a9fac9ef665b52a75b01f8e9c5449a4e1e5a  xf86-video-dummy-0.4.0.tar.xz
-sha512  1150a84c4f17215b9c579d8ce9399d547a01970bf7b5396653f14beb13a62deefe3008bf3ad6a2c5c0f46da4cbc0b840c18a7dff339e3b882d108183fa1d30d9  xf86-video-dummy-0.4.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-May/003394.html
+sha256  351920a7fd0f759a3ac972a5999b3ffed46f07fb52a99f319bfb5b6a59d3dfaf  xf86-video-dummy-0.4.1.tar.xz
+sha512  ff7fd8b668e5e9f40a5d27f82599b7a455a8162fc1a247195335c17980f00ce10ae6b2c062239cbaa67d8684c86174f85b398dd7f7065d36f69294bd6f2469de  xf86-video-dummy-0.4.1.tar.xz
 # Locally calculated
 sha256  e29aa81e74563d14e5633963107c030e74e8352ea7dafee1a9d7e19b7d0e887b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index e863b1e506..f7f05c7c41 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.4.0
+XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.4.1
 XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_DUMMY_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
