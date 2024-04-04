Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5432CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 14:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B05F982284;
	Thu,  4 Apr 2024 14:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YML6kWaRmLSN; Thu,  4 Apr 2024 14:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5E0882CCA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5E0882CCA;
	Thu,  4 Apr 2024 14:25:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF6891BF365
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 14:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB91A4168F
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 14:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zd6ZKy8wG_cz for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 14:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D61F8415AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D61F8415AA
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 14:25:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C010884562; Thu,  4 Apr 2024 14:25:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Apr 2024 16:23:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aef5490fab26427cc3795fb76b396e5ea667f3b2
X-Git-Newrev: 1a015540278ba742b5a77e90e80e2f858af14f04
X-Patchwork-Hint: ignore
Message-Id: <20240404142520.C010884562@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Thomas De Schampheleire
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a015540278ba742b5a77e90e80e2f858af14f04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No longer active in Buildroot. Keeping my name in the list sets the wrong
expectation regarding package updates or support.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 41 -----------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8d7f8bcba5..d78661cd60 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2968,47 +2968,6 @@ F:	package/openlayers/
 F:	package/vuejs/
 F:	package/vuejs-router/
 
-N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-F:	docs/manual/
-F:	package/cereal/
-F:	package/chartjs/
-F:	package/datatables/
-F:	package/datatables-buttons/
-F:	package/datatables-fixedcolumns/
-F:	package/datatables-responsive/
-F:	package/jszip/
-F:	package/libtelnet/
-F:	package/opkg-utils/
-F:	package/perl-convert-asn1/
-F:	package/perl-crypt-blowfish/
-F:	package/perl-crypt-cbc/
-F:	package/perl-crypt-openssl-aes/
-F:	package/perl-devel-cycle/
-F:	package/perl-devel-size/
-F:	package/perl-i18n/
-F:	package/perl-locale-maketext-lexicon/
-F:	package/perl-lwp-protocol-https/
-F:	package/perl-math-int64/
-F:	package/perl-math-prime-util/
-F:	package/perl-mime-base64-urlsafe/
-F:	package/perl-mojolicious-plugin-authentication/
-F:	package/perl-mojolicious-plugin-authorization/
-F:	package/perl-mojolicious-plugin-cspheader/
-F:	package/perl-mojolicious-plugin-i18n/
-F:	package/perl-mojolicious-plugin-securityheader/
-F:	package/perl-mozilla-ca/
-F:	package/perl-net-snmp/
-F:	package/perl-net-ssh2/
-F:	package/perl-net-telnet/
-F:	package/perl-path-class/
-F:	package/pigz/
-F:	package/popperjs/
-F:	package/xenomai/
-F:	support/scripts/size-stats
-F:	support/testing/tests/package/test_perl_lwp_protocol_https.py
-F:	utils/size-stats-compare
-F:	toolchain/
-
 N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
 F:	package/libsoup3/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
