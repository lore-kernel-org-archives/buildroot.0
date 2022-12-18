Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07318C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 14:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 545EC81355;
	Sun, 18 Dec 2022 14:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 545EC81355
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5mKKy0xFBvh; Sun, 18 Dec 2022 14:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 976E781332;
	Sun, 18 Dec 2022 14:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 976E781332
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 018101BF3DC
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 14:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA72B4015F
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 14:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA72B4015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fip3FJnV6D7S for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 14:23:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94887400D3
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94887400D3
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 14:23:23 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout01.t-online.de (Postfix) with SMTP id 613DDD83F;
 Sun, 18 Dec 2022 15:23:20 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p6uZT-1hDxKL0; Sun, 18 Dec 2022 15:23:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:37994)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p6uZS-00051S-2z;
 Sun, 18 Dec 2022 15:23:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 15:23:18 +0100
Message-Id: <20221218142318.3223557-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671373399-2F7FF535-804D44ED/0/0 CLEAN NORMAL
X-TOI-MSGID: 3149af24-88fe-4cc7-abb3-031ae237fe59
Subject: [Buildroot] [PATCH 1/1] package/supertuxkart: bump version to 1.4
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/supertuxkart/stk-code/blob/1.4/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/supertuxkart/supertuxkart.hash | 2 +-
 package/supertuxkart/supertuxkart.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
index 6ae3fae82b..446a9de8ec 100644
--- a/package/supertuxkart/supertuxkart.hash
+++ b/package/supertuxkart/supertuxkart.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eeabeb0d9801688a218f6f0a76ea3546a46a322ccaca9a258148ecacfe083ffd  SuperTuxKart-1.3-src.tar.xz
+sha256  9890392419baf4715313f14d5ad60746f276eed36eb580636caf44e2532c0f03  SuperTuxKart-1.4-src.tar.xz
 sha256  d27207a5213f746aac53893e9ecc18456e9595d3ffa662bd1ec9eb10787c214a  COPYING
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 8ec366f792..1f9ad4102b 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUPERTUXKART_VERSION = 1.3
+SUPERTUXKART_VERSION = 1.4
 SUPERTUXKART_SOURCE = SuperTuxKart-$(SUPERTUXKART_VERSION)-src.tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
