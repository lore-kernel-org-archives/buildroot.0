Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445FCC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 09:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC35260FB2;
	Wed,  8 Nov 2023 09:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC35260FB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p3AcjgV5srtw; Wed,  8 Nov 2023 09:29:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB1561045;
	Wed,  8 Nov 2023 09:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB1561045
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC31E1BF954
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 09:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 914DC4098F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 09:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 914DC4098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q9CwYaT8ktx6 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 09:29:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8133D40979
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 09:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8133D40979
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E34686CA6; Wed,  8 Nov 2023 09:29:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 10:23:55 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: dc3280178f1c14680194dd83e85958eb7357a48d
X-Git-Newrev: aa8bb58d819257dfe53b9c6fa879fd1852e71f85
X-Patchwork-Hint: ignore
Message-Id: <20231108092926.6E34686CA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/perl-lwp-protocol-https: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa8bb58d819257dfe53b9c6fa879fd1852e71f85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:lwp\:\:protocol\:\:https_project:lwp\:\:protocol\:\:https is a
valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/804408BE-097D-4FE3-B6DB-29324871C6B9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b32e4fa760f55f3b240d38b166b9dcb4103bbdfb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
index 0663820b2e..6cbe4b33da 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
@@ -9,6 +9,8 @@ PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VE
 PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic or GPL-1.0+
 PERL_LWP_PROTOCOL_HTTPS_LICENSE_FILES = LICENSE
+PERL_LWP_PROTOCOL_HTTPS_CPE_ID_VENDOR = lwp\:\:protocol\:\:https_project
+PERL_LWP_PROTOCOL_HTTPS_CPE_ID_PRODUCT = lwp\:\:protocol\:\:https
 PERL_LWP_PROTOCOL_HTTPS_DISTNAME = LWP-Protocol-https
 
 $(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
