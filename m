Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031C2ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB1F481761;
	Fri, 28 Oct 2022 06:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB1F481761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCPULNvi-vkQ; Fri, 28 Oct 2022 06:58:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF7048174F;
	Fri, 28 Oct 2022 06:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF7048174F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF9BD1BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8E0140133
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E0140133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zt9I0SO7MUZV for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:58:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F299B400D0
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F299B400D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFC16873F2; Fri, 28 Oct 2022 06:58:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 08:56:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 123fa2d801ab0b9a5dd025a083c6264271d79aaf
X-Git-Newrev: a5faa07794965a53c8122d252dd41ad4b6903eea
X-Patchwork-Hint: ignore
Message-Id: <20221028065808.DFC16873F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/empty: bump to version 0.6.22b
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5faa07794965a53c8122d252dd41ad4b6903eea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop EMPTY_STRIP_COMPONENTS (not needed anymore)
- Update hash of COPYRIGHT (update in year with
  https://sourceforge.net/p/empty/code/ci/c308663530aba4f808b76ee6b4a4b144be9f8a84)

10.08.2022 0.6.22b
--------------------------------------------------------------------------------
* Man pages directory parameterization
* Tarball clenup, repacking

https://sourceforge.net/p/empty/code/ci/master/tree/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/empty/empty.hash | 4 ++--
 package/empty/empty.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/empty/empty.hash b/package/empty/empty.hash
index c5fbc2b4ac..cc74254a7a 100644
--- a/package/empty/empty.hash
+++ b/package/empty/empty.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  2fccd0faa1b3deaec1add679cbde3f34250e45872ad5df463badd4bb4edeb797  empty-0.6.21b.tgz
-sha256  f01dbe3c624084900b9df1393d9062518b2bc0487acd6a3300ebd6e71352d112  COPYRIGHT
+sha256  f581d560e1fa857f5304586e3c2107b5838bcf11dedcccec4a7191fa9e261b69  empty-0.6.22b.tgz
+sha256  db6b65f5eaf782a92715887ac107f3477d64016301a66194a92312b13ff89be1  COPYRIGHT
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index a9b8080a8e..91d9476445 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-EMPTY_VERSION = 0.6.21b
+EMPTY_VERSION = 0.6.22b
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
 EMPTY_LICENSE = BSD-3-Clause
 EMPTY_LICENSE_FILES = COPYRIGHT
-EMPTY_STRIP_COMPONENTS = 0
 
 define EMPTY_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
