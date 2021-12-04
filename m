Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6A6C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDB466077A;
	Sat,  4 Dec 2021 22:48:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHJIr6XeMLyU; Sat,  4 Dec 2021 22:48:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1139060A91;
	Sat,  4 Dec 2021 22:48:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 864441BF95C
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8301340269
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AShDmwc8QJem for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:48:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C045640253
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:48:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7CD31935E7; Sat,  4 Dec 2021 22:43:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:47:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c84cd8b1d1fec2b56d44c747bddc70a240433694
X-Git-Newrev: f1bfc0d0543593f27dda4666c9ec57cb54ffb4e8
X-Patchwork-Hint: ignore
Message-Id: <20211204224341.7CD31935E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libunwind: add
 LIBUNWIND_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1bfc0d0543593f27dda4666c9ec57cb54ffb4e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libunwind_project:libunwind is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibunwind_project%3Alibunwind

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libunwind/libunwind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 5f6b87b9db..aaa33464a9 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -9,6 +9,7 @@ LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind
 LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
 LIBUNWIND_LICENSE = MIT
+LIBUNWIND_CPE_ID_VENDOR = libunwind_project
 LIBUNWIND_AUTORECONF = YES
 
 LIBUNWIND_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
