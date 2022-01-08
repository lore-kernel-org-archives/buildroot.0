Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3211C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53ACA40241;
	Sat,  8 Jan 2022 22:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wa0ZBJIBulWy; Sat,  8 Jan 2022 22:53:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4845F40185;
	Sat,  8 Jan 2022 22:53:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A56781BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92DEA60AA9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-6Db1VoRR7s for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:53:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9F2760A9B
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:53:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AA20580462; Sat,  8 Jan 2022 22:47:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:53:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65b351fc9b7d70c96a0efc96182685899c5b9111
X-Git-Newrev: 65ed981ce0135379b7faeb69519f4e3e666c0717
X-Patchwork-Hint: ignore
Message-Id: <20220108224729.AA20580462@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort: bump to version 2.9.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=65ed981ce0135379b7faeb69519f4e3e666c0717
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://snort.org/downloads/snort/release_notes_2.9.19.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snort/snort.hash | 4 ++--
 package/snort/snort.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index 6df7ae5229..ac098564aa 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,8 +1,8 @@
 # From https://www.snort.org/downloads/snort/md5s
-md5  2b4e30300ef6feca1f60c267e727c6c0  snort-2.9.18.1.tar.gz
+md5  b0350425e0c1e9c044c25aa13b47edf8  snort-2.9.19.tar.gz
 
 # Locally computed:
-sha256  da8af0f1b2e4f247d970c6a3c0e83fb6dcd5c84faa21aea49f306f269e8e28aa  snort-2.9.18.1.tar.gz
+sha256  b12fc6db72afb58987a2bf1954b8f45bde02047c235513c7663857b9506369c7  snort-2.9.19.tar.gz
 
 # Hash for license files:
 sha256  f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 54017d3460..41f450541f 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.18.1
+SNORT_VERSION = 2.9.19
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
