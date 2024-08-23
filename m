Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE5BC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 15:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A788840FA;
	Fri, 23 Aug 2024 15:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2DYmS4I7exm; Fri, 23 Aug 2024 15:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CD6E84100
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CD6E84100;
	Fri, 23 Aug 2024 15:52:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1193E1BF313
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BE3640399
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQwSe5JOaI3T for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 15:52:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0885340277
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0885340277
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 15:52:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E690986357; Fri, 23 Aug 2024 15:52:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 17:49:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c7109e265cb6c179dd51a02637bb5f97f4767d21
X-Git-Newrev: 1d229b41b29b974b3e840f55b592fbc72d53ca92
X-Patchwork-Hint: ignore
Message-Id: <20240823155208.E690986357@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pv: bump to 1.8.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d229b41b29b974b3e840f55b592fbc72d53ca92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

News: https://www.ivarch.com/programs/pv.shtml

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pv/pv.hash | 2 +-
 package/pv/pv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index ed4cc21d89..cac506a83f 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  d22948d06be06a5be37336318de540a2215be10ab0163f8cd23a20149647b780  pv-1.8.5.tar.gz
+sha256  e2bde058d0d3bfe03e60a6eedef6a179991f5cc698d1bac01b64a86f5a8c17af  pv-1.8.13.tar.gz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  docs/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index f7243da8be..1434f8a88b 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.8.5
+PV_VERSION = 1.8.13
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = GPL-3.0+
 PV_LICENSE_FILES = docs/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
