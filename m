Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F29CD37B7
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 22:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A8C480FEF;
	Tue,  3 Sep 2024 22:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plkvd7OYmgnj; Tue,  3 Sep 2024 22:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22539810DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22539810DE;
	Tue,  3 Sep 2024 22:43:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 281871BF576
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25CC840A87
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeFus2azByBN for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 22:43:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18E7040396
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18E7040396
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 22:43:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04E0386D80; Tue,  3 Sep 2024 22:43:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Sep 2024 00:27:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8298cfbe2eff4d4db4fbb3a4284da91058b97b0c
X-Git-Newrev: 0954bcf470714ffb7ac501a15bada11b498d7aa9
X-Patchwork-Hint: ignore
Message-Id: <20240903224341.04E0386D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/erlang-fast-xml: bump
 version to 1.1.52
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

commit: https://git.buildroot.net/buildroot/commit/?id=0954bcf470714ffb7ac501a15bada11b498d7aa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/erlang-fast-xml/erlang-fast-xml.hash | 2 +-
 package/erlang-fast-xml/erlang-fast-xml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-fast-xml/erlang-fast-xml.hash b/package/erlang-fast-xml/erlang-fast-xml.hash
index 6592e282d6..df5557080c 100644
--- a/package/erlang-fast-xml/erlang-fast-xml.hash
+++ b/package/erlang-fast-xml/erlang-fast-xml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  02bcdb0a4350080a10b52de85c11de982e5f7cf2150f5b1b888f7a95ccb31265  erlang-fast-xml-1.1.49.tar.gz
+sha256  2f705191a029ca7df7e62a6cd8622701da59a9e221f8514d2c2b1a5c1d23c739  erlang-fast-xml-1.1.52.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-fast-xml/erlang-fast-xml.mk b/package/erlang-fast-xml/erlang-fast-xml.mk
index c2b6205914..a04e3f5e09 100644
--- a/package/erlang-fast-xml/erlang-fast-xml.mk
+++ b/package/erlang-fast-xml/erlang-fast-xml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_FAST_XML_VERSION = 1.1.49
+ERLANG_FAST_XML_VERSION = 1.1.52
 ERLANG_FAST_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_FAST_XML_VERSION))
 ERLANG_FAST_XML_LICENSE = Apache-2.0
 ERLANG_FAST_XML_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
