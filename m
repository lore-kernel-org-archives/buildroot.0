Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5B5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 19:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD030405C0;
	Fri, 28 Jan 2022 19:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O-1usqvdxikg; Fri, 28 Jan 2022 19:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C014B405BC;
	Fri, 28 Jan 2022 19:34:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 506311C1189
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 19:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A79C405C0
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 19:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJtHjRiqidG6 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 19:34:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5852E405BC
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 19:34:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AC4C982B2C; Fri, 28 Jan 2022 19:27:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 20:30:20 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 0eb0c1bba0876cfa19e83a0d7284aa7431157f05
X-Git-Newrev: 8f4a347754ed4f6f1730a38390448ec5f7fe2bfe
X-Patchwork-Hint: ignore
Message-Id: <20220128192734.AC4C982B2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/prosody: bump to
 version 0.11.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f4a347754ed4f6f1730a38390448ec5f7fe2bfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ab9d3bb9900be3106928734274ce67e0a5cbf7b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 4579545e39..ee459f85d8 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  6130b79fb64141909330caf83a79a131  prosody-0.11.10.tar.gz
-sha1  4dc8b2f783b43e7a5e781b1fc8aee48b0e106def  prosody-0.11.10.tar.gz
-sha256  c6d714e6d4a6ddd1db1266b205d9d8a3ed91818f42755c9268ffb18359d204e1  prosody-0.11.10.tar.gz
-sha512  419d8f8465f1807015f0a52d8f35ee89892b0869084dae38b60fc833d63c3d70892d8e59ae00039cd15e0e25f46d042954896f51f8c0520650a877f5296707cb  prosody-0.11.10.tar.gz
+md5  78d01bb97a935f6a776d141873a33fd7  prosody-0.11.11.tar.gz
+sha1  ff653812fcb1789a517b55281a8d01e9e8261848  prosody-0.11.11.tar.gz
+sha256  a1af90e2d4ac2f7cf81b385475140ecee60bec1eb83003efb5aeb89765b13774  prosody-0.11.11.tar.gz
+sha512  eb9851e1b279bef894d556ca6bc6210d1cd55e0c02a9d475f74e6e6b4a2dfef704fd3de77b71cff97909925c48c60940c34cfb541e6f3801e23e90ea21d119a9  prosody-0.11.11.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 0eeb32cd3f..7acfa4708d 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.10
+PROSODY_VERSION = 0.11.11
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
