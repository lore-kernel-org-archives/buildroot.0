Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE91C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:30:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D196760F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D196760F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB73440535;
	Tue,  3 Aug 2021 21:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWtVt720B3OI; Tue,  3 Aug 2021 21:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C59384036B;
	Tue,  3 Aug 2021 21:30:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABF9E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37FD34028C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sozkxJtM5SbK for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 868EE4044B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CFEB088523; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 May 2021 21:59:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 214d4e9c2217f8680f269870e98a0ac9a64256e0
X-Git-Newrev: 1ee888c2481c6bdf3dc00644cee1970411de9a1a
X-Patchwork-Hint: ignore
Message-Id: <20210803210943.CFEB088523@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pigz: add
 PIGZ_CPE_ID_VENDOR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=1ee888c2481c6bdf3dc00644cee1970411de9a1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:zlib:pigz is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azlib%3Apigz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pigz/pigz.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index fdf5fa40e8..3e5e892797 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -10,6 +10,7 @@ PIGZ_DEPENDENCIES = zlib
 HOST_PIGZ_DEPENDENCIES = host-zlib
 PIGZ_LICENSE = Zlib
 PIGZ_LICENSE_FILES = README
+PIGZ_CPE_ID_VENDOR = zlib
 
 define PIGZ_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
