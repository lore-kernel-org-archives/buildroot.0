Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE502C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 12:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45600404EF;
	Tue, 28 Dec 2021 12:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PEZaZsi-4B0W; Tue, 28 Dec 2021 12:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FB6440579;
	Tue, 28 Dec 2021 12:59:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFC0E1BF59C
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 12:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 982C880B6A
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 12:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rie8F7FfIVyX for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 12:58:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E80DB81355
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 12:58:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9346782BA6; Tue, 28 Dec 2021 12:52:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 13:56:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 164b022147ab394fd85742fe2e43c91d5787564d
X-Git-Newrev: dddb65efbdf2c7952f22a1e51009f17f1676db4a
X-Patchwork-Hint: ignore
Message-Id: <20211228125231.9346782BA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibmm: bump to version 2.68.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=dddb65efbdf2c7952f22a1e51009f17f1676db4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.68.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index 389ee5c369..f0bc7f4e71 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.66/glibmm-2.66.0.sha256sum
-sha256  9e1db7d43d2e2d4dfa2771354e21a69a6beec7c446b711619cf8c779e13a581e  glibmm-2.66.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.68/glibmm-2.68.2.sha256sum
+sha256  91e0a8618f7b82db4aaf2648932ea2bcfe626ad030068c18fa2d106fd838d8ad  glibmm-2.68.2.tar.xz
 # License files, locally calculated
 sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 30fbe65f6e..578267c75e 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.66
-GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
+GLIBMM_VERSION_MAJOR = 2.68
+GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).2
 GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
