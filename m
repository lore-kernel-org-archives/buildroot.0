Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8054C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92DA7400CB;
	Tue,  2 Jan 2024 22:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92DA7400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kJlCJbXl8gVz; Tue,  2 Jan 2024 22:20:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C8EB404C2;
	Tue,  2 Jan 2024 22:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C8EB404C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09A891BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEE85416E4
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEE85416E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tqcf5Oa8UN6c for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18340416CC
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18340416CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04F4383D85; Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 23:17:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8649be9fa6dff661069af6479fc11a7f2208810d
X-Git-Newrev: 3a10a8bf45a5f83d624aed5cc772e21a267a50ae
X-Patchwork-Hint: ignore
Message-Id: <20240102222000.04F4383D85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipmiutil: bump to version 3.1.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a10a8bf45a5f83d624aed5cc772e21a267a50ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update site to avoid redirections

https://ipmiutil.sourceforge.net/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipmiutil/ipmiutil.hash | 6 +++---
 package/ipmiutil/ipmiutil.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.hash b/package/ipmiutil/ipmiutil.hash
index c1a813ad1f..ecefdac547 100644
--- a/package/ipmiutil/ipmiutil.hash
+++ b/package/ipmiutil/ipmiutil.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ipmiutil/files/
-md5  b38ef567b6bb8a24418e448f23115190  ipmiutil-3.1.8.tar.gz
-sha1  0697fc2342c55ba4374e31dcd38e58a00d1287e8  ipmiutil-3.1.8.tar.gz
+md5  332f688084510771ed79946c815a2ba7  ipmiutil-3.1.9.tar.gz
+sha1  3959d22d6c83b2452d087b1c325f47e6bc2b08ac  ipmiutil-3.1.9.tar.gz
 # Locally computed
-sha256  b14357b9723e38a19c24df2771cff63d5f15f8682cd8a5b47235044b767b1888  ipmiutil-3.1.8.tar.gz
+sha256  5ae99bdd1296a8e25cea839784ec39ebca57b0e3701b2d440b8e02e22dc4bc95  ipmiutil-3.1.9.tar.gz
 sha256  7e0ec8238aa1431e95a4950032a4483fe33fec3fac348eaade5856cdc5ae3e39  COPYING
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index b48eaa7cb2..b5a83b8042 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IPMIUTIL_VERSION = 3.1.8
-IPMIUTIL_SITE = https://sourceforge.net/projects/ipmiutil/files
+IPMIUTIL_VERSION = 3.1.9
+IPMIUTIL_SITE = https://downloads.sourceforge.net/project/ipmiutil
 IPMIUTIL_LICENSE = BSD-3-Clause
 IPMIUTIL_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
