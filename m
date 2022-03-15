Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35447C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFA158427D;
	Tue, 15 Mar 2022 20:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztJLKZxap33l; Tue, 15 Mar 2022 20:19:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D33842D6;
	Tue, 15 Mar 2022 20:19:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 179081BF9B6
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 072F2813CC
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9_pWjU_WccH for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:18:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A172B813D8
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:18:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C9A5483F85; Tue, 15 Mar 2022 20:10:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 20:54:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9391c7dd21dee3eff04e665bf6a92ef6fc5f234
X-Git-Newrev: 8a5476ef0d4eb417df6787b68125862aa30a6b4e
X-Patchwork-Hint: ignore
Message-Id: <20220315201012.C9A5483F85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valijson: bump to version 0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a5476ef0d4eb417df6787b68125862aa30a6b4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/tristanpenman/valijson/releases/tag/v0.6
https://github.com/tristanpenman/valijson/releases/tag/v0.5
https://github.com/tristanpenman/valijson/releases/tag/v0.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/valijson/valijson.hash | 2 +-
 package/valijson/valijson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
index e184ccb7c0..0aab93dd2a 100644
--- a/package/valijson/valijson.hash
+++ b/package/valijson/valijson.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  2ac881a36f90810b41b66511502dea1e7886137ad31bcfb4e917d929c5028c35  valijson-0.3.tar.gz
+sha256  e06bf78fc1d26d4956fabc182408ebbbc47e3a6699778cda4aa439c2a6110b09  valijson-0.6.tar.gz
 sha256  1a0f99926a2dbec30eba3db820236d9953fbe3048976923ac24980e655fbe991  LICENSE
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index 71c5b05f2b..4b1f722f77 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALIJSON_VERSION = 0.3
+VALIJSON_VERSION = 0.6
 VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
