Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4542CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF283400E9;
	Sat,  4 Dec 2021 22:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07m5h1hYz6VZ; Sat,  4 Dec 2021 22:49:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF8F4401AF;
	Sat,  4 Dec 2021 22:49:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF7E61BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAF7640276
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ULmyirbZNhbT for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:48:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCEDF401AF
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:48:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 87C2B9361B; Sat,  4 Dec 2021 22:43:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:47:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1bfc0d0543593f27dda4666c9ec57cb54ffb4e8
X-Git-Newrev: d2089a4aadc7f1bc689ac452f52209205c71a5d8
X-Patchwork-Hint: ignore
Message-Id: <20211204224341.87C2B9361B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgee: add LIBGEE_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2089a4aadc7f1bc689ac452f52209205c71a5d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnome:libgee is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Alibgee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgee/libgee.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 0a05a63635..64beef30df 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -12,6 +12,7 @@ LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
 LIBGEE_INSTALL_STAGING = YES
 LIBGEE_LICENSE = LGPL-2.1+
 LIBGEE_LICENSE_FILES = COPYING
+LIBGEE_CPE_ID_VENDOR = gnome
 # We're patching gee/Makefile.am
 LIBGEE_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
