Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C06C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C2B64016B;
	Mon, 27 Jun 2022 22:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C2B64016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2R6jXKbdhxf8; Mon, 27 Jun 2022 22:26:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2402C400D7;
	Mon, 27 Jun 2022 22:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2402C400D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2A1A1BF9B5
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDA4E82951
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDA4E82951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0cw5RYZKlJiQ for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:26:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1033A82948
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1033A82948
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A5E9B876A8; Mon, 27 Jun 2022 22:13:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:24:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04b030c21fd146bbe221c50801709d9394a4cde4
X-Git-Newrev: f32afb8f30474897fe51f2baf9ffdfc25b72f8ce
X-Patchwork-Hint: ignore
Message-Id: <20220627221345.A5E9B876A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nss-mdns: bump to version 0.15.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f32afb8f30474897fe51f2baf9ffdfc25b72f8ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/lathiat/nss-mdns/blob/v0.15.1/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nss-mdns/nss-mdns.hash | 4 ++--
 package/nss-mdns/nss-mdns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nss-mdns/nss-mdns.hash b/package/nss-mdns/nss-mdns.hash
index 9bcec08496..3ab546f965 100644
--- a/package/nss-mdns/nss-mdns.hash
+++ b/package/nss-mdns/nss-mdns.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	a2094101b735cade45048764ea594bdae2bfa9399837f3c852a5b264416e9c8c	nss-mdns-0.14.1.tar.gz
-sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	LICENSE
+sha256  ddf71453d7a7cdc5921fe53ef387b24fd0c3c49f4dcf94a2a437498596761a21  nss-mdns-0.15.1.tar.gz
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 77ab6c1ede..fd10fd8881 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NSS_MDNS_VERSION = 0.14.1
+NSS_MDNS_VERSION = 0.15.1
 NSS_MDNS_SITE = \
 	https://github.com/lathiat/nss-mdns/releases/download/v$(NSS_MDNS_VERSION)
 NSS_MDNS_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
