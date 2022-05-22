Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E274C433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBD7540597;
	Sun, 22 May 2022 10:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hn5O8whnVpPu; Sun, 22 May 2022 10:24:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C86314057A;
	Sun, 22 May 2022 10:24:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66C6F1BF47E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 615634152B
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nyCi2_G-NI-S for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:22:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63D52415D2
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:22:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D53A985FD4; Sun, 22 May 2022 10:10:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 12:19:30 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2db718071f83b01ea971fe898da47658b9acf61f
X-Git-Newrev: 64d6c62350e3a387e4e40e1b3886e3d1d99b2d59
X-Patchwork-Hint: ignore
Message-Id: <20220522101055.D53A985FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl8189fs: bump
 revision to 73f826f0
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

commit: https://git.buildroot.net/buildroot/commit/?id=64d6c62350e3a387e4e40e1b3886e3d1d99b2d59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Update out-of-tree driver to make it work with Linux kernel v5.17.

Signed-off-by: Jan Havran <havran.jan@email.cz>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 80c11958e6c2228686964c2d6f4e95273403888e)
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
