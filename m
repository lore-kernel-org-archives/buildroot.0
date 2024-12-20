Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33337E7718B
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 19:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E51B460616;
	Fri, 20 Dec 2024 19:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlFpsBhqwJCB; Fri, 20 Dec 2024 19:43:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EAE46062E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EAE46062E;
	Fri, 20 Dec 2024 19:43:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EF9A6C
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 19:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C99E80CBC
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 19:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l96_Kd6i4waS for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 19:43:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 653BC82036
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 653BC82036
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 19:43:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E7E7874AC; Fri, 20 Dec 2024 19:43:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Dec 2024 20:38:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8566538878aa1ad8098e69e1933b4b1a41f3938
X-Git-Newrev: 38ea793bd2a2cf5d60a6887ad15e03eff58d84f9
X-Patchwork-Hint: ignore
Message-Id: <20241220194337.4E7E7874AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proj: bump to 9.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=38ea793bd2a2cf5d60a6887ad15e03eff58d84f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://proj.org/en/stable/news.html

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/proj/proj.hash | 6 +++---
 package/proj/proj.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 8a1650ade5..5249f52c10 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from https://download.osgeo.org/proj/proj-9.5.0.tar.gz.md5
-md5  ac46b4e31562890d012ea6b31e579cf6  proj-9.5.0.tar.gz
+# Fetched from https://download.osgeo.org/proj/proj-9.5.1.tar.gz.md5
+md5  07c44ca4a65a0664ce823c8448707c78  proj-9.5.1.tar.gz
 # Locally calculated
-sha256  659af0d558f7c5618c322fde2d3392910806faee8684687959339021fa207d99  proj-9.5.0.tar.gz
+sha256  a8395f9696338ffd46b0feb603edbb730fad6746fba77753c77f7f997345e3d3  proj-9.5.1.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index a17a0a1feb..19b5f1012e 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 9.5.0
+PROJ_VERSION = 9.5.1
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
