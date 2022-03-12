Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ED1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B60382468;
	Sat, 12 Mar 2022 17:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FoU1CWcE3qWa; Sat, 12 Mar 2022 17:13:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8119F82457;
	Sat, 12 Mar 2022 17:13:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26A191BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EA0E40488
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GppCHeeUcuhE for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A0B0404B2
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 91AA382AFE; Sat, 12 Mar 2022 17:01:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 18:08:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9b4c11ed67055564c1b6bc8c44ec944bf458a87
X-Git-Newrev: 726e974f5eaff5c5abd7550e100a117a3fa0b6c8
X-Patchwork-Hint: ignore
Message-Id: <20220312170118.91AA382AFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-distro: bump to version
 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=726e974f5eaff5c5abd7550e100a117a3fa0b6c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 1.6.0, see:
- https://github.com/python-distro/distro/releases/tag/v1.7.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-distro/python-distro.hash | 2 +-
 package/python-distro/python-distro.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-distro/python-distro.hash b/package/python-distro/python-distro.hash
index e2b3c0a444..8f09197156 100644
--- a/package/python-distro/python-distro.hash
+++ b/package/python-distro/python-distro.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  83f5e5a09f9c5f68f60173de572930effbcc0287bb84fdc4426cb4168c088424  distro-1.6.0.tar.gz
+sha256  151aeccf60c216402932b52e40ee477a939f8d58898927378a02abbe852c1c39  distro-1.7.0.tar.gz
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-distro/python-distro.mk b/package/python-distro/python-distro.mk
index 753e74d020..c69849b7ac 100644
--- a/package/python-distro/python-distro.mk
+++ b/package/python-distro/python-distro.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DISTRO_VERSION = 1.6.0
-PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/a5/26/256fa167fe1bf8b97130b4609464be20331af8a3af190fb636a8a7efd7a2
+PYTHON_DISTRO_VERSION = 1.7.0
+PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/b5/7e/ddfbd640ac9a82e60718558a3de7d5988a7d4648385cf00318f60a8b073a
 PYTHON_DISTRO_SOURCE = distro-$(PYTHON_DISTRO_VERSION).tar.gz
 PYTHON_DISTRO_LICENSE = Apache-2.0
 PYTHON_DISTRO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
