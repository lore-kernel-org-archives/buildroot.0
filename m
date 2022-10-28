Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B0FC38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9A8941477;
	Fri, 28 Oct 2022 06:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A8941477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPkkemU19EpY; Fri, 28 Oct 2022 06:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A7074018C;
	Fri, 28 Oct 2022 06:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A7074018C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA9791BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90D0B40133
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90D0B40133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPiy5qcy2qBR for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:56:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BACE9400D0
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BACE9400D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA11D873E8; Fri, 28 Oct 2022 06:56:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 08:55:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5fe9ae335f8cfa5140ef5309ac931cbd3e4cf3fb
X-Git-Newrev: a30e31a05e21461e73175c814ba858edb23a363e
X-Patchwork-Hint: ignore
Message-Id: <20221028065611.AA11D873E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sratom: bump to version 0.6.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=a30e31a05e21461e73175c814ba858edb23a363e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of COPYING (standard ISC licence used since
  https://github.com/lv2/sratom/commit/145ed2fe9756f707d9fd5f03ada5327d04e1b972)
- meson must be used since
  https://github.com/lv2/sratom/commit/75e647def0f67647ec7ba1405e26d809a87c62fc

https://github.com/lv2/sratom/blob/v0.6.14/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sratom/sratom.hash |  6 +++---
 package/sratom/sratom.mk   | 12 ++++--------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/package/sratom/sratom.hash b/package/sratom/sratom.hash
index 64d460b2ea..3b8fa65300 100644
--- a/package/sratom/sratom.hash
+++ b/package/sratom/sratom.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# https://download.drobilla.net/sratom-0.6.8.tar.bz2.asc
-sha256  3acb32b1adc5a2b7facdade2e0818bcd6c71f23f84a1ebc17815bb7a0d2d02df  sratom-0.6.8.tar.bz2
-sha256  3fc429d6b944fa20306357196a28bb4dd7c25e2d67edebec771f44de5bd7f9e8  COPYING
+# https://download.drobilla.net/sratom-0.6.14.tar.xz.sig
+sha256  9982faf40db83aedd9b3850e499fecd6852b8b4ba6dede514013655cffaca1e6  sratom-0.6.14.tar.xz
+sha256  97742aacc982d8bb10d4450e3ce71dd02a9f26ba73a0eb822ef3356a74525597  COPYING
diff --git a/package/sratom/sratom.mk b/package/sratom/sratom.mk
index e1e0f4e033..25e7a091b3 100644
--- a/package/sratom/sratom.mk
+++ b/package/sratom/sratom.mk
@@ -4,18 +4,14 @@
 #
 ################################################################################
 
-SRATOM_VERSION = 0.6.8
+SRATOM_VERSION = 0.6.14
 SRATOM_SITE = https://download.drobilla.net
-SRATOM_SOURCE = sratom-$(SRATOM_VERSION).tar.bz2
+SRATOM_SOURCE = sratom-$(SRATOM_VERSION).tar.xz
 SRATOM_LICENSE = ISC
 SRATOM_LICENSE_FILES = COPYING
 SRATOM_DEPENDENCIES = host-pkgconf lv2 serd sord
 SRATOM_INSTALL_STAGING = YES
 
-SRATOM_CONF_OPTS += --no-coverage
+SRATOM_CONF_OPTS += -Ddocs=disabled -Dtests=disabled
 
-ifeq ($(BR2_STATIC_LIBS),y)
-SRATOM_CONF_OPTS += --static --no-shared
-endif
-
-$(eval $(waf-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
