Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3707C83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 22:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0411410A6;
	Mon, 28 Jul 2025 22:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGGPVJzCZjgE; Mon, 28 Jul 2025 22:53:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6C1541096
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C1541096;
	Mon, 28 Jul 2025 22:53:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 956EF15C
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 829D141096
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yucdA1g4vqYt for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 22:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D26D74108A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D26D74108A
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:53:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB4EC86B8F; Mon, 28 Jul 2025 22:53:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Jul 2025 00:52:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c261dd9122c6e03812d24c845d8e08b3d244ee2c
X-Git-Newrev: 60fe9b37333fe08c29037ebc0c6aa60736a9ca3f
X-Patchwork-Hint: ignore
Message-Id: <20250728225332.CB4EC86B8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qpid-proton: update mirror url
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60fe9b37333fe08c29037ebc0c6aa60736a9ca3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current mirror now only has the version 0.40.0 available.

Older version of apache packages moved to the "archive.apache.org"
location.

Fixes: https://autobuild.buildroot.org/results/853/853c354b9bde4408e122046496fd3f0e7ffb0b55
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qpid-proton/qpid-proton.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index fae6ecc413..1f92068f18 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -6,7 +6,7 @@
 
 QPID_PROTON_VERSION = 0.35.0
 QPID_PROTON_SITE = \
-	https://downloads.apache.org/qpid/proton/$(QPID_PROTON_VERSION)
+	https://archive.apache.org/dist/qpid/proton/$(QPID_PROTON_VERSION)
 QPID_PROTON_LICENSE = Apache-2.0
 QPID_PROTON_LICENSE_FILES = LICENSE.txt
 QPID_PROTON_CPE_ID_VENDOR = apache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
