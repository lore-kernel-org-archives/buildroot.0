Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91536CF9C68
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 21:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47ED8403B8;
	Fri, 20 Sep 2024 21:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWuhhsWJhtWU; Fri, 20 Sep 2024 21:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3076F400B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3076F400B9;
	Fri, 20 Sep 2024 21:08:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27A841BF5A6
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 21:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 174A7814C1
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 21:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6w_-j-EmgnLP for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 21:08:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ABC8581518
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABC8581518
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABC8581518
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 21:08:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68B06240002;
 Fri, 20 Sep 2024 21:08:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1srkrm-00HAoJ-1N;
 Fri, 20 Sep 2024 23:08:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 23:08:20 +0200
Message-Id: <20240920210836.4093091-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240920210836.4093091-1-peter@korsgaard.com>
References: <20240920210836.4093091-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 02/17] support/kconfig: fix 'multiple' typo in
 patch description
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
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../18-merge-config.sh-create-temporary-files-in-tmp.patch      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/kconfig/patches/18-merge-config.sh-create-temporary-files-in-tmp.patch b/support/kconfig/patches/18-merge-config.sh-create-temporary-files-in-tmp.patch
index f2a261f308..053366e2fb 100644
--- a/support/kconfig/patches/18-merge-config.sh-create-temporary-files-in-tmp.patch
+++ b/support/kconfig/patches/18-merge-config.sh-create-temporary-files-in-tmp.patch
@@ -5,7 +5,7 @@ Date: Mon, 7 Dec 2015 12:08:45 -0200
     merge_config.sh: create temporary files in /tmp
 
     Creating temporary files in /tmp (or the path pointed by $TMPDIR) allows the
-    buildroot top directory to be read-only and shareable between multible builds.
+    buildroot top directory to be read-only and shareable between multiple builds.
     This follows what other scripts do, e.g. check-kernel-headers.sh.
 
     Signed-off-by: Henrique Marks <henrique.marks@datacom.ind.br>
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
