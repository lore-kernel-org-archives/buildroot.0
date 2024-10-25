Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0077BD149E7
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 19:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B63A780B6C;
	Fri, 25 Oct 2024 19:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZH8cfOTeVxv; Fri, 25 Oct 2024 19:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDD5180B41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDD5180B41;
	Fri, 25 Oct 2024 19:11:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42FC9281F
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 19:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2373140EC5
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 19:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyI4EHX9DtpP for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 19:11:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BCAD40E4A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BCAD40E4A
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 19:11:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82FE8837DF; Fri, 25 Oct 2024 19:11:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 21:04:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbd6174ffcc3f873db7ee6e2185cbc39aa11ebf0
X-Git-Newrev: e4ba07505d7bdc5b1a6509a025f84001f3501fe4
X-Patchwork-Hint: ignore
Message-Id: <20241025191103.82FE8837DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proj: bump to 9.5.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e4ba07505d7bdc5b1a6509a025f84001f3501fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 9.4.1, see:
https://proj.org/en/9.5/news.html#release-notes

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
[Julien: add change log link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/proj/proj.hash | 6 +++---
 package/proj/proj.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 828380293e..8a1650ade5 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from https://download.osgeo.org/proj/proj-9.4.1.tar.gz.md5
-md5  e53d826635908369895060c9226f09f6  proj-9.4.1.tar.gz
+# Fetched from https://download.osgeo.org/proj/proj-9.5.0.tar.gz.md5
+md5  ac46b4e31562890d012ea6b31e579cf6  proj-9.5.0.tar.gz
 # Locally calculated
-sha256  ffe20170ee2b952207adf8a195e2141eab12cda181e49fdeb54425d98c7171d7  proj-9.4.1.tar.gz
+sha256  659af0d558f7c5618c322fde2d3392910806faee8684687959339021fa207d99  proj-9.5.0.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index d591d4eb6c..a17a0a1feb 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 9.4.1
+PROJ_VERSION = 9.5.0
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
