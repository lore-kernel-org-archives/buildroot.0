Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E30C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 20:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 292D8611B6;
	Sat, 16 Apr 2022 20:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6zpyA24bjsC; Sat, 16 Apr 2022 20:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FF6C611BC;
	Sat, 16 Apr 2022 20:00:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 33A3E1BF239
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 19:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20C2A41C19
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 19:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LuCvQ_S1myIw for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 19:59:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A6A341C0C
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 19:59:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5FC5B83D21; Sat, 16 Apr 2022 19:49:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 21:57:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c95207037168015a942665d25d0341815fc57408
X-Git-Newrev: 80c11958e6c2228686964c2d6f4e95273403888e
X-Patchwork-Hint: ignore
Message-Id: <20220416194957.5FC5B83D21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189fs: bump revision to
 73f826f0
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

commit: https://git.buildroot.net/buildroot/commit/?id=80c11958e6c2228686964c2d6f4e95273403888e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update out-of-tree driver to make it work with Linux kernel v5.17.

Signed-off-by: Jan Havran <havran.jan@email.cz>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index a7c3641841..f9772f2a89 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2350a15f866ac82a33c11f9505f2deb0f4aa819b9ac1f4809f8d6893412e73fd  rtl8189fs-e10294d2ded27586149fedee1f834d75477b8b40.tar.gz
+sha256  fd74248b8cc62e54a954502228be221ace6051832a972b8b3005cc05e9c87761  rtl8189fs-73f826f0fa74b2fc1ad67eaf92bf9787947ae673.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 83c7f3ee0d..40b735c21b 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = e10294d2ded27586149fedee1f834d75477b8b40
+RTL8189FS_VERSION = 73f826f0fa74b2fc1ad67eaf92bf9787947ae673
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
