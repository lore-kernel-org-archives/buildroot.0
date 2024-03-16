Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45A7C54E68
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FB2340645;
	Sat, 16 Mar 2024 22:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7gI_315bZib2; Sat, 16 Mar 2024 22:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96CD041061
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96CD041061;
	Sat, 16 Mar 2024 22:25:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DD831BF3D5
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52F8240645
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uCU2cZxn3yTP for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F8AE40600
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F8AE40600
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:25:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 291D2822CF; Sat, 16 Mar 2024 22:25:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 23:24:14 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 044f444b58975a0604193fcea2a53c1d143d6dc9
X-Git-Newrev: 13ffa6537692737dd86256e96eca3a86a5dc8216
X-Patchwork-Hint: ignore
Message-Id: <20240316222506.291D2822CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/c-ares: bump to
 version 1.20.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=13ffa6537692737dd86256e96eca3a86a5dc8216
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Update hash of license file (modern MIT license text used since
https://github.com/c-ares/c-ares/commit/6d077838f7e3f1899ba93da9d301b7fe49b311ce)

https://c-ares.org/changelog.html#1_20_1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit c26939ea3f477fd34c09d872e4b1b3de358904a6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-ares/c-ares.hash | 4 ++--
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 3e1573f2cf..c2897f6e44 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  321700399b72ed0e037d0074c629e7741f6b2ec2dda92956abe3e9671d3e268e  c-ares-1.19.1.tar.gz
+sha256  de24a314844cb157909730828560628704f4f896d167dd7da0fa2fb93ea18b10  c-ares-1.20.1.tar.gz
 
 # Hash for license file
-sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
+sha256  80fff25340df53b0cf0c3cddbca9050b559b9cbed2ad71830327cfef54959aef  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index d9bf583b9b..586fde9afb 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.19.1
+C_ARES_VERSION = 1.20.1
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
