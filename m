Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66172C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 18:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 023D74018B;
	Tue, 30 Apr 2024 18:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKJj8NONQhOx; Tue, 30 Apr 2024 18:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2C43401AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C43401AF;
	Tue, 30 Apr 2024 18:56:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68D381BF29A
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55D4C40635
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXCXjEiJygAj for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 18:56:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A41084060D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A41084060D
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 806C8862ED; Tue, 30 Apr 2024 18:56:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 20:54:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6210d28dbf66b2f0a42d945711dfd93c7329feb
X-Git-Newrev: 8b4551d7117f9cec1a3accd712d58ded5a9f9dcc
X-Patchwork-Hint: ignore
Message-Id: <20240430185643.806C8862ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiscsi: bump to version 1.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b4551d7117f9cec1a3accd712d58ded5a9f9dcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libiscsi/libiscsi.hash | 2 +-
 package/libiscsi/libiscsi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiscsi/libiscsi.hash b/package/libiscsi/libiscsi.hash
index 769035837c..5caecbc5d9 100644
--- a/package/libiscsi/libiscsi.hash
+++ b/package/libiscsi/libiscsi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c7848ac722c8361d5064654bc6e926c2be61ef11dd3875020a63931836d806df  libiscsi-1.19.0.tar.gz
+sha256  6321d802103f2a363d3afd9a5ae772de0b4052c84fe6a301ecb576b34e853caa  libiscsi-1.20.0.tar.gz
 sha256  88e3eccc48722b2a0eaff456dda94b8e8e123848d01f631969bec8e3c6c6eb85  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENCE-GPL-2.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index c8b6ddd123..ccee77bf64 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBISCSI_VERSION = 1.19.0
+LIBISCSI_VERSION = 1.20.0
 LIBISCSI_SITE = $(call github,sahlberg,libiscsi,$(LIBISCSI_VERSION))
 LIBISCSI_LICENSE = GPL-2.0+, LGPL-2.1+
 LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
