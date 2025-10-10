Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F695CCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 11:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E835614B5;
	Fri, 10 Oct 2025 11:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpBPAlHyzjI0; Fri, 10 Oct 2025 11:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B313614BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B313614BA;
	Fri, 10 Oct 2025 11:35:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D625514B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4294614BA
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iO_fV8umLTGj for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 11:35:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B191614B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B191614B5
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:35:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14B9186E98; Fri, 10 Oct 2025 11:35:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 13:28:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb13611e6414e01f5a34cc065913fb1adcdf775c
X-Git-Newrev: 702220925fd426e1f5a28e8f76c46a654791a274
X-Patchwork-Hint: ignore
Message-Id: <20251010113513.14B9186E98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoundtouch: bump version to
 2.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=702220925fd426e1f5a28e8f76c46a654791a274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libsoundtouch/libsoundtouch.hash | 2 +-
 package/libsoundtouch/libsoundtouch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
index 125bcd47a5..853f3b90bb 100644
--- a/package/libsoundtouch/libsoundtouch.hash
+++ b/package/libsoundtouch/libsoundtouch.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  43b23dfac2f64a3aff55d64be096ffc7b73842c3f5665caff44975633a975a99  soundtouch-2.3.3.tar.gz
+sha256  3dda3c9ab1e287f15028c010a66ab7145fa855dfa62763538f341e70b4d10abd  soundtouch-2.4.0.tar.gz
 sha256  84c6d82dc7de80f5b73f231edfd3ddc5b53513908117452bfa37ea36bb4b7e0a  COPYING.TXT
diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index 099539250c..3140d890f5 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOUNDTOUCH_VERSION = 2.3.3
+LIBSOUNDTOUCH_VERSION = 2.4.0
 LIBSOUNDTOUCH_SOURCE = soundtouch-$(LIBSOUNDTOUCH_VERSION).tar.gz
 LIBSOUNDTOUCH_SITE = https://www.surina.net/soundtouch
 LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
