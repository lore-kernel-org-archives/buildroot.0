Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5375C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70BED405A0;
	Sun, 14 Jul 2024 20:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id djPnCPQh1kXf; Sun, 14 Jul 2024 20:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9311405A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9311405A7;
	Sun, 14 Jul 2024 20:23:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEE291BF954
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4806D6064B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQjCXjyRdEiI for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 533E360638
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 533E360638
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DCC384BB7; Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 21:47:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31e6a80198fd22aacd57905ac8060a041de9ef04
X-Git-Newrev: 1282ebc83049949f1373bf78dd09e444aaa33d2f
X-Patchwork-Hint: ignore
Message-Id: <20240714202320.4DCC384BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] s6-dns: bump to version 2.3.7.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4601111127042722233=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4601111127042722233==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1282ebc83049949f1373bf78dd09e444aaa33d2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The COPYING hash changed because the copyright year was updated.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/s6-dns/s6-dns.hash | 4 ++--
 package/s6-dns/s6-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-dns/s6-dns.hash b/package/s6-dns/s6-dns.hash
index 334ea1667c..dd6e6f3632 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  cf0258574ec7d62b654e0c2ad78af4c7d67ac4c9cb37f781480f597e54b30f6d  s6-dns-2.3.7.1.tar.gz
-sha256  aafa4f6a12b5b24ab2ae8ead5174e1ec03aecb5eb0e82012d74fd47ccfc57607  COPYING
+sha256  6aee32bb68d01f5109f71e31a283213c668cd3c0e79fb9e469e6cabb58079f2b  s6-dns-2.3.7.2.tar.gz
+sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index a848f2e6c0..8e175431a4 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_DNS_VERSION = 2.3.7.1
+S6_DNS_VERSION = 2.3.7.2
 S6_DNS_SITE = https://skarnet.org/software/s6-dns
 S6_DNS_LICENSE = ISC
 S6_DNS_LICENSE_FILES = COPYING

--===============4601111127042722233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4601111127042722233==--
