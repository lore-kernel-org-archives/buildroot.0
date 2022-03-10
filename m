Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE261C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6594F40951;
	Thu, 10 Mar 2022 21:28:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id omHu73Mctjug; Thu, 10 Mar 2022 21:28:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D37340948;
	Thu, 10 Mar 2022 21:28:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E33F1C1135
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2AE361288
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OTX2BmRh8JHN for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:27:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36E7560F74
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:27:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9FC4E83C16; Thu, 10 Mar 2022 21:18:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 22:09:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27be79eeeb8e6d60c5ae01499b6d4eb2e063e3ea
X-Git-Newrev: cec0fabf14527716c55f8d5496829667bfef8c6a
X-Patchwork-Hint: ignore
Message-Id: <20220310211843.9FC4E83C16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5wayland: bump to version
 ce2caf493a1343fbd9f8e4c85baf6a61c057f242
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

commit: https://git.buildroot.net/buildroot/commit/?id=cec0fabf14527716c55f8d5496829667bfef8c6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5wayland/qt5wayland.hash | 2 +-
 package/qt5/qt5wayland/qt5wayland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 1a7400de67..2acdd1643c 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a29d52c7b12987ed56d922455e0776e161075392969f7c6a8b141b00bd3dd46b  qtwayland-b6d85c2a75f5618e87267f5b5c361455be257a17.tar.bz2
+sha256  f43c8ce9070249dfa91b94c09bcbf7c4fa881daf5eecdb9ff93c0eed43a3b7b0  qtwayland-ce2caf493a1343fbd9f8e4c85baf6a61c057f242.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index bcc4915022..61182f611c 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WAYLAND_VERSION = b6d85c2a75f5618e87267f5b5c361455be257a17
+QT5WAYLAND_VERSION = ce2caf493a1343fbd9f8e4c85baf6a61c057f242
 QT5WAYLAND_SITE = $(QT5_SITE)/qtwayland/-/archive/$(QT5WAYLAND_VERSION)
 QT5WAYLAND_SOURCE = qtwayland-$(QT5WAYLAND_VERSION).tar.bz2
 QT5WAYLAND_DEPENDENCIES = wayland
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
