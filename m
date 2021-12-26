Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482BFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 22:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E494A40298;
	Sun, 26 Dec 2021 22:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7RwZ-FH1UbAH; Sun, 26 Dec 2021 22:34:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D02EE405ED;
	Sun, 26 Dec 2021 22:34:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92BEA1BF2B9
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8262660E1B
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:34:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lHqj9b1AF5PR for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 22:34:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C19DC60E1A
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 22:34:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0D82982B6F; Sun, 26 Dec 2021 22:28:47 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 23:34:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24e4c888c3d36e3943206ea55894b84344cc8b2e
X-Git-Newrev: f69205cd83b10a23bb6981605bae53cdc6a07850
X-Patchwork-Hint: ignore
Message-Id: <20211226222847.0D82982B6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/checksec: bump to version 2.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f69205cd83b10a23bb6981605bae53cdc6a07850
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update indentation in hash file (two spaces)
- Update hash of LICENSE.txt, link on BSD license added with:
  https://github.com/slimm609/checksec.sh/commit/ab89f24ad3cbf33d49716bb8ea4c4cc32ff771d5

https://github.com/slimm609/checksec.sh/blob/2.5.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/checksec/checksec.hash | 4 ++--
 package/checksec/checksec.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/checksec/checksec.hash b/package/checksec/checksec.hash
index 397cfe381e..41aae8188c 100644
--- a/package/checksec/checksec.hash
+++ b/package/checksec/checksec.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c5e2a8e188040fc34eb9362084778a2e25f8d1f888e47a2be09efa7cecd9c70d  LICENSE.txt
-sha256 d3c8e80bdd1cee0c2f0e60cb7a8a9482b82f651ea069e3a4453ae9a44072a632  checksec-2.2.2.tar.gz
+sha256  1034459d7cd2b0ee515c2b6b003375fec566fb59c838fc5e1961e1fcf76b54fa  checksec-2.5.0.tar.gz
+sha256  7888fee828bf56d547fc1f634e40638984148b4fc41373b7626eb465060640de  LICENSE.txt
diff --git a/package/checksec/checksec.mk b/package/checksec/checksec.mk
index e46e858437..61ef110f90 100644
--- a/package/checksec/checksec.mk
+++ b/package/checksec/checksec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKSEC_VERSION = 2.2.2
+CHECKSEC_VERSION = 2.5.0
 CHECKSEC_SITE = $(call github,slimm609,checksec.sh,$(CHECKSEC_VERSION))
 CHECKSEC_LICENSE = BSD-3-Clause
 CHECKSEC_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
