Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FDDC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 08:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8728541552;
	Thu,  2 May 2024 08:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwrOLiuZje16; Thu,  2 May 2024 08:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF46641589
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF46641589;
	Thu,  2 May 2024 08:37:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D58C11BF990
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9966E60E46
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSulMdrX-jWR for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 08:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1DA660E48
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1DA660E48
 for <buildroot@buildroot.org>; Thu,  2 May 2024 08:36:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE55286608; Thu,  2 May 2024 08:36:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 10:28:22 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 330386fef9179b169d3619818a6c692098f3f0e4
X-Git-Newrev: aefc8730aaed3639692de8e0f93715d846a1100e
X-Patchwork-Hint: ignore
Message-Id: <20240502083654.BE55286608@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: remove Thomas
 De Schampheleire
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

commit: https://git.buildroot.net/buildroot/commit/?id=aefc8730aaed3639692de8e0f93715d846a1100e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

No longer active in Buildroot. Keeping my name in the list sets the wrong
expectation regarding package updates or support.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1a015540278ba742b5a77e90e80e2f858af14f04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 41 -----------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8ccf6ff46c..a2a2c56a13 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2949,47 +2949,6 @@ F:	package/openlayers/
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
