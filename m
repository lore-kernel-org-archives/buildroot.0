Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B80BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 15:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C49A40958;
	Sun, 26 Dec 2021 15:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UhRZbJuKeWtA; Sun, 26 Dec 2021 15:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 252F340582;
	Sun, 26 Dec 2021 15:05:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 815F41BF2EA
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70ADE60B8C
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fl7TeHXcZmse for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 15:05:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF1A760D79
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 15:05:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B5CF182AF2; Sun, 26 Dec 2021 14:59:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 16:04:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21046c64793fd2946bed8dedd66d18f2f72155e9
X-Git-Newrev: ce26a2418b7c091a0dcd68f249a797c1f81c2fd5
X-Patchwork-Hint: ignore
Message-Id: <20211226145921.B5CF182AF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minissdpd: bump to version
 1.5.20211105
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce26a2418b7c091a0dcd68f249a797c1f81c2fd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update license hash (year updated)
- DESTDIR must now be used instead of PREFIX

http://miniupnp.free.fr/files/changelog.php?file=minissdpd-1.5.20211105.tar.gz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minissdpd/minissdpd.hash | 4 ++--
 package/minissdpd/minissdpd.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/minissdpd/minissdpd.hash b/package/minissdpd/minissdpd.hash
index 385a5a0c2a..e14fe7ab2c 100644
--- a/package/minissdpd/minissdpd.hash
+++ b/package/minissdpd/minissdpd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  177ab1907cc0fd20c8cafd13ca8674c7ec1828aa6101da9bb066408ccada7350  minissdpd-1.5.20200928.tar.gz
-sha256  00c8368dd1574b025df65f24f61c32d1297ff9b6dc695fda964b1b1efc7a53d3  LICENSE
+sha256  a073be9c6d9194feaeccf31cd986c48afd2212426b6594e75166cedff1c461aa  minissdpd-1.5.20211105.tar.gz
+sha256  45950e1d443106906f83a4ec7b9c2e1a9d6457130737a493cff0e5b7a39da570  LICENSE
diff --git a/package/minissdpd/minissdpd.mk b/package/minissdpd/minissdpd.mk
index 159c5855c1..2b9fac4df1 100644
--- a/package/minissdpd/minissdpd.mk
+++ b/package/minissdpd/minissdpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINISSDPD_VERSION = 1.5.20200928
+MINISSDPD_VERSION = 1.5.20211105
 MINISSDPD_SITE = http://miniupnp.free.fr/files
 MINISSDPD_LICENSE = BSD-3-Clause
 MINISSDPD_LICENSE_FILES = LICENSE
@@ -20,7 +20,7 @@ endef
 
 define MINISSDPD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		PREFIX=$(TARGET_DIR) install
+		DESTDIR=$(TARGET_DIR) install
 endef
 
 # Use dedicated init scripts for systemV and systemd instead of using
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
