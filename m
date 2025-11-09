Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42623CCF9F8
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 21:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17586405AD;
	Sun,  9 Nov 2025 21:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qcq8h6UKmi3i; Sun,  9 Nov 2025 21:44:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32297406FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32297406FC;
	Sun,  9 Nov 2025 21:44:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4F3225D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC09C805E5
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0y7Zk9kP-IvZ for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 21:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8FB78056E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8FB78056E
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:44:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D97F884272; Sun,  9 Nov 2025 21:44:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Nov 2025 21:57:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81048015e8b4cb575712a868e32ee09e67f78ea5
X-Git-Newrev: 304a2231cbdffac7be5fd8a90a92801e43181fcd
X-Patchwork-Hint: ignore
Message-Id: <20251109214426.D97F884272@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crudini: bump to version 0.9.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=304a2231cbdffac7be5fd8a90a92801e43181fcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/pixelb/crudini/releases/tag/0.9.6

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/crudini/crudini.hash | 2 +-
 package/crudini/crudini.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/crudini/crudini.hash b/package/crudini/crudini.hash
index 5b92c0e4da..0df91ab1e1 100644
--- a/package/crudini/crudini.hash
+++ b/package/crudini/crudini.hash
@@ -1,4 +1,4 @@
 # from https://pypi.org/project/crudini/#files
-sha256  59ae650f45af82a64afc33eb876909ee0c4888dc4e8711ef59731c1edfda5e24  crudini-0.9.5.tar.gz
+sha256  c2af311a0833857a1449d821a312edc6109f0c2d6d81d76c2d954a76b05e6b14  crudini-0.9.6.tar.gz
 # locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index 0f5cfcedd9..2f59b025fb 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRUDINI_VERSION = 0.9.5
-CRUDINI_SITE = https://files.pythonhosted.org/packages/32/67/c4e838930e2f434db08d6a6aadffca3d14e7455d1c2c2332e22003ad453d
+CRUDINI_VERSION = 0.9.6
+CRUDINI_SITE = https://files.pythonhosted.org/packages/54/d1/0a363fbbab0aea9e27dd981a602efaf514c45f4fffceac3906274e0425c7
 CRUDINI_SETUP_TYPE = setuptools
 CRUDINI_DEPENDENCIES = host-python-setuptools-scm
 CRUDINI_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
