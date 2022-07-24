Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31D4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 795E483EE8;
	Sun, 24 Jul 2022 19:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 795E483EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jvd9tqfZGYeS; Sun, 24 Jul 2022 19:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73F4883EB5;
	Sun, 24 Jul 2022 19:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73F4883EB5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 098991BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D603A6104A
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D603A6104A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcnTSjf8DCAS for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0884260C0F
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0884260C0F
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3A02385CC9; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b766e6abec4c1368836225fa4cf4ea8663fde96
X-Git-Newrev: 31c1325a0288cb6fbc330553bed9b264fb016b2a
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.3A02385CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/x11r7/xdriver_xf86-input-synaptics: bump version to 1.9.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=31c1325a0288cb6fbc330553bed9b264fb016b2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../xdriver_xf86-input-synaptics.hash                          | 10 ++++------
 .../xdriver_xf86-input-synaptics.mk                            |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
index b482a1db3b..97d55f2e2d 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-May/002899.html
-md5 cfb79d3c975151f9bbf30b727c260cb9  xf86-input-synaptics-1.9.1.tar.bz2
-sha1 07eeef716820105cae959bbc3aa103e2fcfd0084  xf86-input-synaptics-1.9.1.tar.bz2
-sha256 7af83526eff1c76e8b9e1553b34245c203d029028d8044dd9dcf71eef1001576  xf86-input-synaptics-1.9.1.tar.bz2
-sha512 978eddd456aa7361047bc3d72e5127b24b13de29b0dddb6a0acc9f9da93931baa2b22fb5d1e6be164f629a11e5d97d753b835426435396b45b1af5eb8d546c3f  xf86-input-synaptics-1.9.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003181.html
+sha256  b8fa4aab913fc63754bbd6439e020658c412743a055201ddf212760593962c38  xf86-input-synaptics-1.9.2.tar.xz
+sha512  6fd46505f22bba79f612fbd48dddd4818f7d874cc29caac71840744de27f1d224c68861e3a18d2a866b78178924d2f093f5260e27b221aa1fb17dbc09d66b649  xf86-input-synaptics-1.9.2.tar.xz
 # Locally computed
-sha256 e14dc9a27158cadaeea8bcc2c70069762f05adb29030a444336bfde268751dc7  COPYING
+sha256  e14dc9a27158cadaeea8bcc2c70069762f05adb29030a444336bfde268751dc7  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index c8ef98f8e4..888f60b2fb 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.9.1
-XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.9.2
+XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.xz
+XDRIVER_XF86_INPUT_SYNAPTICS_SITE = https://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE = MIT
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = libevdev xserver_xorg-server xorgproto mtdev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
