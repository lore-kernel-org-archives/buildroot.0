Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B797C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 19:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A5F540D13;
	Thu,  8 Aug 2024 19:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8I_xQG7CqlH6; Thu,  8 Aug 2024 19:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC36A40D1B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC36A40D1B;
	Thu,  8 Aug 2024 19:54:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 516661BF2A3
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BD4E80BA2
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLqpp6xO-MmH for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 19:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F28680B6E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F28680B6E
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 19:54:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2A3C84924; Thu,  8 Aug 2024 19:54:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Aug 2024 21:47:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08edb3c22a61b6de28e1472faceaebc3399b6537
X-Git-Newrev: 453d468e3e133b98abe71cbee50249f2ad16e95e
X-Patchwork-Hint: ignore
Message-Id: <20240808195440.D2A3C84924@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: bump version to 2.2.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0622665315488497222=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0622665315488497222==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=453d468e3e133b98abe71cbee50249f2ad16e95e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zfs/zfs.hash | 2 +-
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 9c8d4cec85..9598aed992 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
 # From https://github.com/openzfs/zfs/releases/download/zfs-2.2.4/zfs-2.2.4.sha256.asc
-sha256  9790905f7683d41759418e1ef3432828c31116654ff040e91356ff1c21c31ec0  zfs-2.2.4.tar.gz
+sha256  2388cf6f29cd75e87d6d05e4858a09d419c4f883a658d51ef57796121cd08897  zfs-2.2.5.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index e51ade55a4..549f8641b9 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.2.4
+ZFS_VERSION = 2.2.5
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL

--===============0622665315488497222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0622665315488497222==--
