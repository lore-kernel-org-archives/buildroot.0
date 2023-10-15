Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D393CCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B8CF414C2;
	Sun, 15 Oct 2023 18:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B8CF414C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id At5Gq4Jc49a9; Sun, 15 Oct 2023 18:19:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7890F4149A;
	Sun, 15 Oct 2023 18:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7890F4149A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BE561BF573
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7616541620
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7616541620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9oxyBvzi_-r for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:18:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63F8341621
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63F8341621
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51911852CA; Sun, 15 Oct 2023 18:18:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 20:18:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d49f53f8aaf0bff9c8d04c16485c844fef2832d0
X-Git-Newrev: 708eb34bf4ad8c658c3e46d7d0afe410096a1b23
X-Patchwork-Hint: ignore
Message-Id: <20231015181834.51911852CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpfm4: bump to version 4.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=708eb34bf4ad8c658c3e46d7d0afe410096a1b23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://perfmon2.sourceforge.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpfm4/libpfm4.hash | 6 +++---
 package/libpfm4/libpfm4.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpfm4/libpfm4.hash b/package/libpfm4/libpfm4.hash
index 42740adb1e..80dc66c62e 100644
--- a/package/libpfm4/libpfm4.hash
+++ b/package/libpfm4/libpfm4.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/perfmon2/files/libpfm4/:
-sha1  4c61cfb489426d9fff15428cb8536ba0e391c8ac  libpfm-4.12.0.tar.gz
-md5  9e4f9b89d23171eb9314a948a51b4284  libpfm-4.12.0.tar.gz
+sha1  bcb52090f02bc7bcb5ac066494cd55bbd5084e65  libpfm-4.13.0.tar.gz
+md5  673aaf0613f8fd1d886b4c5867c2fef1  libpfm-4.13.0.tar.gz
 # Locally calculated
-sha256  4b0c1f53f39a61525b69bebf532c68040c1b984d7544a8ae0844b13cd91e1ee4  libpfm-4.12.0.tar.gz
+sha256  d18b97764c755528c1051d376e33545d0eb60c6ebf85680436813fa5b04cc3d1  libpfm-4.13.0.tar.gz
 sha256  beef323d68fc5db9c67b20e8e9de7ccde371d20cdbcdd686804055b18b926d90  COPYING
diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 7165d78cd9..1a18a31ce8 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPFM4_VERSION = 4.12.0
+LIBPFM4_VERSION = 4.13.0
 LIBPFM4_SOURCE = libpfm-$(LIBPFM4_VERSION).tar.gz
 LIBPFM4_SITE = http://downloads.sourceforge.net/project/perfmon2/libpfm4
 LIBPFM4_LICENSE = libpfm4 license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
