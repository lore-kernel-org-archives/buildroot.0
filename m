Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E37C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 18:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B21426FB01;
	Fri, 12 Jan 2024 18:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B21426FB01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNySs1y81Yha; Fri, 12 Jan 2024 18:03:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 089E06FAB1;
	Fri, 12 Jan 2024 18:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 089E06FAB1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9675F1BF309
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EC8A404A3
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EC8A404A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYLv4o6v_YSC for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 18:03:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60ADD40443
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 18:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60ADD40443
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B8B785FB1; Fri, 12 Jan 2024 18:03:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 18:56:21 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 29b6749994f4a576cd37748b05b3e3bc71d2d223
X-Git-Newrev: 5536261b3f7b7a7fb935d6b203c5882db4b875c4
X-Patchwork-Hint: ignore
Message-Id: <20240112180317.3B8B785FB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/postgis: bump to
 version 3.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5536261b3f7b7a7fb935d6b203c5882db4b875c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

https://github.com/postgis/postgis/blob/3.4.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b08f686ec17238712022de11ee1df90c3710eac3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 812d2dc017..2d2676d0d6 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  aee9b60a6c884d354164b3096c4657f324454186607f859d1ce05d899798af9d  postgis-3.4.0.tar.gz
+sha256  fef6a141213d0ff27bf45b33b849cc396c22ddb1ffc6fed435469c9e891fc81d  postgis-3.4.1.tar.gz
 sha256  2a3bde0a77224496ea6d8efa686da7e29ab0dd6b1a8f90ba12beaf7ae28e878a  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index bb3955ec54..5f1c643ceb 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.4.0
+POSTGIS_VERSION = 3.4.1
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
