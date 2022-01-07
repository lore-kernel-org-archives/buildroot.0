Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72C8C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39D99812B1;
	Fri,  7 Jan 2022 17:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XtXESIe1omRa; Fri,  7 Jan 2022 17:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86DD881274;
	Fri,  7 Jan 2022 17:11:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FC391BF35F
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED8AA403E7
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TOPkZ4iaH15O for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:11:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1663E40192
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:11:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A6369826D2; Fri,  7 Jan 2022 17:05:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 18:09:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e00379361e16f24a348c12bb26eab4dc0af94e84
X-Git-Newrev: 211063b9534b498d581c0a1d6a0d4c2bb1bb0679
X-Patchwork-Hint: ignore
Message-Id: <20220107170533.A6369826D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvdpau: bump to version 1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=211063b9534b498d581c0a1d6a0d4c2bb1bb0679
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://gitlab.freedesktop.org/vdpau/libvdpau/-/tags/1.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvdpau/libvdpau.hash | 7 +++----
 package/libvdpau/libvdpau.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libvdpau/libvdpau.hash b/package/libvdpau/libvdpau.hash
index 0833d41bf4..653657322a 100644
--- a/package/libvdpau/libvdpau.hash
+++ b/package/libvdpau/libvdpau.hash
@@ -1,5 +1,4 @@
-# From https://lists.x.org/archives/xorg-announce/2019-August/003021.html
-sha256 b5a52eeac9417edbc396f26c40591ba5df0cd18285f68d84614ef8f06196e50e  libvdpau-1.3.tar.bz2
-sha512 c06c23062816e8b207d38d9d53df43a1b193bb9836b48bd6d79a63d76522e87d383c446285b9877fe9c99faa0d290da8a49ccbb58eefa138cc38d0929a8e1330  libvdpau-1.3.tar.bz2
 # Locally computed
-sha256 ce4af7294872ff07f6e82ae5f1f5eba926215b1e2fb6d55d64759de082458d61  COPYING
+sha256  4258824c5a4555ef31de0a7d82b3caf19e75a16a13949f1edafc5f6fb2d33f30  libvdpau-1.4.tar.bz2
+# Locally computed
+sha256  ce4af7294872ff07f6e82ae5f1f5eba926215b1e2fb6d55d64759de082458d61  COPYING
diff --git a/package/libvdpau/libvdpau.mk b/package/libvdpau/libvdpau.mk
index 63aecaf744..ae2f388855 100644
--- a/package/libvdpau/libvdpau.mk
+++ b/package/libvdpau/libvdpau.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVDPAU_VERSION = 1.3
+LIBVDPAU_VERSION = 1.4
 LIBVDPAU_SOURCE = libvdpau-$(LIBVDPAU_VERSION).tar.bz2
 LIBVDPAU_SITE = \
 	https://gitlab.freedesktop.org/vdpau/libvdpau/-/archive/$(LIBVDPAU_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
