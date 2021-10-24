Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236F8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:04:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88ED60F12
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B88ED60F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7265440265;
	Sun, 24 Oct 2021 14:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JamfHuMdcgUl; Sun, 24 Oct 2021 14:03:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0BA0401E3;
	Sun, 24 Oct 2021 14:03:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B88D1BF2A2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7911740118
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bzXy8vadqSIb for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 14:03:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E0A040102
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 14:03:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E9173885DD; Sun, 24 Oct 2021 14:00:36 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 16:03:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 226d5b3b95c1c54449c31358c888640281d45a33
X-Git-Newrev: a00ed30780819c72174ae959bdd6f15ed961e938
X-Patchwork-Hint: ignore
Message-Id: <20211024140036.E9173885DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sg3_utils: bump to version 1.46
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

commit: https://git.buildroot.net/buildroot/commit/?id=a00ed30780819c72174ae959bdd6f15ed961e938
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYING (space removed:
https://github.com/hreinecke/sg3_utils/commit/c1fad13023cde771406ebe3eb8a0df0f3a409bf4)

https://github.com/hreinecke/sg3_utils/blob/v1.46/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sg3_utils/sg3_utils.hash | 4 ++--
 package/sg3_utils/sg3_utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sg3_utils/sg3_utils.hash b/package/sg3_utils/sg3_utils.hash
index d6c7f03abb..39510b4dc2 100644
--- a/package/sg3_utils/sg3_utils.hash
+++ b/package/sg3_utils/sg3_utils.hash
@@ -1,6 +1,6 @@
 # Locally calculated from download (no sig, hash)
-sha256  c7dab547dc37381fa50e482d9da680fe64b88cfe0e3d79b61e478de14f58b2ee  sg3_utils-1.45.tar.xz
+sha256  59c268b10b93ce31a517af13e19c88f285c12b7dd065f50e36b16a7b6fa7b9a0  sg3_utils-1.46.tar.xz
 
 # Hash for license files
-sha256  d516b8b337a77e3d4c65dffe708ca7fb25b1cb4ec77ec362cf11ed659b9250bc  COPYING
+sha256  256ec2d7e4e79faabb105ed1ddf32aec11d830c3dadb955a4ab2616eb87439ba  COPYING
 sha256  8ddd1d82f2be2f5cbd5b5c3b5c2ee94a90d2ca7112958448da74dd78384fd96a  BSD_LICENSE
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 11b3691ffc..1983a12261 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SG3_UTILS_VERSION = 1.45
+SG3_UTILS_VERSION = 1.46
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-2-Clause (library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
