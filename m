Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9C7C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 10:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E86D581D67;
	Sat,  4 Dec 2021 10:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LV6EHu3qzuub; Sat,  4 Dec 2021 10:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B5C983E3C;
	Sat,  4 Dec 2021 10:24:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 719581BF5DA
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95C9B81069
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Ym7QNZewYOQ for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 10:23:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D94C1814AB
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 10:23:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C219F87EEA; Sat,  4 Dec 2021 10:19:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 11:14:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e259d0d8b2b1ddb379d2d5caf983c65fad22ed43
X-Git-Newrev: 6739071d31d9ba2114f578250ae73463b448f50a
X-Patchwork-Hint: ignore
Message-Id: <20211204101905.C219F87EEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: add
 FREESWITCH_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=6739071d31d9ba2114f578250ae73463b448f50a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:freeswitch:freeswitch is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreeswitch%3Afreeswitch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: move after license files]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freeswitch/freeswitch.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 63f6324af2..944867cc75 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -20,6 +20,8 @@ FREESWITCH_LICENSE_FILES = \
 	libs/apr-util/LICENSE \
 	libs/srtp/LICENSE
 
+FREESWITCH_CPE_ID_VENDOR = freeswitch
+
 # required dependencies
 FREESWITCH_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
