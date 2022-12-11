Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708FEC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 170B94EEB6;
	Mon, 20 Feb 2023 22:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 170B94EEB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iIhZYazEr5Tl; Mon, 20 Feb 2023 22:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4CBD4EE97;
	Mon, 20 Feb 2023 22:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4CBD4EE97
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4F21BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E1EE416C2
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E1EE416C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FOpWFP17PTsL for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63F4D416AF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63F4D416AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5339586494; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 11:42:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 20f7ed86aa9f2a65af9b44a599f7d1b10075f158
X-Git-Newrev: 260924e239627cbe1379cfc752939245d53a06e0
X-Patchwork-Hint: ignore
Message-Id: <20230220205205.5339586494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/swig: bump to version
 4.1.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=260924e239627cbe1379cfc752939245d53a06e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swig/Config.in.host | 2 +-
 package/swig/swig.hash      | 2 +-
 package/swig/swig.mk        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/swig/Config.in.host b/package/swig/Config.in.host
index fd2049d30a..4c0deebc58 100644
--- a/package/swig/Config.in.host
+++ b/package/swig/Config.in.host
@@ -5,4 +5,4 @@ config BR2_PACKAGE_HOST_SWIG
 	  written in C and C++ with a variety of high-level
 	  programming languages.
 
-	  http://www.swig.org/
+	  https://www.swig.org/
diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index 64fe4f979e..21590c422a 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d53be9730d8d58a16bf0cbd1f8ac0c0c3e1090573168bfa151b01eb47fa906fc  swig-4.0.2.tar.gz
+sha256  2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b  swig-4.1.1.tar.gz
 sha256  f53abaeed775018d519a1b9615f0ca17894772bd9ca21c2a156bf340ac41c13e  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-GPL
 sha256  7f50d942373a871211c5efee03f3db2f9efd1cff1002b0ef8e3748baa611a5c2  LICENSE-UNIVERSITIES
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 437cf448be..d432cab53d 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SWIG_VERSION_MAJOR = 4.0
-SWIG_VERSION = $(SWIG_VERSION_MAJOR).2
+SWIG_VERSION_MAJOR = 4.1
+SWIG_VERSION = $(SWIG_VERSION_MAJOR).1
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 HOST_SWIG_DEPENDENCIES = host-bison host-pcre
 HOST_SWIG_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
