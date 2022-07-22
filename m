Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D939C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 06:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCE4160EE5;
	Fri, 22 Jul 2022 06:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCE4160EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZbW9rfBAzko; Fri, 22 Jul 2022 06:38:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C477960AE0;
	Fri, 22 Jul 2022 06:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C477960AE0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA2761BF855
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8173260E96
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8173260E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kg0A29jsT5Wj for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 06:34:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C001260E28
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 06:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C001260E28
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C39408414C; Fri, 22 Jul 2022 06:20:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 08:32:31 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7070762da947cd6ca8d42bc18cf976b0a3058037
X-Git-Newrev: 4b53df1729fc45998e1dd55b2fd32b81fe39def2
X-Patchwork-Hint: ignore
Message-Id: <20220722062038.C39408414C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gst1-plugins-bad:
 bump version to 1.20.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b53df1729fc45998e1dd55b2fd32b81fe39def2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 65852010cde3e4e9d52d7b8bfce463ed391bd202)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 2874d955f4..5a413cd350 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.20.1.tar.xz.sha256sum
-sha256  09d3c2cf5911f0bc7da6bf557a55251779243d3de216b6a26cc90c445b423848  gst-plugins-bad-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.20.3.tar.xz.sha256sum
+sha256  7a11c13b55dd1d2386dd902219e41cbfcdda8e1e0aa3e738186c95074b35da4f  gst-plugins-bad-1.20.3.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 343a53a3c5..57974d723a 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.20.1
+GST1_PLUGINS_BAD_VERSION = 1.20.3
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
