Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F69EC25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 13:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 264BC81D02;
	Mon, 27 May 2024 13:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLpYgH5HPJZN; Mon, 27 May 2024 13:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07AD881D5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07AD881D5F;
	Mon, 27 May 2024 13:16:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A77E51D1CF7
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 920E881CDB
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1APFMZHjm7AC for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 13:16:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF83181CAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF83181CAD
 for <buildroot@buildroot.org>; Mon, 27 May 2024 13:16:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB514876A1; Mon, 27 May 2024 13:16:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 15:15:45 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 40d64599f4c22a5beb2e22892f74bd177191c1ae
X-Git-Newrev: 9a40ae8b989ae040fd7aa1295cafb847df0ea729
X-Patchwork-Hint: ignore
Message-Id: <20240527131637.BB514876A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libjwt: add CPE
 variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a40ae8b989ae040fd7aa1295cafb847df0ea729
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

cpe:2.3:a:bencollins:jwt_c_library is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/6335E595-6F38-4837-83BB-C78B687BB75B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1a2564e6880b70256c850a3fb54e9ec77d109d58)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjwt/libjwt.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index 1643aa7b7a..8929904d10 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -11,6 +11,8 @@ LIBJWT_AUTORECONF = YES
 LIBJWT_INSTALL_STAGING = YES
 LIBJWT_LICENSE = MPL-2.0
 LIBJWT_LICENSE_FILES = LICENSE
+LIBJWT_CPE_ID_VENDOR = bencollins
+LIBJWT_CPE_ID_PRODUCT = jwt_c_library
 LIBJWT_CONF_OPTS = --without-examples
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
