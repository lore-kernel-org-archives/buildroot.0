Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5027CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06ACB84C4E;
	Sun, 24 Jul 2022 12:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06ACB84C4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMHW2MNF_mRo; Sun, 24 Jul 2022 12:31:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12C8E84BA3;
	Sun, 24 Jul 2022 12:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C8E84BA3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29FC01BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0431D40B97
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0431D40B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 894YBriw9I98 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:31:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DCD040521
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DCD040521
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2448B85C4E; Sun, 24 Jul 2022 12:17:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 14:22:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52b3b3661c336693a0d23cb95bde2f258ec176b8
X-Git-Newrev: e95a8d6a1c6195ae534cd2148d20ca81f2de74ed
X-Patchwork-Hint: ignore
Message-Id: <20220724121731.2448B85C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvdpau: bump to version 1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=e95a8d6a1c6195ae534cd2148d20ca81f2de74ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.freedesktop.org/vdpau/libvdpau/-/tags/1.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libvdpau/libvdpau.hash | 2 +-
 package/libvdpau/libvdpau.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvdpau/libvdpau.hash b/package/libvdpau/libvdpau.hash
index 653657322a..ac974902d0 100644
--- a/package/libvdpau/libvdpau.hash
+++ b/package/libvdpau/libvdpau.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4258824c5a4555ef31de0a7d82b3caf19e75a16a13949f1edafc5f6fb2d33f30  libvdpau-1.4.tar.bz2
+sha256  a5d50a42b8c288febc07151ab643ac8de06a18446965c7241f89b4e810821913  libvdpau-1.5.tar.bz2
 # Locally computed
 sha256  ce4af7294872ff07f6e82ae5f1f5eba926215b1e2fb6d55d64759de082458d61  COPYING
diff --git a/package/libvdpau/libvdpau.mk b/package/libvdpau/libvdpau.mk
index ae2f388855..67ffdf17c1 100644
--- a/package/libvdpau/libvdpau.mk
+++ b/package/libvdpau/libvdpau.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVDPAU_VERSION = 1.4
+LIBVDPAU_VERSION = 1.5
 LIBVDPAU_SOURCE = libvdpau-$(LIBVDPAU_VERSION).tar.bz2
 LIBVDPAU_SITE = \
 	https://gitlab.freedesktop.org/vdpau/libvdpau/-/archive/$(LIBVDPAU_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
