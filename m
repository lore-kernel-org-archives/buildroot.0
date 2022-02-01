Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620CBC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1159A83312;
	Tue,  1 Feb 2022 22:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJvtFzrhiExY; Tue,  1 Feb 2022 22:15:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C82682EF1;
	Tue,  1 Feb 2022 22:15:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8B51BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 595DE82EF1
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JDXOn_u3TogR for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:15:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54005827CE
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:15:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 64CCE82858; Tue,  1 Feb 2022 22:07:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 23:14:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 800e53cf7e3ec71c3830e8a125b0a5546786d44f
X-Git-Newrev: ab71ac15ddd7ed6a8ca83cbc23ea0b0cbb343f0f
X-Patchwork-Hint: ignore
Message-Id: <20220201220756.64CCE82858@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: security bump to 2.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab71ac15ddd7ed6a8ca83cbc23ea0b0cbb343f0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix CVE-2022-23852, CVE-2022-23990

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 6 +++---
 package/expat/expat.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 0853c3c76d..3129801668 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.3/
-md5  b1137f030590b3f0c41c69c6cd68fa90  expat-2.4.3.tar.xz
-sha1  cfaacc4f929b34cfbde2b8f33b74ec84c0cbb329  expat-2.4.3.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.4/
+md5  a712d23b7afb32e7527cf0b3fd8f12ac  expat-2.4.4.tar.xz
+sha1  6028b04d3505fc519c4c7c6bd67e1ad1a08cd7b6  expat-2.4.4.tar.xz
 
 # Locally calculated
 sha256  b1f9f1b1a5ebb0acaa88c9ff79bfa4e145823b78aa5185e5c5d85f060824778a  expat-2.4.3.tar.xz
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index a7ace66095..250600c25e 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.3
+EXPAT_VERSION = 2.4.4
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
