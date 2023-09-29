Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07B1E728F3
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85799615FF;
	Fri, 29 Sep 2023 20:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85799615FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6suhlnr6qmkt; Fri, 29 Sep 2023 20:53:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5AE060EA6;
	Fri, 29 Sep 2023 20:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5AE060EA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A40A1BF990
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3437760EA6
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3437760EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_gt5B383mNz for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:53:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62C7C60EAB
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62C7C60EAB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EF9283738; Fri, 29 Sep 2023 20:53:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:51:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c15169f5ae57d88a77df34cc896044a37c9597b
X-Git-Newrev: be87362f101b11cf765fa9c38501abd3b0b09795
X-Patchwork-Hint: ignore
Message-Id: <20230929205322.4EF9283738@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump version to 0.3.80
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

commit: https://git.buildroot.net/buildroot/commit/?id=be87362f101b11cf765fa9c38501abd3b0b09795
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 88fd9c2fab..2f04931284 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  3027cadf9933adb03b1895069c79f4eb39f7f2873b962c674ee1fec316ec60e1  pipewire-0.3.77.tar.bz2
+sha256  cf4b770fe4e2379527f63e01b52b50a37d529608f766ecb40fe57da4c087a507  pipewire-0.3.80.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 994da081b7..f0b37a0e43 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.77
+PIPEWIRE_VERSION = 0.3.80
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
