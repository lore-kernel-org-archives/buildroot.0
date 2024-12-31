Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9463E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 16:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90CFC408EE;
	Tue, 31 Dec 2024 16:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6M3ALPJ7k8x; Tue, 31 Dec 2024 16:07:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59054408F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59054408F0;
	Tue, 31 Dec 2024 16:07:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F5E8968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70080812EC
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYSBx-rSpzl6 for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 16:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A3D1812EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A3D1812EB
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 16:07:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 887C282BDC; Tue, 31 Dec 2024 16:07:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 31 Dec 2024 17:05:10 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 498406cfdbf0f7bacd92bf93b04b2943a30d15fe
X-Git-Newrev: 1bbcfb3b5b08b4fe3b4c7928ab0e01f94e9528ee
X-Patchwork-Hint: ignore
Message-Id: <20241231160728.887C282BDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gnupg2: bump to
 version 2.4.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1bbcfb3b5b08b4fe3b4c7928ab0e01f94e9528ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

See release announce:
https://lists.gnupg.org/pipermail/gnupg-announce/2024q4/000486.html

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add release announce link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b9b35b02fc5e24a6b8e7888380305e5171818a17)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 8bb64c9eda..e16a3f4910 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  ae0935ead29a2dfa34d6b48d70808652bc3ca73b  gnupg-2.4.5.tar.bz2
-sha256  f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277  gnupg-2.4.5.tar.bz2
+sha1  2d8aa2662c398d60f1f8e0bf46fd163eae703189  gnupg-2.4.6.tar.bz2
+sha256  95acfafda7004924a6f5c901677f15ac1bda2754511d973bb4523e8dd840e17a  gnupg-2.4.6.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 39b0a066f6..035f6af8c5 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.5
+GNUPG2_VERSION = 2.4.6
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
