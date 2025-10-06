Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FA0CAC5B8
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 20:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 667E9842DB;
	Mon,  6 Oct 2025 20:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPkyIFpFqOgu; Mon,  6 Oct 2025 20:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9982B842EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9982B842EE;
	Mon,  6 Oct 2025 20:38:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 215C2909
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 083F24188E
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c97Hy5d-_eg8 for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 20:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B71541884
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B71541884
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:38:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39C95869A8; Mon,  6 Oct 2025 20:38:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Oct 2025 22:23:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81772044a075ddfd892a4ce49f108998c3f7ffef
X-Git-Newrev: 4a20dace711417fd377d1c0f40fad85b8265c988
X-Patchwork-Hint: ignore
Message-Id: <20251006203822.39C95869A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libidn: bump version to 1.43
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4a20dace711417fd377d1c0f40fad85b8265c988
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file COPYINGv3 was renamed to COPYING:
https://cgit.git.savannah.gnu.org/cgit/libidn.git/commit/?h=v1.43&id=799b11bdbcca9109c812c700e082cebc9295be5c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libidn/libidn.hash | 4 ++--
 package/libidn/libidn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index 65201fdfb5..9727aaf243 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,7 +1,7 @@
 # Locally computed:
-sha256  d6c199dcd806e4fe279360cb4b08349a0d39560ed548ffd1ccadda8cdecb4723  libidn-1.42.tar.gz
+sha256  bdc662c12d041b2539d0e638f3a6e741130cdb33a644ef3496963a443482d164  libidn-1.43.tar.gz
 
 # Hash for license files:
+sha256  e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
-sha256  e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYINGv3
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSERv3
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index c7b8b4941c..6fdd84fa9f 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.42
+LIBIDN_VERSION = 1.43
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
 LIBIDN_CONF_OPTS = --disable-java --enable-csharp=no
 LIBIDN_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBIDN_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-3.0+
-LIBIDN_LICENSE_FILES = COPYINGv2 COPYINGv3 COPYING.LESSERv3
+LIBIDN_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3
 LIBIDN_CPE_ID_VENDOR = gnu
 
 define LIBIDN_REMOVE_BINARY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
